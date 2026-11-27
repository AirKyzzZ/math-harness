import os
import subprocess
import sys
import time

import pytest

from math_harness.process import run_command


def test_timeout_kills_grandchildren_holding_the_pipes(tmp_path):
    start = time.monotonic()
    result = run_command(["sh", "-c", "sleep 30 & sleep 30"], tmp_path, timeout_s=1)
    assert time.monotonic() - start < 5
    assert result.timed_out and result.returncode == -1


def test_timeout_leaves_no_surviving_grandchild(tmp_path):
    pidfile = tmp_path / "pid"
    run_command(["sh", "-c", f"sleep 30 & echo $! > {pidfile}; wait"], tmp_path, timeout_s=1)
    pid = int(pidfile.read_text())
    deadline = time.monotonic() + 3
    while time.monotonic() < deadline:
        try:
            os.kill(pid, 0)
        except ProcessLookupError:
            return
        time.sleep(0.1)
    os.kill(pid, 9)
    raise AssertionError("grandchild survived the timeout")


def test_missing_executable_returns_127(tmp_path):
    result = run_command(["definitely-not-a-binary"], tmp_path)
    assert result.returncode == 127 and "definitely-not-a-binary" in result.stderr


def test_captures_output(tmp_path):
    result = run_command([sys.executable, "-c", "print('hi')"], tmp_path)
    assert result.returncode == 0 and result.stdout.strip() == "hi" and not result.timed_out


def alive(pid: int) -> bool:
    try:
        os.kill(pid, 0)
    except ProcessLookupError:
        return False
    return True


def test_timeout_is_bounded_when_a_descendant_escapes_the_group(tmp_path, monkeypatch):
    monkeypatch.setattr("math_harness.process.POST_KILL_GRACE_S", 1)
    pidfile = tmp_path / "pid"
    script = (
        "import subprocess,sys;"
        f"p=subprocess.Popen(['sleep','8'],start_new_session=True);open({str(pidfile)!r},'w').write(str(p.pid));"
        "import time;time.sleep(30)"
    )
    start = time.monotonic()
    result = run_command([sys.executable, "-c", script], tmp_path, timeout_s=1)
    elapsed = time.monotonic() - start
    if pidfile.exists():
        os.kill(int(pidfile.read_text()), 9)
    assert result.timed_out and result.returncode == -1
    assert elapsed < 5


def test_interrupt_kills_the_process_group(tmp_path, monkeypatch):
    seen = []

    def interrupted(self, *a, **kw):
        seen.append(self.pid)
        raise KeyboardInterrupt

    monkeypatch.setattr(subprocess.Popen, "communicate", interrupted)
    with pytest.raises(KeyboardInterrupt):
        run_command(["sleep", "30"], tmp_path)
    assert seen and not alive(seen[0])


def test_invalid_utf8_output_is_replaced_not_raised(tmp_path):
    code = "import sys; sys.stdout.buffer.write(b'ok\\xff\\xfe'); sys.stderr.buffer.write(b'\\x80bad')"
    result = run_command([sys.executable, "-c", code], tmp_path)
    assert "�" in result.stdout and result.stdout.startswith("ok")
    assert "�" in result.stderr

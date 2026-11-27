import os
from pathlib import Path

from math_harness.lean.elan import elan_bin_dir, with_elan_on_path
from math_harness.process import CommandResult


class Spy:
    def __init__(self) -> None:
        self.calls: list[tuple[list[str], Path, float | None, dict[str, str]]] = []

    def __call__(self, args, cwd, timeout_s=None, env=None):
        self.calls.append((list(args), cwd, timeout_s, dict(env)))
        return CommandResult(list(args), 0, "", "", 0.0, False)


def test_elan_bin_dir_defaults_to_home_dot_elan(monkeypatch):
    monkeypatch.delenv("ELAN_HOME", raising=False)
    assert elan_bin_dir() == Path.home() / ".elan" / "bin"


def test_elan_bin_dir_respects_elan_home(monkeypatch, tmp_path):
    monkeypatch.setenv("ELAN_HOME", str(tmp_path))
    assert elan_bin_dir() == tmp_path / "bin"
    assert elan_bin_dir({"ELAN_HOME": "/opt/elan"}) == Path("/opt/elan/bin")


def test_wrapper_passes_env_args_cwd_and_timeout_through(tmp_path):
    spy = Spy()
    with_elan_on_path(spy)(["lake", "update"], tmp_path, 5, {"FOO": "1", "PATH": "/usr/bin", "ELAN_HOME": "/e"})
    args, cwd, timeout_s, env = spy.calls[0]
    assert (args, cwd, timeout_s) == (["lake", "update"], tmp_path, 5)
    assert env == {"FOO": "1", "PATH": f"/e/bin{os.pathsep}/usr/bin", "ELAN_HOME": "/e"}


def test_wrapper_uses_process_env_when_none_given(monkeypatch, tmp_path):
    monkeypatch.setenv("FOO", "from-os")
    monkeypatch.setenv("ELAN_HOME", "/e")
    monkeypatch.setenv("PATH", "/bin")
    spy = Spy()
    with_elan_on_path(spy)(["lake"], tmp_path)
    env = spy.calls[0][3]
    assert env["FOO"] == "from-os" and env["PATH"] == f"/e/bin{os.pathsep}/bin"


def test_elan_bin_appears_once_and_first(tmp_path):
    spy = Spy()
    path = os.pathsep.join(["/usr/bin", "/e/bin", "/bin"])
    with_elan_on_path(with_elan_on_path(spy))(["lake"], tmp_path, None, {"PATH": path, "ELAN_HOME": "/e"})
    assert spy.calls[0][3]["PATH"] == os.pathsep.join(["/e/bin", "/usr/bin", "/bin"])


def test_empty_path_gets_only_elan_bin(tmp_path):
    spy = Spy()
    with_elan_on_path(spy)(["lake"], tmp_path, None, {"ELAN_HOME": "/e"})
    assert spy.calls[0][3]["PATH"] == "/e/bin"


def test_git_usr_bin_finds_git_for_windows_which(tmp_path):
    from math_harness.lean.elan import git_usr_bin

    (tmp_path / "Git" / "cmd").mkdir(parents=True)
    (tmp_path / "Git" / "usr" / "bin").mkdir(parents=True)
    (tmp_path / "Git" / "usr" / "bin" / "which.exe").write_bytes(b"MZ")
    git = tmp_path / "Git" / "cmd" / "git.exe"
    assert git_usr_bin(str(git)) == tmp_path / "Git" / "usr" / "bin"


def test_git_usr_bin_is_none_without_which(tmp_path):
    from math_harness.lean.elan import git_usr_bin

    (tmp_path / "Git" / "cmd").mkdir(parents=True)
    assert git_usr_bin(str(tmp_path / "Git" / "cmd" / "git.exe")) is None
    assert git_usr_bin(None) is None


def test_windows_runner_env_puts_git_usr_bin_on_path(tmp_path, monkeypatch):
    from math_harness.lean import elan

    usr_bin = tmp_path / "usr" / "bin"
    monkeypatch.setattr(elan, "IS_WINDOWS", True)
    monkeypatch.setattr(elan, "windows_which_dir", lambda: usr_bin)
    seen = {}

    def runner(args, cwd, timeout_s=None, env=None):
        seen.update(env)
        return CommandResult(list(args), 0, "", "", 0.0, False)

    elan.with_elan_on_path(runner)(["lake"], tmp_path, None, {"PATH": "/x", "ELAN_HOME": str(tmp_path / "e")})
    assert seen["PATH"].split(os.pathsep) == [str(tmp_path / "e" / "bin"), str(usr_bin), "/x"]

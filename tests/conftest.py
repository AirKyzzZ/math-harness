from pathlib import Path
from types import SimpleNamespace

import pytest

from math_harness.lean.workspace import CURRENT_MARKER
from math_harness.process import CommandResult


@pytest.fixture
def template_dir(tmp_path: Path) -> Path:
    template = tmp_path / "template"
    template.mkdir()
    (template / "lakefile.toml").write_text('name = "mhcheck"\n')
    (template / "lean-toolchain").write_text("leanprover/lean4:v4.37.0-rc1\n")
    (template / "lake-manifest.json").write_text("{}")
    return template


DATA = Path(__file__).parent / "data"


@pytest.fixture
def fake_template(tmp_path: Path) -> SimpleNamespace:
    home = tmp_path / "home"
    template = home / "template"
    template.mkdir(parents=True)
    (template / "lakefile.toml").write_text('name = "mhcheck"\n')
    (template / "lean-toolchain").write_text("leanprover/lean4:v4.37.0-rc1\n")
    (template / "lake-manifest.json").write_text("{}")
    (template / ".mh-template-ready").write_text(CURRENT_MARKER)
    return SimpleNamespace(home=home, template=template)


@pytest.fixture
def challenge_solution(tmp_path: Path) -> tuple[Path, Path]:
    challenge = tmp_path / "C.lean"
    solution = tmp_path / "S.lean"
    challenge.write_text("theorem t : True := by sorry")
    solution.write_text("theorem t : True := trivial")
    return challenge, solution


class RecordingRunner:
    def __init__(self, stdout: str, returncode: int = 0) -> None:
        self.stdout = stdout
        self.returncode = returncode
        self.calls: list[list[str]] = []
        self.cwds: list[Path] = []
        self.timeouts: list[float | None] = []
        self.envs: list[dict[str, str] | None] = []
        self.files: list[list[str]] = []

    def __call__(self, args, cwd, timeout_s=None, env=None):
        self.calls.append(list(args))
        self.cwds.append(cwd)
        self.timeouts.append(timeout_s)
        self.envs.append(None if env is None else dict(env))
        self.files.append(sorted(p.name for p in cwd.iterdir()))
        return CommandResult(list(args), self.returncode, self.stdout, "", 1.0, False)


@pytest.fixture
def recording_runner() -> RecordingRunner:
    return RecordingRunner((DATA / "comparator_accepted.json").read_text())

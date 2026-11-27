from typer.testing import CliRunner

from math_harness.cli import app


def test_version_flag_prints_version():
    result = CliRunner().invoke(app, ["--version"])
    assert result.exit_code == 0
    assert result.stdout.strip() == "mh 0.1.0"


def test_both_console_scripts_are_declared():
    import tomllib
    from pathlib import Path

    pyproject = tomllib.loads((Path(__file__).parent.parent / "pyproject.toml").read_text())
    scripts = pyproject["project"]["scripts"]
    assert scripts["mh"] == "math_harness.cli:app"
    assert scripts["math-harness"] == "math_harness.cli:app"


def test_bare_mh_prints_wordmark_and_commands():
    result = CliRunner().invoke(app, [])
    assert result.exit_code == 0
    assert "math-harness" in result.stdout
    assert "check" in result.stdout and "doctor" in result.stdout


def test_subcommands_print_no_banner():
    result = CliRunner().invoke(app, ["check", "--help"])
    assert "Checked, not claimed." not in result.stdout

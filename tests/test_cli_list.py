import json

from typer.testing import CliRunner

from math_harness import cli


def write(tmp_path, entries):
    path = tmp_path / "catalogue.json"
    path.write_text(json.dumps({"fc_revision": "abc1234", "built": "2026-11-28", "entries": entries}))
    return path


def entry(id, track, score, compiles=None, posts=0, status="open"):
    return {
        "id": id,
        "score": score,
        "compiles": compiles,
        "signals": {"track": track, "forum_posts": posts, "ep_status": status},
    }


def run(monkeypatch, path, *args):
    monkeypatch.setattr(cli, "CATALOGUE_FILE", path)
    return CliRunner().invoke(cli.app, ["list", *args], env={"COLUMNS": "160"})


def test_list_sorts_by_score_and_explains_the_score(tmp_path, monkeypatch):
    path = write(tmp_path, [entry("erdos_2", "open", 1.0), entry("erdos_1", "open", 5.0)])
    result = run(monkeypatch, path)
    assert result.exit_code == 0
    assert result.stdout.index("erdos_1") < result.stdout.index("erdos_2")
    assert "sort key, not a chance of success" in result.stdout


def test_list_filters_by_track_and_compiles(tmp_path, monkeypatch):
    path = write(
        tmp_path,
        [entry("erdos_10", "open", 3.0, True), entry("erdos_11", "formalize", 4.0, True), entry("erdos_12", "open", 2.0, False)],
    )
    result = run(monkeypatch, path, "--track", "open", "--compiles")
    assert "erdos_10" in result.stdout and "erdos_11" not in result.stdout and "erdos_12" not in result.stdout


def test_list_hides_formalized_and_respects_limit(tmp_path, monkeypatch):
    path = write(tmp_path, [entry(f"erdos_{i}", "open", float(i)) for i in range(30)] + [entry("erdos_99", "formalized", 99.0)])
    result = run(monkeypatch, path, "--limit", "5")
    assert "erdos_99" not in result.stdout
    assert sum(f"erdos_{i}" in result.stdout.split() for i in range(30)) == 5


def test_missing_catalogue_exits_2(tmp_path, monkeypatch):
    result = run(monkeypatch, tmp_path / "missing.json")
    assert result.exit_code == 2 and "catalogue" in result.stdout.lower()

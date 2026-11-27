from math_harness.lean.cache import cache_env, mathlib_imports


def test_mathlib_imports_are_collected_sorted_and_deduplicated(tmp_path):
    a = tmp_path / "A.lean"
    b = tmp_path / "B.lean"
    a.write_text("import Mathlib.NumberTheory.Harmonic.Int\nimport Mathlib.Data.Nat.Nth\n\ntheorem t : True := trivial\n")
    b.write_text("import Mathlib.Data.Nat.Nth\nimport Mathlib.FieldTheory.Finite.Basic\n")
    assert mathlib_imports(a, b) == [
        "Mathlib.Data.Nat.Nth",
        "Mathlib.FieldTheory.Finite.Basic",
        "Mathlib.NumberTheory.Harmonic.Int",
    ]


def test_whole_mathlib_import_is_kept(tmp_path):
    a = tmp_path / "A.lean"
    a.write_text("import Mathlib\n")
    assert mathlib_imports(a) == ["Mathlib"]


def test_non_mathlib_and_malformed_imports_are_ignored(tmp_path):
    a = tmp_path / "A.lean"
    a.write_text("import Lean\nimport Mathlib.Foo;rm\nimport Mathlib.--x\n-- import Mathlib.Data.Nat.Nth\ntheorem t : True := trivial\n")
    assert mathlib_imports(a) == []


def test_cache_env_points_lake_at_the_mh_cache(tmp_path):
    env = cache_env(tmp_path)
    assert env == {
        "LAKE_ARTIFACT_CACHE": "true",
        "LAKE_RESTORE_ARTIFACTS": "true",
        "LAKE_CACHE_DIR": str(tmp_path / "lake-cache"),
    }

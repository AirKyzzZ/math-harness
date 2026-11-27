import os
import re
from pathlib import Path

from math_harness.process import CommandRunner

IMPORT_LINE = re.compile(r"^import\s+(\S+)\s*$")
MATHLIB_MODULE = re.compile(r"^Mathlib(\.[A-Za-z_][A-Za-z0-9_']*)*$")
FILL_TIMEOUT_S = 600


def lake_cache_dir(home: Path) -> Path:
    return home / "lake-cache"


def cache_env(home: Path) -> dict[str, str]:
    return {
        "LAKE_ARTIFACT_CACHE": "true",
        "LAKE_RESTORE_ARTIFACTS": "true",
        "LAKE_CACHE_DIR": str(lake_cache_dir(home)),
    }


def mathlib_imports(*files: Path) -> list[str]:
    modules: set[str] = set()
    for file in files:
        for line in file.read_text(encoding="utf-8", errors="replace").splitlines():
            match = IMPORT_LINE.match(line)
            if match and MATHLIB_MODULE.match(match.group(1)):
                modules.add(match.group(1))
    return sorted(modules)


def fill_cache(template: Path, modules: list[str], home: Path, runner: CommandRunner) -> bool:
    if not modules:
        return False
    env = {**os.environ, **cache_env(home)}
    result = runner(["lake", "build", *modules], template, FILL_TIMEOUT_S, env)
    return result.returncode == 0 and not result.timed_out

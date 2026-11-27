import shutil
import sys
from collections.abc import Callable
from dataclasses import dataclass
from typing import Literal


@dataclass(frozen=True)
class PlatformInfo:
    os: Literal["linux", "macos", "windows", "other"]
    has_bwrap: bool


def detect_platform(which: Callable[[str], str | None] = shutil.which) -> PlatformInfo:
    if sys.platform.startswith("linux"):
        os_name = "linux"
    elif sys.platform == "darwin":
        os_name = "macos"
    elif sys.platform == "win32":
        os_name = "windows"
    else:
        os_name = "other"
    return PlatformInfo(os=os_name, has_bwrap=os_name == "linux" and which("bwrap") is not None)

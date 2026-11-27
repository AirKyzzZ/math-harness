import sys

from math_harness.platform import PlatformInfo, detect_platform


def test_detect_platform_macos_without_bwrap(monkeypatch):
    monkeypatch.setattr(sys, "platform", "darwin")
    assert detect_platform(which=lambda _: None) == PlatformInfo(os="macos", has_bwrap=False)


def test_detect_platform_linux_with_bwrap(monkeypatch):
    monkeypatch.setattr(sys, "platform", "linux")
    assert detect_platform(which=lambda name: "/usr/bin/bwrap") == PlatformInfo(os="linux", has_bwrap=True)


def test_detect_platform_windows(monkeypatch):
    monkeypatch.setattr(sys, "platform", "win32")
    assert detect_platform(which=lambda name: "C:/bwrap.exe") == PlatformInfo(os="windows", has_bwrap=False)


def test_detect_platform_other(monkeypatch):
    monkeypatch.setattr(sys, "platform", "freebsd14")
    assert detect_platform(which=lambda _: None).os == "other"


def test_bwrap_on_path_outside_linux_is_ignored(monkeypatch):
    monkeypatch.setattr(sys, "platform", "darwin")
    assert detect_platform(which=lambda name: "/opt/homebrew/bin/bwrap").has_bwrap is False

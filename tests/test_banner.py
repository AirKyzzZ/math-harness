import io

from rich.console import Console

from math_harness.ui.banner import COMPACT_MIN, WIDE_MIN, layout_for, render_banner


def _render(width: int, tty: bool = True, no_color: bool = False) -> str:
    buf = io.StringIO()
    console = Console(file=buf, width=width, force_terminal=tty, no_color=no_color, color_system="truecolor" if tty else "auto")
    render_banner(console, "0.1.0")
    return buf.getvalue()


def test_breakpoints_are_ordered():
    assert COMPACT_MIN < WIDE_MIN
    assert layout_for(WIDE_MIN) == "wide"
    assert layout_for(WIDE_MIN - 1) == "compact"
    assert layout_for(COMPACT_MIN - 1) == "minimal"


def test_wide_has_tagline_beside_art():
    out = _render(WIDE_MIN)
    assert "Checked, not claimed." in out and ("▀" in out or "▄" in out)
    tagline_line = next(line for line in out.splitlines() if "Checked, not claimed." in line)
    assert "▀" in tagline_line or "▄" in tagline_line or "█" in tagline_line


def test_compact_stacks_text_under_art():
    out = _render(WIDE_MIN - 1)
    tagline_line = next(line for line in out.splitlines() if "Checked, not claimed." in line)
    assert not any(ch in tagline_line for ch in "▀▄█")


def test_narrow_terminal_gets_minimal():
    out = _render(20)
    assert "math-harness" in out and not any(ch in out for ch in "▀▄█")


def test_no_color_gets_plain_wordmark():
    out = _render(120, no_color=True)
    assert "\x1b[38;2" not in out and "math-harness" in out


def test_non_tty_gets_plain_wordmark():
    out = _render(120, tty=False)
    assert "\x1b[" not in out and out.strip() == "math-harness"

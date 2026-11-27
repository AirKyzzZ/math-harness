from typing import Literal

from rich.console import Console
from rich.style import Style
from rich.text import Text

from math_harness.ui.logo_art import LOGO

ORANGE = "#FF5A1F"
WORDMARK = "math-harness"
TAGLINE = "Checked, not claimed."
INDENT = 2
COLUMN_GAP = 3

ART_WIDTH = len(LOGO[0])
WIDE_MIN = INDENT + ART_WIDTH + COLUMN_GAP + len(TAGLINE)
COMPACT_MIN = INDENT + max(ART_WIDTH, len(TAGLINE))

Layout = Literal["wide", "compact", "minimal"]


def layout_for(width: int) -> Layout:
    if width >= WIDE_MIN:
        return "wide"
    if width >= COMPACT_MIN:
        return "compact"
    return "minimal"


def _cell(top: str | None, bottom: str | None) -> tuple[str, Style]:
    if top is None and bottom is None:
        return " ", Style()
    if top is None:
        return "▄", Style(color=bottom)
    if bottom is None or top == bottom:
        return ("█" if bottom else "▀"), Style(color=top)
    return "▀", Style(color=top, bgcolor=bottom)


def _art_lines() -> list[Text]:
    lines = []
    for row in LOGO:
        line = Text()
        for top, bottom in row:
            char, style = _cell(top, bottom)
            line.append(char, style)
        lines.append(line)
    return lines


def _text_block(version: str) -> list[Text]:
    return [
        Text(WORDMARK, style=Style(bold=True)),
        Text(TAGLINE, style=Style(dim=True)),
        Text(f"v{version}", style=Style(dim=True)),
    ]


def _wide(version: str) -> list[Text]:
    art = _art_lines()
    block = _text_block(version)
    top = max(0, round((len(art) - len(block)) / 2))
    lines = []
    for i, art_line in enumerate(art):
        line = Text(" " * INDENT) + art_line
        if top <= i < top + len(block):
            line += Text(" " * COLUMN_GAP) + block[i - top]
        lines.append(line)
    return lines


def _compact(version: str) -> list[Text]:
    pad = Text(" " * INDENT)
    return [pad + line for line in _art_lines()] + [Text("")] + [pad + line for line in _text_block(version)]


def render_banner(console: Console, version: str) -> None:
    layout = "minimal" if console.no_color or not console.is_terminal else layout_for(console.width)
    if layout == "minimal":
        console.print(Text(WORDMARK, style=Style(bold=True, color=ORANGE)))
        return
    lines = _wide(version) if layout == "wide" else _compact(version)
    console.print()
    for line in lines:
        console.print(line, no_wrap=True, overflow="crop")
    console.print()

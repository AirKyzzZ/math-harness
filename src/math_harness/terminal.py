import re

DETAIL_MAX_LINES = 40

ESCAPE_SEQUENCES = re.compile(r"\x1b\][^\x07\x1b]*(?:\x07|\x1b\\)?|\x1b\[[0-?]*[ -/]*[@-~]|\x1b.?")
CONTROL_CHARS = re.compile(r"[\x00-\x08\x0b-\x1f\x7f-\x9f]")


def sanitize(text: str) -> str:
    return CONTROL_CHARS.sub("", ESCAPE_SEQUENCES.sub("", text))


def truncate(text: str, max_lines: int = DETAIL_MAX_LINES) -> str:
    lines = sanitize(text).splitlines()
    if len(lines) <= max_lines:
        return "\n".join(lines)
    return "\n".join(lines[:max_lines] + [f"... ({len(lines) - max_lines} more lines)"])

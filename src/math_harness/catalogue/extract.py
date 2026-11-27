import re
from dataclasses import dataclass, field

DECL = re.compile(
    r"^(?:(?:private|protected|noncomputable|unsafe|partial)\s+)*"
    r"(theorem|lemma|def|abbrev|instance|structure|inductive|class|example|opaque|axiom)\b\s*([^\s:(]*)"
)
DROPPED_LINE = re.compile(r"^(module\s*$|public import |meta import |import |@\[expose\] public section)")
METADATA_ATTR = re.compile(r"^(category\b|AMS\b|question\b|formal_proof\b|optimization_constant\b)")
OPEN_CATEGORIES = ("research open", "research solved")
OPENERS, CLOSERS = "([{⦃⟨", ")]}⦄⟩"


@dataclass(frozen=True)
class Statement:
    id: str
    problem: str
    category: str
    question: bool
    statement: str
    challenge: str
    challenge_neg: str | None
    formal_proof: bool = False


@dataclass
class Chunk:
    prefix: list[str] = field(default_factory=list)
    attrs: list[str] = field(default_factory=list)
    lines: list[str] = field(default_factory=list)
    kind: str | None = None
    name: str = ""

    @property
    def text(self) -> str:
        return "\n".join(self.lines).rstrip()

    @property
    def is_sorry(self) -> bool:
        if self.kind not in ("theorem", "lemma", "def", "abbrev"):
            return False
        return _split_body(self.text) is not None and bool(re.search(r"\bsorry\s*$", _drop_line_comments(self.text)))


def _scan(text: str):
    i, depth, n = 0, 0, len(text)
    while i < n:
        ch = text[i]
        if text.startswith("--", i):
            end = text.find("\n", i)
            i = n if end == -1 else end
            continue
        if ch == '"':
            end = i + 1
            while end < n and text[end] != '"':
                end += 2 if text[end] == "\\" else 1
            i = end + 1
            continue
        if ch in OPENERS:
            depth += 1
        elif ch in CLOSERS:
            depth -= 1
        yield i, ch, depth
        i += 1


def _drop_line_comments(text: str) -> str:
    return re.sub(r"--[^\n]*", "", text)


def _split_body(text: str) -> tuple[str, str] | None:
    candidates = [i for i, ch, depth in _scan(text) if ch == ":" and depth == 0 and text[i + 1 : i + 2] == "="]
    for i in candidates:
        if re.match(r"\s*(by\b|sorry\b)", _drop_line_comments(text[i + 2 :])):
            return text[:i], text[i + 2 :]
    return (text[: candidates[-1]], text[candidates[-1] + 2 :]) if candidates else None


def _split_attrs(raw: str) -> list[str]:
    items, current, depth, in_string = [], "", 0, False
    for ch in raw:
        if ch == '"':
            in_string = not in_string
        elif not in_string and ch in OPENERS:
            depth += 1
        elif not in_string and ch in CLOSERS:
            depth -= 1
        elif ch == "," and depth == 0 and not in_string:
            items.append(current.strip())
            current = ""
            continue
        current += ch
    if current.strip():
        items.append(current.strip())
    return items


def _attr_end(text: str) -> int | None:
    depth, in_string = 0, False
    for i, ch in enumerate(text):
        if ch == '"':
            in_string = not in_string
        elif not in_string and ch == "[":
            depth += 1
        elif not in_string and ch == "]":
            depth -= 1
            if depth == 0:
                return i
    return None


def _strip_block_comments(source: str) -> str:
    out, depth, i, n = [], 0, 0, len(source)
    while i < n:
        if source.startswith("/-", i):
            depth += 1
            i += 2
        elif depth and source.startswith("-/", i):
            depth -= 1
            i += 2
        elif depth:
            if source[i] == "\n":
                out.append("\n")
            i += 1
        elif source.startswith("--", i):
            end = source.find("\n", i)
            end = n if end == -1 else end
            out.append(source[i:end])
            i = end
        else:
            out.append(source[i])
            i += 1
    return "".join(out)


def _chunks(source: str) -> list[Chunk]:
    raw = [line.rstrip() for line in _strip_block_comments(source).splitlines()]
    lines = [line for line in raw if not DROPPED_LINE.match(line.lstrip())]
    chunks: list[Chunk] = []
    pending = Chunk()
    current: Chunk | None = None
    attr_buffer = ""
    queue = list(reversed(lines))
    while queue:
        line = queue.pop()
        if attr_buffer:
            line = attr_buffer + " " + line.strip()
            attr_buffer = ""
        elif not line.strip():
            if current is not None:
                current.lines.append(line)
            continue
        elif line[0].isspace() and current is not None:
            current.lines.append(line)
            continue
        line = line.lstrip()
        current = None
        if line.startswith("@["):
            end = _attr_end(line)
            if end is None:
                attr_buffer = line
                continue
            pending.attrs.extend(_split_attrs(line[2:end]))
            rest = line[end + 1 :].strip()
            if rest:
                queue.append(rest)
            continue
        if re.match(r"^(set_option|open|omit|include)\b.*\bin\s*$", line):
            pending.prefix.append(line)
            continue
        match = DECL.match(line)
        if match:
            pending.kind, pending.name = match.group(1), match.group(2)
        pending.lines.append(line)
        chunks.append(pending)
        current = pending if match else None
        pending = Chunk()
    return chunks


def _render(chunk: Chunk) -> str:
    prefix = [p for p in chunk.prefix if not p.startswith("set_option linter")]
    kept = [a for a in chunk.attrs if not METADATA_ATTR.match(a)]
    attr_line = [f"@[{', '.join(kept)}]"] if kept else []
    return "\n".join([*prefix, *attr_line, chunk.text])


def _header(chunk: Chunk) -> str:
    split = _split_body(chunk.text)
    if split is None:
        raise ValueError(f"no `:=` in {chunk.name}")
    return split[0].split(chunk.name, 1)[1].rstrip()


def _binders_and_type(header: str, name: str) -> tuple[str, str]:
    for i, ch, depth in _scan(header):
        if ch == ":" and depth == 0:
            return header[:i].strip(), header[i + 1 :].rstrip()
    raise ValueError(f"no type found for {name}")


def negate_signature(binders: str, typ: str) -> str:
    body = typ.lstrip("\n")
    return f"¬ (∀ {binders},\n{body}\n    )" if binders else f"¬ (\n{body}\n    )"


def _target_text(chunk: Chunk, name: str, header: str) -> str:
    prefix = [p for p in chunk.prefix if not p.startswith("set_option linter")]
    return "\n".join([*prefix, f"theorem {name}{header} := by\n  sorry"])


def _assemble(chunks: list[Chunk], target: Chunk, target_text: str) -> str:
    body = []
    for chunk in chunks:
        if chunk is target:
            body.append(target_text)
        elif not chunk.is_sorry:
            body.append(_render(chunk))
    return "import Mathlib\n\n" + "\n\n".join(body).strip() + "\n"


def _category(chunk: Chunk) -> str | None:
    if chunk.kind not in ("theorem", "lemma") or not chunk.is_sorry:
        return None
    categories = [a.removeprefix("category").strip() for a in chunk.attrs if a.startswith("category")]
    if not categories or categories[0] not in OPEN_CATEGORIES:
        return None
    if any(a.startswith("question") and "value" in a for a in chunk.attrs) or "answer(" in chunk.text:
        return None
    return categories[0]


def extract_statements(source: str, problem: str) -> list[Statement]:
    chunks = _chunks(source)
    statements = []
    for chunk in chunks:
        category = _category(chunk)
        if category is None:
            continue
        header = _header(chunk)
        binders, typ = _binders_and_type(header, chunk.name)
        question = "question" in chunk.attrs
        challenge = _assemble(chunks, chunk, _target_text(chunk, chunk.name, header))
        challenge_neg = None
        if question:
            neg_header = f" :\n    {negate_signature(binders, typ)}"
            challenge_neg = _assemble(chunks, chunk, _target_text(chunk, f"{chunk.name}_neg", neg_header))
        display = " ".join(_drop_line_comments(f"{binders} : {typ}").split())
        statements.append(
            Statement(
                chunk.name,
                problem,
                category,
                question,
                display,
                challenge,
                challenge_neg,
                any(a.startswith("formal_proof") for a in chunk.attrs),
            )
        )
    return statements

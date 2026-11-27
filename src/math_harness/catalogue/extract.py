import re
from dataclasses import dataclass, field

DECL = re.compile(
    r"^(?:(?:private|protected|noncomputable|unsafe|partial)\s+)*"
    r"(theorem|lemma|def|abbrev|instance|structure|inductive|class|example|opaque|axiom)\b\s*([^\s:(]*)"
)
DROPPED_LINE = re.compile(r"^(module\s*$|public import |import |@\[expose\] public section)")
METADATA_ATTR = re.compile(r"^(category\b|AMS\b|question\b|formal_proof\b|optimization_constant\b)")
SORRY_BODY = re.compile(r":=\s*(by\s*)?sorry\s*$")
OPEN_CATEGORIES = ("research open", "research solved")


@dataclass(frozen=True)
class Statement:
    id: str
    problem: str
    category: str
    question: bool
    statement: str
    challenge: str
    challenge_neg: str | None


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
        return self.kind in ("theorem", "lemma", "def", "abbrev") and bool(SORRY_BODY.search(self.text))


def _split_attrs(raw: str) -> list[str]:
    items, depth, current = [], 0, ""
    for ch in raw:
        if ch == "," and depth == 0:
            items.append(current.strip())
            current = ""
            continue
        depth += ch in "([{\""
        depth -= ch in ")]}"
        current += ch
    if current.strip():
        items.append(current.strip())
    return items


def _strip_comments(lines: list[str]) -> list[str]:
    out, depth = [], 0
    for line in lines:
        if depth == 0 and not line.lstrip().startswith("/-"):
            out.append(line)
            continue
        depth += line.count("/-")
        depth -= line.count("-/")
        depth = max(depth, 0)
    return out


def _chunks(source: str) -> list[Chunk]:
    lines = [line for line in _strip_comments(source.splitlines()) if not DROPPED_LINE.match(line)]
    chunks: list[Chunk] = []
    pending = Chunk()
    current: Chunk | None = None
    attr_buffer = ""
    for line in lines:
        if attr_buffer:
            attr_buffer += " " + line.strip()
            if attr_buffer.count("[") <= attr_buffer.count("]"):
                pending.attrs.extend(_split_attrs(attr_buffer[2:-1]))
                attr_buffer = ""
            continue
        if not line.strip():
            if current is not None:
                current.lines.append(line)
            continue
        if line[0].isspace() and current is not None:
            current.lines.append(line)
            continue
        current = None
        if line.startswith("@["):
            attr_buffer = line.strip()
            if attr_buffer.count("[") <= attr_buffer.count("]"):
                pending.attrs.extend(_split_attrs(attr_buffer[2:-1]))
                attr_buffer = ""
            continue
        if re.match(r"^(set_option|open)\b.*\bin\s*$", line):
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


def _signature(chunk: Chunk) -> tuple[str, str]:
    header = SORRY_BODY.sub("", chunk.text)
    after_name = header.split(chunk.name, 1)[1]
    depth = 0
    for i, ch in enumerate(after_name):
        if ch in "([{⦃":
            depth += 1
        elif ch in ")]}⦄":
            depth -= 1
        elif ch == ":" and depth == 0 and after_name[i + 1 : i + 2] != "=":
            return " ".join(after_name[:i].split()), " ".join(after_name[i + 1 :].split())
    raise ValueError(f"no type found for {chunk.name}")


def negate_signature(binders: str, typ: str) -> str:
    return f"¬ (∀ {binders}, {typ})" if binders else f"¬ ({typ})"


def _target_text(chunk: Chunk, name: str, signature: str) -> str:
    prefix = [p for p in chunk.prefix if not p.startswith("set_option linter")]
    return "\n".join([*prefix, f"theorem {name}{signature} := by\n  sorry"])


def _assemble(chunks: list[Chunk], target: Chunk, target_text: str) -> str:
    body = []
    for chunk in chunks:
        if chunk is target:
            body.append(target_text)
        elif not chunk.is_sorry:
            body.append(_render(chunk))
    return "import Mathlib\n\n" + "\n\n".join(body).strip() + "\n"


def _is_target(chunk: Chunk, problem: str) -> str | None:
    if chunk.kind not in ("theorem", "lemma") or not chunk.is_sorry:
        return None
    if not re.match(rf"^erdos_{problem}($|\.)", chunk.name):
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
        category = _is_target(chunk, problem)
        if category is None:
            continue
        binders, typ = _signature(chunk)
        question = any(a == "question" for a in chunk.attrs)
        signature = f" {binders} :\n    {typ}" if binders else f" :\n    {typ}"
        challenge = _assemble(chunks, chunk, _target_text(chunk, chunk.name, signature))
        challenge_neg = None
        if question:
            neg = f" :\n    {negate_signature(binders, typ)}"
            challenge_neg = _assemble(chunks, chunk, _target_text(chunk, f"{chunk.name}_neg", neg))
        statements.append(
            Statement(chunk.name, problem, category, question, f"{binders} : {typ}".strip(), challenge, challenge_neg)
        )
    return statements

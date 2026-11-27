import json
from pathlib import Path

DATA_DIR = Path(__file__).parent / "data"
CATALOGUE_FILE = DATA_DIR / "catalogue.json"


class CatalogueError(RuntimeError):
    pass


def load_catalogue(path: Path | None = None) -> dict:
    path = path or CATALOGUE_FILE
    try:
        doc = json.loads(path.read_text(encoding="utf-8"))
    except (OSError, json.JSONDecodeError) as exc:
        raise CatalogueError(f"cannot read catalogue {path}: {exc}") from exc
    if not isinstance(doc, dict) or not isinstance(doc.get("entries"), list):
        raise CatalogueError(f"{path} has no entries list")
    return doc

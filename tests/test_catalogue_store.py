import json

import pytest

from math_harness.catalogue.store import CatalogueError, load_catalogue


def test_load_reads_entries(tmp_path):
    path = tmp_path / "catalogue.json"
    path.write_text(json.dumps({"fc_revision": "abc", "entries": [{"id": "erdos_1", "score": 1.0}]}))
    assert load_catalogue(path)["entries"][0]["id"] == "erdos_1"


def test_file_without_entries_is_rejected(tmp_path):
    path = tmp_path / "catalogue.json"
    path.write_text(json.dumps({"fc_revision": "abc"}))
    with pytest.raises(CatalogueError):
        load_catalogue(path)


def test_missing_file_is_a_catalogue_error(tmp_path):
    with pytest.raises(CatalogueError):
        load_catalogue(tmp_path / "nope.json")

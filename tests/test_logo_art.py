from math_harness.ui.logo_art import LOGO


def test_logo_is_rectangular_and_small():
    assert 6 <= len(LOGO) <= 12
    widths = {len(row) for row in LOGO}
    assert len(widths) == 1 and 16 <= widths.pop() <= 32


def test_logo_uses_brand_colours():
    colours = {c for row in LOGO for cell in row for c in cell if c}
    assert "#FF5A1F" in colours

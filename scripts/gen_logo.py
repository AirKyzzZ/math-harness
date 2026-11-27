import argparse
import subprocess
import tempfile
from pathlib import Path

from PIL import Image

ROOT = Path(__file__).resolve().parent.parent
ICON = ROOT / "docs" / "brand" / "icon.svg"
OUTPUT = ROOT / "src" / "math_harness" / "ui" / "logo_art.py"
RENDER_SIZE = 1024
BRAND = {"#121212": (18, 18, 18), "#FF5A1F": (255, 90, 31), "#F2EFE8": (242, 239, 232)}
PAPER = "#F2EFE8"


def classify(rgb: tuple[int, int, int]) -> str:
    r, g, b = rgb
    if r - b > 90:
        return "#FF5A1F"
    return "#121212" if (r + g + b) / 3 < 130 else PAPER


def glyph_box(image: Image.Image, pad: int) -> tuple[int, int, int, int]:
    paper = BRAND[PAPER]
    xs, ys = [], []
    for y in range(image.height):
        for x in range(image.width):
            if sum(abs(a - b) for a, b in zip(image.getpixel((x, y)), paper)) > 60:
                xs.append(x)
                ys.append(y)
    return min(xs) - pad, min(ys) - pad, max(xs) + pad + 1, max(ys) + pad + 1


def cells(cols: int, pad: int) -> list[list[tuple[str, str]]]:
    with tempfile.TemporaryDirectory() as tmp:
        png = Path(tmp) / "icon.png"
        subprocess.run(["rsvg-convert", "-w", str(RENDER_SIZE), str(ICON), "-o", str(png)], check=True)
        rgba = Image.open(png).convert("RGBA")
    image = Image.new("RGB", rgba.size, BRAND[PAPER])
    image.paste(rgba, mask=rgba.getchannel("A"))
    box = glyph_box(image, pad)
    crop = image.crop(box)
    rows = round(cols * crop.height / crop.width / 2) * 2
    small = crop.resize((cols, rows), Image.Resampling.BOX)
    grid = [[classify(small.getpixel((x, y))) for x in range(cols)] for y in range(rows)]
    return [[(grid[y][x], grid[y + 1][x]) for x in range(cols)] for y in range(0, rows, 2)]


def write_module(art: list[list[tuple[str, str]]]) -> None:
    body = ",\n".join("    (" + ", ".join(repr(cell) for cell in row) + ",)" for row in art)
    OUTPUT.write_text(f"LOGO: tuple[tuple[tuple[str | None, str | None], ...], ...] = (\n{body},\n)\n")


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--cols", type=int, default=32)
    parser.add_argument("--pad", type=int, default=40)
    args = parser.parse_args()
    write_module(cells(args.cols, args.pad))


if __name__ == "__main__":
    main()

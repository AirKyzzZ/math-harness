import os
import re
import sys

from PIL import Image, ImageDraw, ImageFont

FONTS = [
    *([os.environ["MH_SCREENSHOT_FONT"]] if os.environ.get("MH_SCREENSHOT_FONT") else []),
    "/System/Library/Fonts/Menlo.ttc",
    "/System/Library/Fonts/Monaco.ttf",
    "/System/Library/Fonts/SFNSMono.ttf",
    "/usr/share/fonts/truetype/dejavu/DejaVuSansMono.ttf",
    "/usr/share/fonts/TTF/DejaVuSansMono.ttf",
    "/usr/share/fonts/truetype/liberation/LiberationMono-Regular.ttf",
    "C:/Windows/Fonts/consola.ttf",
]
SYMBOL_FONTS = [
    "/System/Library/Fonts/Apple Symbols.ttf",
    "/System/Library/Fonts/AppleSDGothicNeo.ttc",
]

BG = (18, 18, 18)
BAR = (34, 34, 36)
LIGHTS = [(255, 95, 87), (254, 188, 46), (40, 200, 64)]
FG = (222, 222, 228)

BASE = [
    (0, 0, 0), (205, 49, 49), (13, 188, 121), (229, 229, 16),
    (36, 114, 200), (188, 63, 188), (17, 168, 205), (229, 229, 229),
]
BRIGHT = [
    (102, 102, 102), (241, 76, 76), (35, 209, 139), (245, 245, 67),
    (59, 142, 234), (214, 112, 214), (41, 184, 219), (255, 255, 255),
]

SGR = re.compile(r"\x1b\[([0-9;]*)m")
OTHER_ESC = re.compile(r"\x1b\[[0-9;?]*[A-Za-ln-z]|\x1b\][^\x07]*\x07")
# Font rasterisers draw U+2580/U+2584 as slivers that do not tile, so blocks are painted as rectangles.
BLOCKS = {"█": "full", "▀": "upper", "▄": "lower", "▌": "left", "▐": "right"}


class Pen:
    def __init__(self):
        self.reset()

    def reset(self):
        self.fg = FG
        self.bg = None
        self.bold = False
        self.dim = False

    def paint(self):
        fg = tuple(round(c * 0.55) for c in self.fg) if self.dim else self.fg
        return fg, self.bg


def xterm256(n):
    if n < 8:
        return BASE[n]
    if n < 16:
        return BRIGHT[n - 8]
    if n < 232:
        n -= 16
        steps = [0, 95, 135, 175, 215, 255]
        return (steps[n // 36], steps[(n // 6) % 6], steps[n % 6])
    v = 8 + (n - 232) * 10
    return (v, v, v)


def apply_sgr(pen, codes):
    i = 0
    while i < len(codes):
        c = codes[i]
        if c == 0:
            pen.reset()
        elif c == 1:
            pen.bold = True
        elif c == 2:
            pen.dim = True
        elif c == 22:
            pen.bold = pen.dim = False
        elif 30 <= c <= 37:
            pen.fg = BASE[c - 30]
        elif c == 39:
            pen.fg = FG
        elif 40 <= c <= 47:
            pen.bg = BASE[c - 40]
        elif c == 49:
            pen.bg = None
        elif 90 <= c <= 97:
            pen.fg = BRIGHT[c - 90]
        elif 100 <= c <= 107:
            pen.bg = BRIGHT[c - 100]
        elif c in (38, 48) and i + 1 < len(codes):
            target = "fg" if c == 38 else "bg"
            mode = codes[i + 1]
            if mode == 2 and i + 4 < len(codes):
                setattr(pen, target, tuple(codes[i + 2 : i + 5]))
                i += 4
            elif mode == 5 and i + 2 < len(codes):
                setattr(pen, target, xterm256(codes[i + 2]))
                i += 2
        i += 1


def parse(text):
    pen = Pen()
    rows = []
    for raw in OTHER_ESC.sub("", text).replace("\r", "").split("\n"):
        row, i = [], 0
        while i < len(raw):
            m = SGR.match(raw, i)
            if m:
                apply_sgr(pen, [int(c) for c in m.group(1).split(";") if c != ""] or [0])
                i = m.end()
                continue
            fg, bg = pen.paint()
            row.append((raw[i], fg, bg, pen.bold))
            i += 1
        rows.append(row)
    while rows and not any(ch != " " for ch, *_ in rows[-1]):
        rows.pop()
    return rows


def load(paths, size, index=0):
    for path in paths:
        try:
            return ImageFont.truetype(path, size, index=index)
        except OSError:
            continue
    return None


def render(rows, out, size=17, pad=28):
    font = load(FONTS, size)
    bold = load(FONTS, size, index=1) or font
    symbols = load(SYMBOL_FONTS, size)
    if font is None:
        raise SystemExit("no monospace font available")

    cw = round(font.getlength("M"))
    ch = round(size * 1.55)
    cols = max((len(r) for r in rows), default=0)
    bar = 36
    width, height = pad * 2 + cw * cols, bar + pad * 2 + ch * len(rows)
    img = Image.new("RGB", (width, height), BG)
    d = ImageDraw.Draw(img)
    d.rectangle([0, 0, width, bar], fill=BAR)
    for i, colour in enumerate(LIGHTS):
        cx = 20 + i * 20
        d.ellipse([cx - 6, bar // 2 - 6, cx + 6, bar // 2 + 6], fill=colour)
    mask = Image.new("L", img.size, 0)
    ImageDraw.Draw(mask).rounded_rectangle([0, 0, width - 1, height - 1], radius=12, fill=255)
    rounded = Image.new("RGBA", img.size, (0, 0, 0, 0))
    pad_top = bar

    for y, row in enumerate(rows):
        for x, (chx, fg, bg, is_bold) in enumerate(row):
            px, py = pad + x * cw, pad_top + pad + y * ch
            if bg:
                d.rectangle([px, py, px + cw, py + ch], fill=bg)
            kind = BLOCKS.get(chx)
            if kind == "full":
                d.rectangle([px, py, px + cw, py + ch], fill=fg)
            elif kind == "upper":
                d.rectangle([px, py, px + cw, py + ch // 2], fill=fg)
            elif kind == "lower":
                d.rectangle([px, py + ch // 2, px + cw, py + ch], fill=fg)
            elif kind == "left":
                d.rectangle([px, py, px + cw // 2, py + ch], fill=fg)
            elif kind == "right":
                d.rectangle([px + cw // 2, py, px + cw, py + ch], fill=fg)
            elif chx != " ":
                f = bold if is_bold else font
                if ord(chx) > 0x2100 and symbols and not font.getmask(chx).getbbox():
                    f = symbols
                d.text((px, py + (ch - size) // 2 - 1), chx, font=f, fill=fg)

    rounded.paste(img, mask=mask)
    rounded.save(out)
    return rounded.size


if __name__ == "__main__":
    src, dst, args = sys.argv[1], sys.argv[2], sys.argv[3:]
    size = int(args[args.index("--size") + 1]) if "--size" in args else 17
    pad = int(args[args.index("--pad") + 1]) if "--pad" in args else 28
    with open(src, encoding="utf-8") as fh:
        print(render(parse(fh.read()), dst, size=size, pad=pad))

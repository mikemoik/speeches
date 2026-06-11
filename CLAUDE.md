# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repo is

LaTeX sources for tech-talk slides. Engine: **lualatex** (pinned in `.latexmkrc`). Class: **beamer** with the **metropolis** theme. Code blocks use **minted** (requires `-shell-escape` and the `pygmentize` binary).

## Build

```
make              # one-shot build → main.pdf
make watch        # rebuild on save, refresh viewer
make clean        # remove aux files (keep PDF)
make distclean    # remove aux files AND the PDF
```

The Makefile is a thin wrapper around `latexmk` — it owns no build logic. `.latexmkrc` sets `$pdf_mode = 4` (lualatex) and passes `-shell-escape`, so `latexmk main.tex` directly is equivalent.

## Engine notes for pdflatex refugees

- **No** `\usepackage[utf8]{inputenc}` or `[T1]{fontenc}` — lualatex is Unicode-native.
- Fonts come from `fontspec` / `unicode-math` and resolve against system OpenType fonts (and the ones TeX Live bundles, e.g. Fira).
- `tikz`, `pgfplots`, `booktabs`, `hyperref` all work unchanged.
- Frames containing `minted` (or any verbatim) still need `[fragile]`.
- First build after a font change can be slow because `luaotfload` rebuilds its font cache; subsequent builds are fast.

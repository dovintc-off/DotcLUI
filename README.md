# DotcLUI  
> **Do**vintc **t**iny, **c**ustom **L**ÖVE2D **UI** framework  
> A lightweight, modular UI toolkit for LÖVE (Love2D) — built for clarity, theming, and rapid prototyping.

![LÖVE2D](https://img.shields.io/badge/LÖVE2D-11.5%2B-ff6600?logo=love2d)
![Lua](https://img.shields.io/badge/Lua-5.3%2B-000080?logo=lua)
![License](https://img.shields.io/badge/License-MIT-blue)
![DotcLUI](https://img.shields.io/badge/DotcLUI-0.1-green?style=flat&labelColor=gray)
![Python](https://img.shields.io/badge/Python-3.14-yellow?style=flat&labelColor=gray)

---

## Features

- ✅ **Modular design** — `button`, `text`
- ✅ **Outline text rendering** (stroke + fill)
- ✅ **Rounded rectangles** with configurable radius
- ✅ **Dynamic theming** — fonts, colors, padding
- ✅ **Simple API** — `btn = DotcLUI.button.new({...})`, `DotcLUI.ui.text.new({...})`
- ✅ **No external dependencies** (pure Lua + LÖVE)

---

## Quick Start

### 1. Clone & Run
```bash
git clone https://github.com/Dovintc-off/DotcLUI.git
love .
```

### 2. How Use

```Lua
DotcLUI = require("DotcLUI.init")

function love.draw()
    DotcLUI.ui.text.new({
        ...
    })
end
```
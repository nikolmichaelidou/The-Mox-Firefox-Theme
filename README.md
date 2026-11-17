# The Mox — Firefox Theme

A Cyberpunk 2077 Mox-inspired Firefox theme using the uploaded Mox SVG logo and the Core Mox palette.

## Uploaded artwork

- `assets/moxlogo.svg` — extension icon and header artwork
- `assets/moxlogo.jpg` — JPEG backup of the logo

No theme artwork is generated. Optional source wallpapers remain in `assets/` but are not used.

## Palette

- `#0D0E15` — Abyssal Violet-Black: frame, fields, sidebar, popups, and new-tab canvas
- `#1E012A` — Deep Plum Shadow: toolbar and elevated surfaces
- `#FF007F` — Laser Magenta: active tabs, buttons, attention icons, and highlights
- `#7000FF` — Electric Ultraviolet: focus borders, loading, hover, and selection
- `#00F0FF` — Neon Cyan: text and toolbar icons
- `#55EAD4` — Cyber Teal: separators and inactive text

## Test locally

1. Open `about:debugging#/runtime/this-firefox` in Firefox.
2. Select **Load Temporary Add-on**.
3. Choose `manifest.json`.

## Package

Run:

```powershell
.\package.ps1
```

The package is written to `dist/the-mox-1.5.1.xpi`.

## Install the package

Open `about:addons`, choose **Themes**, and use **Install Add-on From File** if available.

For public distribution, submit the `.xpi` through Mozilla Add-ons (AMO).

# The Mox Terminal — Firefox Theme

A terminal-inspired Cyberpunk 2077 Mox Firefox theme using the uploaded Mox SVG and the Core Mox palette.

## Project roadmap

- Chrome compatibility is planned. A Chrome-compatible manifest and browser theme package will be added in a future release.
- Both themes (The Mox Terminal and The Mox Terminal Alt) have been submitted to the Mozilla Firefox theme store (Firefox AMO) and are awaiting review. A store link will be added here once they are approved.

## Terminal-style look

- Deep violet-black browser frame and address field
- Deep plum active tabs and elevated surfaces
- Magenta active-tab, attention, and highlight accents
- Ultraviolet focus borders and selection states
- Cyan readouts, text, loading, and toolbar icons
- Cyber teal inactive text, separators, and trim

## Uploaded artwork

- `assets/moxlogo.svg` — extension icon and visual identity

The main theme uses no generated artwork or wallpaper. The alt version adds a generated animated header (see [Alt version](#alt-version)).

## Palette

- `#0D0E15` — Abyssal Violet-Black: frame, address field, popups, and new-tab canvas
- `#1E012A` — Deep Plum Shadow: active tabs and elevated surfaces
- `#FF007F` — Laser Magenta: active tabs, attention, and highlights
- `#7000FF` — Electric Ultraviolet: focus, loading, hover, and selection
- `#00F0FF` — Neon Cyan: terminal-style text and icons
- `#55EAD4` — Cyber Teal: inactive text and separators

## Alt version

`alt/` is a self-contained alternate version, **The Mox Terminal Alt**, with its own `manifest.json` and `assets/`. It has a separate add-on ID (`the-mox-terminal-alt@firefox-theme.local`) and version (`0.2.0`), so it can be installed alongside the main theme.

It uses the same palette and adds a terminal-style header, `alt/assets/header-terminal.svg`, shown behind the tab strip:

- A dim, slowly scrolling boot-log and hex ticker over a faint grid
- A violet-to-magenta glow toward the right edge
- A `MOX://TERMINAL` status panel with a blinking `netrunner@mox:~$` cursor, placed clear of the window controls

The header is a 3000×200 SVG (AMO's recommended size) anchored to the right edge of the window. It uses lightweight SMIL animation, so it needs no scripts. The alt colors keep neon cyan for icons and the magenta for the active-tab line and focus ring. Text is softer and borders are quieter so the neon reads as accents. Package it with `.\package.ps1 -Alt`, which writes `dist/the-mox-terminal-alt-0.2.0.xpi`.

## Test locally

1. Open `about:debugging#/runtime/this-firefox` in Firefox.
2. Select **Load Temporary Add-on**.
3. Choose `manifest.json` (or `alt/manifest.json` for the alt version).

## Package

```powershell
.\package.ps1
```

The package is written to `dist/the-mox-terminal-1.6.0.xpi`. Use `-Alt` to package the alt version instead.

## Install the package

Open `about:addons`, choose **Themes**, and use **Install Add-on From File** if available.

Both themes have been uploaded to Mozilla Add-ons (AMO). Until they are approved and listed, install from the `.xpi` or `.zip` attached to the [GitHub releases](https://github.com/nikolmichaelidou/The-Mox-Firefox-Theme/releases). Firefox may install an `.xpi` link directly instead of downloading it, so use the `.zip` if you need the file itself.

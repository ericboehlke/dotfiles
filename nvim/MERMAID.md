# Mermaid in Markdown (set up 2026-10-07)

Two ways to view Mermaid diagrams. Both need `mmdc` and system Chromium.

| | Browser preview | Inline in the buffer |
|---|---|---|
| Key | `<leader>mp` (toggle) | automatic on open / leaving insert / edits |
| Plugin | `iamcco/markdown-preview.nvim` | `3rd/diagram.nvim` + `3rd/image.nvim` |
| Config | `lua/plugins/markdown-preview.lua` | `lua/plugins/diagram.lua` |
| Needs | node | Ghostty (kitty graphics), tmux `allow-passthrough on`, ImageMagick |

`lua/plugins/snacks-image.lua` only passes the puppeteer config to snacks for standalone `.mmd` files.
snacks.nvim can NOT render fenced ```` ```mermaid ```` blocks in Markdown; that is why `diagram.nvim` exists here.

## Outside this config (not in any repo)
- `mmdc`: `npm install -g @mermaid-js/mermaid-cli` (global, under the mise node). Reinstall after a node upgrade.
- `~/.config/mermaid/puppeteer.json`: points `mmdc` at `/usr/bin/chromium` with `--no-sandbox`.
  Needed because puppeteer's own Chromium download is blocked by npm's install-script policy.

## Problems we hit, and fixes
1. **`E117: Unknown function: mkdp#util#install`**: the plugin is lazy-loaded, so its install function doesn't exist
   at build time. Fix: `build = "cd app && npm install"` (shell command, not a Lua function).
2. **Inline diagrams don't render with snacks.nvim**: see above; use `diagram.nvim`.
3. **Browser preview: "Syntax error in text, mermaid version 10.2.3"**: markdown-preview bundles an old mermaid
   (`app/_static/mermaid.min.js`). Old mermaid treats `;` as a statement separator, so a label like
   `A[foo; bar]` fails there while `mmdc` (mermaid 12) accepts it. Two fixes:
   - The `build` step now overwrites the bundled file with mermaid 12 from npm (pinned to `mermaid@12`).
   - Quote labels containing `;`, `/` or parentheses (`A["foo; bar"]`) so diagrams work in any version.

## Maintenance
- The swap leaves the plugin's git tree dirty. If `:Lazy update` refuses to update markdown-preview.nvim:
  `git -C ~/.local/share/nvim/lazy/markdown-preview.nvim checkout .` then update; the build step reapplies mermaid 12.
- To re-apply the mermaid swap by hand: `:Lazy build markdown-preview.nvim`.
- Validate a diagram outside Neovim: `mmdc -p ~/.config/mermaid/puppeteer.json -i x.mmd -o x.png`.
- Inline view broken? `:checkhealth image` and `:checkhealth snacks`.

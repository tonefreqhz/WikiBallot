# WikiBallot / DoughForge — The Great Withholding

**W-Anchor:** `c9ced1a` | **Date:** June 2026 | **License:** CC BY-SA 4.0

A decentralised constituency coordination network and offline samizdat
publishing system. Hugo static site → GitHub Pages → IPFS → USB dongle.

> Every copy is a node. Every node is sovereign.

---

## What this is

| Layer | Technology | Purpose |
|---|---|---|
| Content | Hugo + Markdown | Manifesto, evidence, poetry, doctrine |
| Hosting | GitHub Pages | Free, permanent, versioned |
| Distribution | IPFS | Content-addressed, censorship-resistant |
| Gateway | Cloudflare | HTTP users reach IPFS content |
| Offline | USB dongle + Python | No internet, no server |
| Social | SSB / Manyverse | Constituency offline coordination |
| Upload | Decap CMS | Web form → constituency page → live |

---

## Quick start — run locally

```bash
# Install Hugo (one binary, ~50MB)
# https://gohugo.io/installation/

git clone https://github.com/tonefreqhz/WikiBallot.git
cd WikiBallot/hugo_source
hugo server
# Open http://localhost:1313
```

---

## Quick start — serve dongle offline

Plug in USB. Then:

**Windows:** Double-click `START_WINDOWS.bat`

**Mac/Linux:** 
```bash
bash START_MAC_LINUX.sh
```

Opens `http://localhost:8080` in your browser.
No internet required.

---

## Deploy to GitHub Pages

1. Fork this repo
2. Go to Settings → Pages → Source: GitHub Actions
3. Push to `main` — Actions builds and deploys automatically

Live at: `https://[your-username].github.io/`

---

## Add a constituency page (web UI)

1. Go to `https://tonefreqhz.github.io/admin/`
2. Login with GitHub
3. Click Constituency Pages → New
4. Fill in the form → Publish
5. GitHub Actions builds → page live in ~2 minutes

---

## Add a constituency page (git)

Create `hugo_source/content/constituency/[name]/index.md`:

```markdown
---
title: "Hereford"
region: "West Midlands"
organiser: "Your Name"
next_meeting: 2026-07-01T19:00:00Z
proof_of_life: "Posted leaflets in town centre 06 June 2026"
date: 2026-06-06
---

We meet at the Green Dragon pub, first Tuesday of the month, 7pm.
Contact us via WikiTacticalVoting discussion page.
```

Commit and push → site rebuilds automatically.

---

## IPFS distribution

```bash
# Install kubo (go-ipfs)
# https://docs.ipfs.tech/install/command-line/

cd WikiBallot
ipfs init
ipfs daemon &
sleep 5
HASH=$(ipfs add -r -Q hugo_source/public/)
echo "Content at: https://ipfs.io/ipfs/$HASH"
ipfs pin add $HASH
```

For DNSLink (human-readable IPFS address):
Add TXT record to DNS:
```
_dnslink.wikitacticalvoting.org  →  dnslink=/ipfs/[HASH]
```

---

## Build the dongle

1. `hugo --minify` in `hugo_source/`
2. Copy entire repo to 16GB USB stick
3. Label: **DOUGHFORGE / THE GREAT WITHHOLDING**
   *Plug in. Read. Copy. Pass on.*
4. Distribute face to face

Cost per unit: £1.80–£4.00 at scale.

---

## File structure

```
WikiBallot/
├── .github/workflows/deploy.yml    ← GitHub Actions build + deploy
├── hugo_source/
│   ├── config.toml                 ← Hugo configuration
│   ├── content/
│   │   ├── manifesto/index.md      ← The nine articles
│   │   ├── evidence/index.md       ← Arithmetic of Extraction
│   │   ├── constituency/           ← One folder per constituency
│   │   ├── doctrine/               ← Odious debt, Ruml, Going Direct...
│   │   └── duplicate/index.md      ← Dongle duplication instructions
│   ├── static/
│   │   ├── admin/                  ← Decap CMS (web edit UI)
│   │   └── bourgeois-resolution/   ← Poem interactive HTML
│   └── themes/withholding/         ← Custom theme
│       ├── layouts/                ← HTML templates
│       └── static/css/             ← withholding.css
├── tools/
│   └── serve_local.py              ← Offline server (dongle)
├── START_WINDOWS.bat               ← One-click dongle launch (Windows)
└── START_MAC_LINUX.sh              ← One-click dongle launch (Mac/Linux)
```

---

## Related

- [WikiTacticalVoting](https://wikitacticalvoting.miraheze.org)
- [DoughForge](https://www.doughforge.org)
- [WikiBallot (Weebly)](https://wikiballot.weebly.com)
- [Grub Street in Exile](https://substack.com/@rogerglewis) — Substack

---

## Doctrine stack

| Concept | Source |
|---|---|
| Odious debt | International law — applied 1898 |
| Taxes for revenue are obsolete | Ruml (1946), *American Affairs* |
| Banks create money | Bank of England QB Q1 2014 |
| Going Direct | BlackRock / Jackson Hole, October 2019 |
| The jubilee | Leviticus 25 |
| Boycott | Land League, 1880 |
| Monetary sovereignty | MMT / Mosler / Ruml |
| Land value tax | Henry George, *Progress and Poverty* (1879) |

---

*CC BY-SA 4.0 — Copy freely. Translate. Distribute.*
*Pass it hand to hand. Post it on the wall. Put it on the dongle.*

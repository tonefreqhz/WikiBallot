# WikiBallot — The Great Withholding

> *Every copy is a node. Every node is sovereign.*

**Live site:** https://tonefreqhz.github.io/WikiBallot/  
**WikiTacticalVoting:** https://wikitacticalvoting.miraheze.org  
**DoughForge:** https://www.doughforge.org  
**Weebly archive:** https://wikiballot.weebly.com  

---

## What This Is

WikiBallot is the digital infrastructure of the Great Withholding — a decentralised network of constituency nodes coordinated by shared doctrine, not central authority.

The site publishes the Manifesto of the Great Withholding (a Declaration of Popular Sovereignty Against Odious Debt, June 2026), the Evidence Appendix (the Arithmetic of Extraction), constituency coordination tools, and instructions for duplicating the dongle — the offline, hand-to-hand distribution node.

The architecture is intentionally resilient: static HTML deployable to GitHub Pages, IPFS, a USB dongle, or a local mesh. No database. No platform dependency. No single point of capture.

---

## Repository Structure

```
WikiBallot/
├── hugo_source/              # Hugo static site generator source
│   ├── config.toml           # Site config — baseURL, menu, params
│   ├── content/              # All page content in Markdown
│   │   ├── _index.md         # Home — The Great Withholding
│   │   ├── manifesto/        # Nine-article manifesto
│   │   ├── evidence/         # Arithmetic of Extraction appendix
│   │   ├── bourgeois-resolution/  # Poem in three voices
│   │   ├── constituency/     # Find Your Constituency
│   │   ├── doctrine/         # Odious debt, Ruml, jubilee doctrine
│   │   └── duplicate/        # Dongle duplication instructions
│   ├── themes/withholding/   # Custom theme — dark/cream, monospace
│   │   └── layouts/          # index.html, single.html, list.html
│   └── public/               # Hugo build output (do not edit)
├── dongle_root/              # Offline dongle file tree
├── js/                       # Supporting JavaScript
└── .nojekyll                 # GitHub Pages — bypass Jekyll
```

**Branches:**

| Branch | Purpose |
|--------|---------|
| `main` | Hugo source and repo configuration |
| `gh-pages` | Built static site — deployed by GitHub Pages |

---

## Deployment

The site builds with Hugo and deploys to the `gh-pages` branch via worktree. W-Anchor reference: `c9ced1a`.

```powershell
# 1. Build
cd hugo_source
hugo --minify
cd ..

# 2. Deploy to gh-pages
git worktree add gh-pages-deploy gh-pages
Get-ChildItem gh-pages-deploy | Remove-Item -Recurse -Force
Copy-Item -Path "hugo_source\public\*" -Destination "gh-pages-deploy\" -Recurse -Force
"" | Set-Content "gh-pages-deploy\.nojekyll"
cd gh-pages-deploy
git add .
git commit -m "Deploy Hugo site - W-Anchor c9ced1a"
git push origin gh-pages --force
cd ..
git worktree remove gh-pages-deploy --force
```

---

## Content Sections

| Section | Content |
|---------|---------|
| **Manifesto** | Nine articles: the system, the debt, the double-down, the withholding, the jubilee demand, the sovereign default lie, the positive programme, the utopian charge, the declaration |
| **Evidence** | The Arithmetic of Extraction — primary source verification: BIS $846T derivatives, OCC Q4 2025, IMF Global Debt Monitor, MIT Lucas (2019), Bank of England QB Q1 2014 |
| **Bourgeois Resolution** | Poem in three voices plus a fourth for the reader. Thesis · Anti-Thesis · Synthesis · Your Voice |
| **Constituency** | Coordination tool linking to WikiTacticalVoting. The constituency is the atomic unit of the network |
| **Doctrine** | Odious debt doctrine, Ruml 1946, Going Direct, the jubilee mechanism, monetary sovereignty |
| **Duplicate** | Instructions for copying the full site to a USB dongle and distributing hand to hand |

---

## The Dongle

The dongle is the offline distribution node. Every USB stick running this site is a sovereign copy. Cost: £1.80–£4.00.

```
dongle_root/
├── index.html        # Entry point
├── manifesto/
├── evidence/
├── constituency/
└── duplicate/        # These instructions, recursively
```

Copy `hugo_source/public/` to a FAT32 USB stick. Open `index.html` in any browser. No internet required.

---

## Doctrine

The Great Withholding holds that:

- The post-2008 debt is **odious debt** under international law — incurred without consent, not for the benefit of the people, and where the creditors knew this
- The bond markets are not a force of nature but a mechanism of the creditor class
- Monetary sovereignty belongs to the people
- The jubilee — cancellation of odious debt — is not utopian but arithmetic
- The withholding is the withdrawal of consent from every mechanism of extraction, simultaneously and without a central committee

*Sources: BIS OTC Derivatives Statistics Dec 2025; OCC Q4 2025; IMF Global Debt Monitor Sep 2025; Bank of England QB Q1 2014; Lucas (2019) MIT Sloan; Ruml (1946); Leviticus 25.*

---

## Licence

Content: CC BY-SA 4.0. Copy freely. Translate. Distribute. Post it on the wall. Put it on the dongle.

Code: MIT.

---

*W-Anchor: c9ced1a · Roger G. Lewis · DoughForge / Grub Street in Exile*

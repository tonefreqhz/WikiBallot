# WikiBallot — The Great Withholding

> *Every copy is a node. Every node is sovereign.*

**Live site:** https://tonefreqhz.github.io/WikiBallot/
**IPFS:** https://ipfs.io/ipfs/bafybeib45cgof3wj3zko36enpmugwvcpadesxex4deimz6y25dhx73tomm
**WikiTacticalVoting:** https://wikitacticalvoting.miraheze.org
**DoughForge:** https://www.doughforge.org

---

## What This Is

WikiBallot is the digital infrastructure of the Great Withholding — a decentralised network of constituency nodes coordinated by shared doctrine, not central authority.

The architecture is intentionally resilient: static HTML deployable to GitHub Pages, IPFS, a USB dongle, or a local mesh. No database. No platform dependency. No single point of capture.

---

## Build a Sovereign Dongle

A bootable USB stick running Ubuntu Desktop with the full WikiBallot site. Boots on any x86-64 machine. No installation required. No internet required after build. Cost: £1.80-£4.00 per stick.

### What you need

- USB stick, 16GB minimum
- Rufus https://rufus.ie - Windows USB writer, free
- Ubuntu 26.04 Desktop ISO https://releases.ubuntu.com/26.04/
- This repository cloned locally

### Step 1 - Write Ubuntu with Rufus

1. Open Rufus as Administrator
2. Device: select your USB stick
3. Boot selection: SELECT the Ubuntu ISO
4. Partition scheme: GPT
5. Target system: UEFI (non CSM)
6. Persistent partition size: 7000 MB
7. Volume label: GreatWithholding
8. Click START - wait 15-20 minutes

### Step 2 - Boot into Ubuntu

1. Leave stick in, restart machine
2. Press F12 at POST screen (HP: F9, Dell/Lenovo: F12, ASUS: F8)
3. Select USB stick from boot menu
4. Ubuntu Desktop live session loads

### Step 3 - Copy WikiBallot to the stick

In Ubuntu terminal (Ctrl+Alt+T):

    lsblk
    sudo mkdir -p /mnt/windows
    sudo mount -t ntfs-3g /dev/sda4 /mnt/windows
    mkdir -p ~/greatwithholding/wikiballot
    cp -r /mnt/windows/Users/YOUR_USERNAME/Documents/DoughForge/WikiBallot/hugo_source/public/* ~/greatwithholding/wikiballot/

Replace sda4 with your Windows partition from lsblk output.

### Step 4 - Serve locally

    cd ~/greatwithholding/wikiballot
    python3 -m http.server 8090

Open Firefox at http://localhost:8090

### Step 5 - Duplicate

Hand the stick to someone. They boot it, copy it, hand it on.

Download zip:
- GitHub: https://raw.githubusercontent.com/tonefreqhz/WikiBallot/main/dongle_root/WikiBallot-dongle.zip
- IPFS: https://ipfs.io/ipfs/bafkreiaxpmun3il7ailsdrohza7fhqw7k7gmyzlvm4rhf6msjlcekswxbe

---

## Deploy to GitHub Pages

    cd hugo_source && hugo --minify && cd ..
    git worktree add gh-pages-deploy gh-pages
    Get-ChildItem gh-pages-deploy | Remove-Item -Recurse -Force
    Copy-Item -Path "hugo_source\public\*" -Destination "gh-pages-deploy\" -Recurse -Force
    "" | Set-Content "gh-pages-deploy\.nojekyll"
    cd gh-pages-deploy
    git add .
    git commit -m "Deploy - W-Anchor c9ced1a"
    git push origin gh-pages --force
    cd ..
    git worktree remove gh-pages-deploy --force

---

## IPFS

Site CID: bafybeib45cgof3wj3zko36enpmugwvcpadesxex4deimz6y25dhx73tomm
Dongle CID: bafkreiaxpmun3il7ailsdrohza7fhqw7k7gmyzlvm4rhf6msjlcekswxbe

https://ipfs.io/ipfs/bafybeib45cgof3wj3zko36enpmugwvcpadesxex4deimz6y25dhx73tomm

---

## The Dongle Philosophy

Ten active duplicators in a network of 650 constituency nodes is the threshold for network persistence (Nowak log2 cooperation mathematics). Ten people. Ten sticks. The network does not die.

Full argument: https://tonefreqhz.github.io/WikiBallot/doctrine/dongle-philosophy/

---

## Licence

Content: CC BY-SA 4.0. Copy freely. Translate. Distribute. Put it on the dongle.
Code: MIT.

*W-Anchor: c9ced1a - Roger G. Lewis - DoughForge / Grub Street in Exile*

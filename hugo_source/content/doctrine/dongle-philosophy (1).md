---
title: "The Dongle as DAO — A Philosophy of Distributed Persistence"
description: "How a USB stick running Ubuntu becomes a sovereign node in a decentralised withholding network. The material substrate of the Great Withholding."
date: 2026-06-07
---

*A note toward a paper following Chenoweth's work on nonviolent mass movements and Nowak's mathematics of cooperation.*

---

## The Problem of Persistence

Every distributed movement in history has faced the same problem: how do you maintain coordination without a centre that can be captured, bought, or destroyed?

The Chartists had their travelling delegates and their petition signatures — a distributed ledger of consent before the term existed. The Land League of 1879–1882 maintained the rent strike across hundreds of thousands of Irish tenant farmers without a central server, without a platform, without anything that could be deplatformed. Elizabeth Lease rode the Kansas prairies in 1890 telling farmers to raise less corn and more hell — constituency by constituency, node by node, with no infrastructure more sophisticated than a horse and a pamphlet.

The pamphlet is the dongle. The horse is the distribution network. The constituency node is the farmer who read it and acted.

What has changed is not the principle. What has changed is the substrate.

---

## The Dongle as Sovereign Node

A USB stick costs £1.80 to £4.00. Formatted FAT32, it runs on any computer made in the last twenty years. Loaded with the Great Withholding site and a bootable Ubuntu Desktop image, it becomes something that has no precise historical precedent:

**A complete, self-contained, sovereign information node that requires no internet connection, no platform, no server, no intermediary, and no permission from any authority to operate.**

The person who holds this stick holds:

- The full manifesto and evidence appendix
- The doctrine pages — odious debt, Going Direct, Ruml 1946, the jubilee mechanism
- The constituency coordination tools
- A complete operating system that boots from the stick itself
- The duplication instructions — so every node can become two nodes

When Ubuntu boots from the stick, the computer becomes a temporary sovereign terminal. No data is written to the host machine. No trace is left. The session ends, the stick is removed, the computer returns to whatever it was. The node was real. The node is gone. The node is in someone else's hands now.

This is not anonymity. Anonymity is a defensive posture. This is something different: **irrelevance to the surveillance architecture**. The content is not hidden. It is everywhere. It cannot be found because it is not in one place to find.

---

## The Mathematics of Threshold Cooperation

Erica Chenoweth's research on civil resistance — *Why Civil Resistance Works* (2011) and subsequent work — establishes that nonviolent movements that achieve the active participation of 3.5% of the population have never failed to achieve their stated goals. Not "have rarely failed." Have never failed.

3.5% of the UK population is approximately 2.3 million people. 3.5% of the United States is approximately 11.5 million. These are not utopian numbers. The Velvet Revolution. The People Power movement in the Philippines. The Georgian Rose Revolution. All achieved with active participation well below 5%.

The critical variable is not size. It is **coordination without centralisation** — the ability to act in concert without a single command structure that can be decapitated.

Martin Nowak's work on the evolution of cooperation — particularly his analysis of network reciprocity and the mathematics of super-cooperation — provides the formal basis for why distributed networks outperform centralised ones at sustaining collective action over time. The key insight is the **log₂ relationship between network size and cooperative threshold**: in a network of n nodes, the minimum viable cooperative cluster scales as log₂(n), not linearly. A network of 8 nodes requires a cooperative cluster of 3. A network of 1024 nodes requires a cooperative cluster of 10. The mathematics favours the distributed network at every scale.

The dongle network is a Nowak cooperation network. Every node that duplicates itself increases the size of the network while decreasing the minimum viable cooperative threshold as a proportion of the whole. The duplication instruction is not a marketing strategy. It is the mathematical mechanism of persistence.

---

## The Land League Model

The Irish Land League of 1879–1882, under Michael Davitt and with Charles Stewart Parnell as its political instrument, achieved something that had never been achieved before in agrarian history: a coordinated rent strike across hundreds of thousands of tenant farmers, sustained for three years against the combined force of the British state, the landlord class, and the eviction machinery, without a single command structure, without telecommunications, and without any infrastructure more sophisticated than local branch meetings and a newspaper.

The mechanism was **subsidiarity in practice**. Every local branch was sovereign. The national organisation set the doctrine — no rent on unjust terms, no taking of evicted land, social ostracism of those who broke the strike (this is where "boycott" enters the English language, from Captain Charles Boycott, the land agent ostracised in Mayo in 1880). The local branch decided how to apply the doctrine in its own circumstances. No permission was sought from the centre because no permission was required.

Elizabeth Lease operated the same model on the Kansas prairies a decade later. The Farmers' Alliance and its political expression, the People's Party, coordinated hundreds of thousands of indebted farmers across the American midwest and south using the same architecture: shared doctrine, local sovereignty, no centre that could be captured.

Both movements were ultimately absorbed — the Land League into parliamentary politics, the People's Party into the Democratic Party. This is the standard fate of movements that accept a central political expression. The doctrine is captured when the movement acquires a figurehead.

The dongle network has no figurehead. The content is sovereign. The CID is the author.

---

## Ubuntu as Liberation Technology

Richard Stallman's definition of free software is the correct frame: free as in free speech, not free beer. Ubuntu is free software. It can be copied without permission. It can be modified without permission. It can be distributed without permission. No corporation can revoke your licence to run it. No platform can deplatform it. No gateway can throttle it.

A dongle running Ubuntu is not dependent on:

- Windows licensing
- Apple ecosystem
- Google services
- Any cloud provider
- Any internet connection
- Any DNS authority
- Any certificate authority
- Any content delivery network

It boots. It runs. It serves the content locally. It can be duplicated in four minutes with a second USB stick and the `dd` command or Balena Etcher.

The cost of replication is the cost of the hardware. At £1.80 per stick, the entire manifesto, evidence base, doctrine library, and operating system costs less than a pint of beer to distribute. At constituency scale — 650 constituencies in the UK, one active node each — the total hardware cost is £1,170.

This is the economics of the pamphlet. This is the economics of the Land League branch. This is the economics of the Farmers' Alliance organiser. The substrate has changed. The arithmetic has not.

---

## Dropbox Collaboration and the Limits of Subsidiarity

The dongle architecture is fully offline by design. Local initiatives — a constituency rent strike support group, a community land trust working group, a mutual credit scheme — operate from their local copy of the stick without any connection to a central server.

Where collaboration between nodes is required — sharing locally produced documents, coordinating across constituencies, building the evidence base — the architecture permits several patterns:

**Sneakernet** — physical exchange of updated dongles. The oldest and most censorship-resistant distribution method. A updated stick is handed to a travelling delegate. The delegate hands it to three nodes. Each node hands copies to three more. This is exponential distribution with zero digital footprint.

**Dropbox/Nextcloud sync** — for nodes that choose to connect, a shared folder allows document exchange without a central server. Nextcloud can be self-hosted on the Rochen server or on any VPS. The key principle: **participation in the sync is opt-in and does not compromise nodes that remain offline**.

**IPFS content addressing** — documents pinned to IPFS have immutable CIDs. A node that wants to share a locally produced document pins it and shares the CID. Any other node can retrieve it from the network without knowing where it is hosted. The CID is the document. The document is the CID.

**The Dropbox collaboration is an overlay, not the architecture.** The architecture is the stick. The Dropbox is for nodes that want to coordinate and have chosen to accept the connectivity risk. The subsidiarity principle holds: every node decides for itself.

---

## The DAO Without a DAO

The decentralised autonomous organisation as implemented in Ethereum — Aragon, MolochDAO, the original DAO before the 2016 hack — requires a blockchain, requires ETH for gas, requires technical literacy, requires connectivity. These are barriers. They are also attack surfaces.

The withholding network requires none of these. It is a DAO in the original sense — decentralised, autonomous, organised — without any of the technical apparatus. The doctrine is the smart contract. The dongle is the wallet. The constituency node is the validator.

The governance is subsidiarity. Every decision at the lowest competent level. The network does not vote on the manifesto. The manifesto is published. The network decides whether to act on it. There is no mechanism by which a majority can bind a minority. There is no mechanism by which a centre can instruct a node. There is no mechanism by which a bad actor can capture the governance because there is no governance to capture.

This is what the Land League understood. This is what the Farmers' Alliance understood. This is what every successful distributed movement has understood and every captured movement has forgotten: **the strength of the network is its refusal to become an institution**.

---

## Toward a Paper

The following research frame suggests itself, building on Chenoweth's empirical work and Nowak's mathematical framework:

**Thesis:** Distributed analogue networks (Land League, Farmers' Alliance, Solidarity, Zapatistas) demonstrate Nowak cooperation dynamics independently of digital infrastructure. The dongle network is the first deliberate attempt to design a digital network with analogue-equivalent resilience properties — content-addressed, substrate-independent, zero-permission duplication.

**Chenoweth variable:** Active participation threshold of 3.5% is achievable without centralised coordination if and only if the doctrine is clear, the ask is specific, and the duplication mechanism is frictionless. The dongle satisfies all three conditions.

**Nowak variable:** Network reciprocity in the dongle model operates through physical proximity — the person who hands you the stick is your network neighbour. This is stronger than digital network reciprocity because it carries social weight. You do not ignore a request from someone who looked you in the eye.

**Historical cases for comparison:** Irish Land League 1879–82; Kansas Farmers' Alliance 1887–92; Montgomery Bus Boycott 1955–56; Polish Solidarity 1980–89; Zapatista autonomous municipalities 1994–present.

**The question the paper poses:** At what node density does a dongle network become self-sustaining against takedown? The Nowak mathematics suggest the answer is log₂(n) active duplicators in a network of n nodes. For 650 UK constituencies, n=650, log₂(650)≈9.3 — ten active duplicators is the threshold for network persistence.

Ten people. Ten sticks. The network does not die.

---

*Every copy is a node. Every node is sovereign.*

*CC BY-SA 4.0 — Copy freely. Translate. Distribute. Pass it hand to hand. Post it on the wall. Put it on the dongle.*

# 🅰️ ADGENTS

> **Ads + Agents** — a bilingual stack of 14 AI subagents that handle the work of an entire marketing & advertising agency, running inside [Claude Code](https://claude.com/code).

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Claude Code](https://img.shields.io/badge/Claude%20Code-compatible-blueviolet)](https://claude.com/code)
[![Languages](https://img.shields.io/badge/Languages-SK%20%2B%20EN-blue)]()
[![Agents](https://img.shields.io/badge/Agents-14-orange)]()

---

## What is this? / O čo ide?

🇬🇧 **English**
You install one folder. From that moment, when you type any marketing or advertising task into Claude Code — *"write 3 headlines for our new coffee brand"*, *"audit competitor ads for these 3 wine labels"*, *"plan a 10k€ Meta + Google budget for product launch"* — the system **automatically** routes the task to the right specialist agent. No commands to remember. No prompt engineering. Just describe what you need.

Behind the scenes, 14 role-specific agents — copywriter, art director, media buyer, data analyst, project manager, and 9 more — pick up tasks that match their description, optionally invoke proven methodology **Skills** (e.g. `copywriting`, `paid-ads`, `creative-director`), and return agency-grade output.

🇸🇰 **Slovenčina**
Nainštaluješ si jeden priečinok. Od tej chvíle, keď v Claude Code napíšeš akúkoľvek marketingovú alebo reklamnú úlohu — *„napíš 3 headliny pre novú kávovú značku"*, *„sprav konkurenčnú analýzu pre 3 značky vína"*, *„naplánuj 10k€ Meta + Google budget na launch"* — systém **automaticky** úlohu pošle správnemu špecialistovi. Žiadne príkazy na zapamätanie. Žiadny prompt engineering. Stačí povedať, čo potrebuješ.

Na pozadí 14 agentov so špecifickými rolami — copywriter, art director, media buyer, dátový analytik, project manager a ďalších 9 — vyberajú úlohy, ktoré matchujú ich popisu, voliteľne volajú overené **Skills** s metodikami (napr. `copywriting`, `paid-ads`, `creative-director`) a vracajú výstup na úrovni dobrej agentúry.

---

## 🚀 Quick install

```bash
# Clone agents into Claude Code's global agents directory
mkdir -p ~/.claude/agents
git clone https://github.com/FakeFlorist/adgents.git /tmp/adgents
cp /tmp/adgents/agents/adgent-*.md ~/.claude/agents/
cp /tmp/adgents/ADGENTS.md ~/.claude/agents/
rm -rf /tmp/adgents
```

Or one-liner:

```bash
curl -fsSL https://raw.githubusercontent.com/FakeFlorist/adgents/main/install.sh | bash
```

**That's it.** Open Claude Code in any project and start typing what you need.

---

## 🎯 The 14 agents / 14 agentov

### Creative & Strategy
| Agent | Role | Triggers when you ask for… |
|---|---|---|
| `adgent-idea-maker` | Creative Strategist | Campaign concepts, big ideas, creative territories |
| `adgent-copywriter` | Senior Copywriter | Headlines, taglines, claims, manifestos, scripts |
| `adgent-art-director` | Art Director | Key visuals, moodboards, visual direction |
| `adgent-ai-prompter` | AI Prompt Engineer | Prompts for Midjourney, Flux, Sora, Suno, ElevenLabs |

### Content Production
| Agent | Role | Triggers when you ask for… |
|---|---|---|
| `adgent-content-creator` | Junior Copywriter | Social posts, newsletters, blog articles, A/B variants, localization |
| `adgent-dtp-operator` | DTP / Production | Resize to all formats, print-ready files, ad specs |
| `adgent-video-audio` | Video & Audio | Storyboards, scripts with timing, music briefs, VO direction |
| `adgent-proofreader` | QA Specialist | Pre-launch review, brand compliance, legal flags |

### Media & Distribution
| Agent | Role | Triggers when you ask for… |
|---|---|---|
| `adgent-media-buyer` | Performance Specialist | Paid ads strategy, budget split, audience targeting |
| `adgent-seo-content` | SEO + Content Strategist | Site audits, keyword clusters, editorial calendar |
| `adgent-community-manager` | Community Manager | Comment/DM replies, sentiment, crisis handling |

### Data, Research & PM
| Agent | Role | Triggers when you ask for… |
|---|---|---|
| `adgent-data-analyst` | Reporting Specialist | Client dashboards, performance reports, A/B test analysis |
| `adgent-market-researcher` | Market Researcher | Competitor analysis, personas, trend analysis, ad library scrape |
| `adgent-project-manager` | Project Manager | Work breakdowns, deadlines, meeting minutes, status updates |

---

## 💬 How you actually use it / Ako to reálne používaš

Just type your task into Claude Code. Don't think about which agent to call.

```
"Vymysli 5 kampaňových konceptov pre novú značku kávy,
audience 25–40, premium, launch leto 2026, 50k€, IG + OOH + radio"
```
→ Claude automatically dispatches `adgent-market-researcher` + `adgent-idea-maker` in parallel.

```
"Write 3 headline variants for an outdoor jacket landing page,
target: hikers, premium price, technical fabric story"
```
→ Auto-routes to `adgent-copywriter`.

```
"Audit competitor ads from Meta Ad Library for Patagonia, Fjällräven, Arc'teryx —
what's working, what gaps could we own?"
```
→ Auto-routes to `adgent-market-researcher` (which invokes the `competitive-ads-extractor` skill).

```
"I have a 5k€ test budget for a SaaS lead-gen launch. Plan Google + LinkedIn
campaign structure, audience strategy, and what to test in the first 14 days."
```
→ Auto-routes to `adgent-media-buyer` (which invokes the `paid-ads` skill).

---

## 🧠 How it works / Ako to funguje

```
┌──────────────────────────────────────────────────────────────┐
│   YOU type a task in plain Slovak or English                 │
└──────────────────────────────────────────────────────────────┘
                          ↓
┌──────────────────────────────────────────────────────────────┐
│   Claude Code reads agent descriptions, matches your task    │
└──────────────────────────────────────────────────────────────┘
                          ↓
┌──────────────────────────────────────────────────────────────┐
│   Dispatches to 1+ adgent-* subagents (in parallel if useful)│
└──────────────────────────────────────────────────────────────┘
                          ↓
┌──────────────────────────────────────────────────────────────┐
│   Each adgent optionally invokes proven Skills (methodology) │
│   e.g. copywriting · paid-ads · creative-director · pdf      │
└──────────────────────────────────────────────────────────────┘
                          ↓
┌──────────────────────────────────────────────────────────────┐
│   You receive consolidated output                            │
└──────────────────────────────────────────────────────────────┘
```

Each `adgent-*.md` file is a markdown system prompt with:
- A **description** that triggers auto-routing (in both Slovak and English keywords)
- **Skills to invoke** — which methodology skills to load before working
- **Working principles** — domain rules the agent follows
- **Hand-offs** — which other adgents to delegate to

Edit any file → change takes effect in the next conversation.

---

## 🛠 Recommended Skills

ADGENTS works on its own, but a few of the agents are designed to invoke methodology **Skills** for higher-quality output. If you have these installed in `~/.claude/skills/`, the relevant agents will use them automatically:

| Skill | Used by | Why |
|---|---|---|
| `copywriting` | copywriter, content-creator | Cannes-grade copy methodology |
| `creative-director` | idea-maker | SIT/TRIZ/lateral thinking + recursive self-scoring |
| `paid-ads` | media-buyer | Campaign strategy framework |
| `content-strategy` | seo-content, idea-maker | Topic clusters, pillars |
| `content-research-writer` | content-creator, seo-content | Research + citations + hooks |
| `competitive-ads-extractor` | market-researcher, media-buyer | Ad library analysis |
| `creative-director` | — | (Get it: see Anthropic skills repo or community sources) |

Skills are out of scope for this repo — install separately. ADGENTS gracefully falls back to in-prompt principles if a skill isn't available.

---

## 🌐 Bilingual

- Talk to the agents in Slovak or English — they reply in your language.
- **Final outputs** (copy, posts, reports) are written *natively* in the language you request, not translated.
- Supported well: SK, EN, CZ, HU, PL, DE. Other languages will flag for native speaker review.

---

## 📁 What gets installed where

```
~/.claude/agents/
├── ADGENTS.md              ← reference index
├── adgent-idea-maker.md
├── adgent-copywriter.md
├── adgent-art-director.md
├── adgent-ai-prompter.md
├── adgent-content-creator.md
├── adgent-dtp-operator.md
├── adgent-video-audio.md
├── adgent-proofreader.md
├── adgent-media-buyer.md
├── adgent-seo-content.md
├── adgent-community-manager.md
├── adgent-data-analyst.md
├── adgent-market-researcher.md
└── adgent-project-manager.md
```

Globally available across all Claude Code projects.

---

## 🔧 Customize for your agency

These prompts are tuned for general agency work. Edit them to match your house style:

- **Brand voice / ToV** — add your brand voice guide to relevant agents
- **Tooling** — replace generic tool references with your actual stack (Asana → Linear, GA4 → Mixpanel, etc.)
- **Industries** — if you specialize (B2B SaaS, e-com, healthcare), add domain context
- **Languages** — extend bilingual operation to your client markets

Each file is plain markdown. Open, edit, save. Done.

---

## 📚 Documentation

- [`ADGENTS.md`](./ADGENTS.md) — full reference with workflows and skill mapping
- [`docs/workflows.md`](./docs/workflows.md) — typical end-to-end workflows (campaign launch, social sprint, performance, SEO engine, pitch)
- [`docs/skills.md`](./docs/skills.md) — which skills each agent uses and why

---

## 🤝 Contributing

Pull requests welcome — especially:
- New roles missing from current set (PR, influencer marketing, email marketing, CRO, video shoot producer…)
- Translations / localization to other languages
- Industry-specific variants (e-com pack, B2B SaaS pack, healthcare pack…)
- Workflow recipes

---

## 📄 License

MIT — use it, fork it, sell agency services with it, attribute if you feel like it.

---

## 🙏 Credits

- Inspired by [`gstack`](https://github.com/garrytan/gstack) by Garry Tan — same idea, ported from software engineering to advertising.
- The `creative-director` skill referenced here is by a third party — install separately.
- Built with [Claude Code](https://claude.com/code).

---

**Built for agencies that ship.** Open Claude Code. Type what you need. Watch a team work.

# 🅰️ Workhugs Adgents

> **Ads + Agents** — a stack of 14 AI subagents that handle the work of an entire marketing & advertising agency, running inside [Claude Code](https://claude.com/code).

[![Claude Code](https://img.shields.io/badge/Claude%20Code-compatible-blueviolet)](https://claude.com/code)
[![Languages](https://img.shields.io/badge/Languages-EN%20%2B%20SK-blue)]()
[![Agents](https://img.shields.io/badge/Agents-14-orange)]()

---

## What is this?

**Workhugs Adgents** is a drop-in folder that turns Claude Code into a full marketing & advertising agency. You install it once. From that moment, when you type any marketing or advertising task — *"write 3 headlines for our new coffee brand"*, *"audit competitor ads for these 3 wine labels"*, *"plan a 10k€ Meta + Google budget for product launch"* — the system **automatically** routes the task to the right specialist agent.

No commands to remember. No prompt engineering. No agent names to type. Just describe what you need.

Behind the scenes, 14 role-specific agents — copywriter, art director, media buyer, data analyst, project manager, and 9 more — pick up tasks that match their description, optionally invoke proven methodology **Skills** (e.g. `copywriting`, `paid-ads`, `creative-director`), and return agency-grade output.

---

## Why this exists

A skill is a **methodology**. An agent is a **specialist** who knows how to orchestrate methodologies.

- The `copywriting` skill writes a claim. The `adgent-copywriter` gives you 4 variants (safe / favorite / wildcard / length), explains *why* each one works, and hands the result to the proofreader.
- You don't need to remember which of 30+ skills to invoke. The agent decides based on your task description.
- The `adgent-idea-maker` calls methodologies like SIT, TRIZ, and Lateral Thinking. The `adgent-media-buyer` knows the quirks of Meta, Google, TikTok, LinkedIn. Each agent knows who to delegate to next.
- Parallelism for free: `market-researcher` and `idea-maker` run simultaneously. You get a consolidated output in one pass, not five sequential prompts.
- Bilingual EN + SK by default. Output is written natively in the target language, not translated.

Workhugs Adgents turns a pile of skills into a team.

---

## 🚀 Quick install

One-liner:

```bash
curl -fsSL https://raw.githubusercontent.com/FakeFlorist/adgents/main/install.sh | bash
```

Or manual:

```bash
mkdir -p ~/.claude/agents
git clone https://github.com/FakeFlorist/adgents.git /tmp/adgents
cp /tmp/adgents/agents/adgent-*.md ~/.claude/agents/
cp /tmp/adgents/ADGENTS.md ~/.claude/agents/
rm -rf /tmp/adgents
```

That's it. Open Claude Code in any project and start typing what you need.

---

## 🎯 The 14 agents

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
| `adgent-market-researcher` | Market Researcher | Competitor analysis, personas, trend analysis, ad library scraping |
| `adgent-project-manager` | Project Manager | Work breakdowns, deadlines, meeting minutes, status updates |

---

## 💬 How you actually use it

Just type your task into Claude Code. Don't think about which agent to call.

```
"Generate 5 campaign concepts for a new coffee brand, audience 25–40,
premium, summer 2026 launch, 50k€ budget, IG + OOH + radio"
```
→ Claude automatically dispatches `adgent-market-researcher` + `adgent-idea-maker` in parallel.

```
"Write 3 headline variants for an outdoor jacket landing page,
target: hikers, premium price, technical fabric story"
```
→ Auto-routes to `adgent-copywriter`.

```
"Audit competitor ads from Meta Ad Library for Patagonia, Fjällräven,
Arc'teryx — what's working, what gaps could we own?"
```
→ Auto-routes to `adgent-market-researcher` (which invokes the `competitive-ads-extractor` skill).

```
"I have a 5k€ test budget for a SaaS lead-gen launch. Plan Google + LinkedIn
campaign structure, audience strategy, and what to test in the first 14 days."
```
→ Auto-routes to `adgent-media-buyer` (which invokes the `paid-ads` skill).

---

## 🧠 How it works

```
┌──────────────────────────────────────────────────────────────┐
│   YOU type a task in plain language                          │
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
- A **description** that triggers auto-routing (in both English and Slovak keywords)
- **Skills to invoke** — which methodology skills to load before working
- **Working principles** — domain rules the agent follows
- **Hand-offs** — which other adgents to delegate to

Edit any file → change takes effect in the next conversation.

---

## 🛠 Recommended Skills

Workhugs Adgents work on their own — every agent has methodology baked into its system prompt. But when **Skills** are installed in `~/.claude/skills/`, the relevant agents invoke them automatically for higher-quality output.

| Skill | Used by | Why |
|---|---|---|
| `copywriting` | copywriter, content-creator | Cannes-grade copy methodology |
| `creative-director` | idea-maker | SIT / TRIZ / lateral thinking + recursive self-scoring |
| `paid-ads` | media-buyer | Campaign strategy framework |
| `content-strategy` | seo-content, idea-maker | Topic clusters, pillars |
| `content-research-writer` | content-creator, seo-content | Research + citations + hooks |
| `competitive-ads-extractor` | market-researcher, media-buyer | Ad library analysis |

Skills are out of scope for this repo — install separately. Workhugs Adgents gracefully fall back to in-prompt principles if a skill isn't available.

---

## 🌐 Bilingual

- Talk to the agents in English or Slovak — they reply in your language.
- **Final outputs** (copy, posts, reports) are written *natively* in the language you request, not translated.
- Supported well: EN, SK, CZ, HU, PL, DE. Other languages will flag for native speaker review.

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

Globally available across all your Claude Code projects.

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
- [`docs/workflows.md`](./docs/workflows.md) — end-to-end workflows (campaign launch, social sprint, performance, SEO engine, pitch, crisis)
- [`docs/skills.md`](./docs/skills.md) — which skills each agent uses and why

---

## 👥 Who this is for

- **Solopreneurs** paying for 5 freelancers every month
- **Marketing managers** at small companies without an agency budget
- **Agencies** wanting 5× throughput at the same quality bar
- **Consultants** who don't want to learn 14 different tools

This isn't *"AI will replace people."* It's a team in one window.

---

**Built for agencies that ship.** Open Claude Code. Type what you need. Watch a team work.

— *Workhugs*

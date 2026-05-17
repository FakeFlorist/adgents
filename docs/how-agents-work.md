# How Workhugs Adgents actually work

Transparent answer to the question: *"Is this just a prompt pack, or do the agents actually do something?"*

---

## Two layers

```
┌──────────────────────────────────────────────────────────────┐
│   Layer 1 — Built-in tools (works out of the box)            │
├──────────────────────────────────────────────────────────────┤
│   Every adgent uses Claude Code's standard tools:            │
│                                                              │
│   • WebFetch    → pull URLs (competitor sites, Ad Library)   │
│   • WebSearch   → discover current information               │
│   • Read        → load files you provide (brand docs, CSVs)  │
│   • Write       → save deliverables as real files            │
│   • Bash        → run ffmpeg, python+pandas, curl, etc.      │
│   • Skill       → invoke methodology skills                  │
│                                                              │
│   No setup required — works after the 60-second install.     │
└──────────────────────────────────────────────────────────────┘

┌──────────────────────────────────────────────────────────────┐
│   Layer 2 — MCP integrations (opt-in, per user)              │
├──────────────────────────────────────────────────────────────┤
│   Each user wires up their own services:                     │
│                                                              │
│   • mcp__slack__*    → post to your workspace                │
│   • mcp__notion__*   → read/write your pages                 │
│   • mcp__figma__*    → pull from your brand kit              │
│   • mcp__ga4__*      → query your GA4 property               │
│   • mcp__meta_ads__* → read your campaigns                   │
│   • …                                                        │
│                                                              │
│   See docs/mcp-setup.md.                                     │
└──────────────────────────────────────────────────────────────┘
```

---

## What "doing work" looks like

When you ask `adgent-market-researcher` to analyze 3 competitors, here's what actually happens:

**Without MCPs (Layer 1 only):**
1. Agent invokes `Skill competitive-ads-extractor` for methodology
2. Agent calls `WebFetch` on Meta Ad Library URL for each brand
3. Agent uses `WebSearch` to find recent press, reviews, Reddit threads
4. Agent uses `Bash` to extract structured data from HTML if needed
5. Agent calls `Write` to save:
   - `./outputs/research/competitors-2026-05-17.md` — synthesis
   - `./outputs/research/raw/brand-A-ads.html` — raw snapshot
   - `./outputs/research/competitors-2026-05-17.csv` — comparison table

**With MCPs (Layer 1 + Layer 2):**
- Steps 2 + 4 are replaced by `mcp__meta_ad_library__search_ads` — authenticated, structured, no scraping risk
- Step 3 may use `mcp__reddit__search` for cleaner Reddit data
- Output is the same shape — but the data is richer and more reliable

---

## What you actually receive

Every adgent produces **files**, not just chat replies. After running a workflow, you'll see something like:

```
your-project/
├── outputs/
│   ├── concepts/
│   │   └── coffee-launch-2026-05-17.md
│   ├── copy/
│   │   └── coffee-headlines-2026-05-17.md
│   ├── visuals/
│   │   ├── briefs/
│   │   │   └── coffee-launch-KV.md
│   │   └── prompts/
│   │       └── coffee-launch.md
│   ├── campaigns/
│   │   ├── coffee-launch-plan.md
│   │   └── coffee-launch-testing.md
│   ├── research/
│   │   ├── coffee-competitors-2026-05-17.md
│   │   └── raw/
│   └── reports/
│       └── coffee-month1-2026-06-17.md
└── …
```

Files are the deliverable. The chat reply is just the summary.

---

## Approval gates

Two agents have hard rules baked in:

### `adgent-media-buyer`
Even when `mcp__meta_ads__*` is connected with write scopes, the agent **never** invokes `create_campaign` / `update_budget` / `set_bid` autonomously. All spend actions are written to:

```
./outputs/campaigns/<brand>-actions-pending.md
```

The user reviews, edits, and explicitly says *"go"*. Only then does the agent invoke the write tool.

### `adgent-community-manager`
All replies are draft-only — written to a file. The user reads, edits, and posts manually (or via a separate workflow). The agent never posts on its own, even with write-enabled MCPs.

---

## What this gets you

| Capability | Layer 1 (built-in) | Layer 2 (with MCPs) |
|---|---|---|
| Generate concepts, copy, briefs | ✅ | ✅ better, with brand context |
| Pull public competitor data | ✅ (WebFetch, may be limited) | ✅ (authenticated, structured) |
| Real research output as files | ✅ | ✅ |
| Real reports as files | ✅ (from user-provided CSVs) | ✅ (direct from GA4/Meta/etc.) |
| Generate AI images / video / music | ❌ (only writes the prompt) | ✅ (executes via Higgsfield, Suno, etc.) |
| Read your Notion / Figma / Linear | ❌ | ✅ |
| Post to Slack | ❌ | ✅ (alerts only, never autonomous content) |
| Touch ad accounts | ❌ | ⚠️ Read-only by default. Writes go through approval gate. |

---

## What this is *not*

- ❌ Not a fully autonomous ad platform — humans approve spend
- ❌ Not a "set it and forget it" — you still review outputs
- ❌ Not a replacement for senior strategists / creative directors making the final call
- ✅ A team that handles 80% of the production grind, so the senior people focus on the 20% that matters

---

## The honest functional state

| Stage | Functionality vs the "digital agency" claim |
|---|---|
| **Today, prompt-only (before changes in this update)** | ~15% |
| **After this update (Layer 1 active)** | ~50% |
| **With MCPs wired up (Layer 2)** | ~75% |
| **With custom MCPs for ad platforms + approval gate** | ~90% |
| **Fully autonomous (spend, optimize, post)** | months of additional engineering — not a goal |

We sit at the second line today, with a clear path to the third for any team that takes a day to wire up MCPs.

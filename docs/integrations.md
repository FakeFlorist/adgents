# Integrations Roadmap

Workhugs Adgents v1 are prompt-only — every agent works on text and relies on the human to bring data into context. This document maps which **external APIs, services, and tools** each adgent should integrate with as the project moves toward end-to-end execution (v2+).

The intent: each integration ships as an **opt-in plugin / MCP server**, so the base 60-second install stays untouched.

---

## Phasing

| Symbol | Stage | When |
|---|---|---|
| ✅ | Existing | Already wired up at Workhugs |
| 🅼 | MVP | Within 4 weeks |
| ② | Phase 2 | Month 2 |
| ③ | Phase 3 | Month 3+ |
| ⚪ | Optional | If/when needed |

---

## Shared infrastructure

Used across multiple agents — not tied to a single role.

### LLM
| Service | Stage | Use |
|---|---|---|
| Anthropic Claude API | ✅ | Primary model for all agents |
| OpenAI API | ⚪ | DALL-E + GPT-4o for specific tasks |
| Mistral API | ⚪ | Cheap LLM for high-volume QA |
| DeepSeek API | ⚪ | Cheap LLM for high-volume QA |

### Storage / Video / CDN
| Service | Stage | Use |
|---|---|---|
| Cloudflare R2 | 🅼 | S3-compatible primary storage |
| Mux | ③ | Video CDN + processing |
| Bunny CDN | ⚪ | R2 alternative |
| Cloudinary | ③ | Image/video processing |
| AWS S3 + Lambda | 🅼 | Remotion render infra |

### Database
| Service | Stage | Use |
|---|---|---|
| Supabase | 🅼 | Postgres (option A) |
| Neon | 🅼 | Postgres (option B) |

### Security
| Service | Stage | Use |
|---|---|---|
| Cloudflare Turnstile | 🅼 | Anti-bot |
| Cloudflare WAF | 🅼 | Edge protection |
| ClamAV (daemon) | 🅼 | Asset virus scan |

### Email / Notifications
| Service | Stage | Use |
|---|---|---|
| Resend | 🅼 | Transactional email |
| Slack Web API + Events | 🅼 | Workspace integration |

### Invoicing / Payments
| Service | Stage | Use |
|---|---|---|
| SuperFaktura | 🅼 | Invoicing (SK) |
| Fakturoid | 🅼 | Invoicing (CZ/SK) |
| Stripe | ② | Quote payments |
| DocuSign | ② | DPA signing |

### Deployment / DevOps
| Service | Stage | Use |
|---|---|---|
| Vercel | ✅ | Web deploy |
| Fly.io / Railway | 🅼 | Worker hosting |
| GitHub | ✅ | Repo + Actions |
| Cloudflare Pages + Wrangler | 🅼 | Edge functions |

### Observability
| Service | Stage | Use |
|---|---|---|
| Honeycomb | 🅼 | Tracing |
| Grafana Cloud | 🅼 | Metrics + dashboards |
| OpenTelemetry | 🅼 | Protocol |

### Secrets
| Service | Stage | Use |
|---|---|---|
| 1Password | 🅼 | Primary |
| Doppler | ⚪ | Alternative |

### VPN
| Service | Stage | Use |
|---|---|---|
| Tailscale | 🅼 | Private mesh |

---

## Per-agent integration map

### `adgent-idea-maker`
Concepts, big ideas, creative territories.

| Capability | Service | Stage |
|---|---|---|
| Visual mood reference | Higgsfield API | ✅ |
| Visual mood reference (secondary) | fal.ai API | 🅼 |
| Trend mining | Google Trends (SerpAPI / pytrends) | ② |
| Trend mining | Reddit API | ② |
| Trend mining | TikTok Trending Sounds API | ② |
| Trend mining | Glimpse API | ⚪ |
| Competitive inspiration | Meta Ad Library API | 🅼 |
| Competitive inspiration | TikTok Creative Center | ② |

### `adgent-copywriter`
Headlines, taglines, claims, scripts.

| Capability | Service | Stage |
|---|---|---|
| Primary LLM | Anthropic Claude API | ✅ |
| Brand voice source | Notion API | ② |
| Brand kit source | Figma API | ② |
| QA cross-check | Mistral / DeepSeek | ⚪ |

### `adgent-art-director`
Key visuals, moodboards, visual direction.

| Capability | Service | Stage |
|---|---|---|
| Image generation (primary) | Higgsfield API | ✅ |
| Image generation (secondary) | fal.ai API | 🅼 |
| Image generation (alt) | Replicate API | ② |
| Video generation | Runway API / Pika Labs API | ③ |
| Brand assets | Figma API | ② |
| Asset library | Google Drive / Dropbox API | ② |
| Output storage | Cloudflare R2 | 🅼 |

### `adgent-ai-prompter`
Prompts for image, video, audio, voice models.

| Capability | Service | Stage |
|---|---|---|
| Image models | Higgsfield, fal.ai, Replicate, OpenAI (DALL-E) | 🅼 |
| Video models | Runway, Pika, Higgsfield | ③ |
| Music models | Suno API, Udio API | ② |
| Voice models | ElevenLabs API | ② |

### `adgent-content-creator`
Social posts, newsletters, blog, A/B variants, localization.

| Capability | Service | Stage |
|---|---|---|
| Primary LLM | Anthropic Claude API | ✅ |
| High-volume LLM | Mistral / DeepSeek | ⚪ |
| Content calendar | Notion / Airtable API | ② |
| Brand kit | Figma API | ② |

### `adgent-dtp-operator`
Resize, print-ready, format adaptation.

| Capability | Service | Stage |
|---|---|---|
| Render infra | AWS Lambda + Remotion | 🅼 |
| Video transcoding | ffmpeg / ffprobe (local) | 🅼 |
| Image processing | Cloudinary | ③ |
| Storage | Cloudflare R2 / AWS S3 | 🅼 |
| Brand assets | Figma API | ② |

### `adgent-video-audio`
Storyboards, scripts, music briefs, VO direction.

| Capability | Service | Stage |
|---|---|---|
| Video gen | Runway / Pika / Higgsfield | ③ |
| Music gen | Suno / Udio | ② |
| Voiceover (TTS) | ElevenLabs | ② |
| Transcription (primary) | OpenAI Whisper | ② |
| Transcription (alt) | AssemblyAI / Deepgram | ② |
| Transcription (fallback) | WhisperX via Replicate | ② |
| Render infra | AWS Lambda + Remotion | 🅼 |
| Storage | Cloudflare R2 / Mux | 🅼 |

### `adgent-proofreader`
QA, brand compliance, pre-launch checks.

| Capability | Service | Stage |
|---|---|---|
| Cross-LLM check | OpenAI / Mistral | ⚪ |
| OCR (text on visuals) | tesseract (local) | 🅼 |
| Virus scan | ClamAV (daemon) | 🅼 |
| Link/format checks | Custom HTTP client | 🅼 |

### `adgent-media-buyer`
Paid ads strategy, budget, audience, optimization.

| Capability | Service | Stage |
|---|---|---|
| Meta ads | Meta Marketing API | ② |
| Meta performance | Meta Insights API | ② |
| TikTok ads | TikTok Ads API | ② |
| LinkedIn ads | LinkedIn Marketing API | ② |
| YouTube data | YouTube Data + Analytics API | ② |
| Attribution | Northbeam / Triple Whale | ③ |
| Competitive intel | Meta Ad Library, TikTok Creative Center | 🅼 |
| Budget gate (always) | Approval workflow (human-in-the-loop) | 🅼 |

> **Hard rule:** This agent never moves real budget autonomously. Every spend action requires explicit human approval through a gate workflow.

### `adgent-seo-content`
Audits, keyword clusters, topical authority.

| Capability | Service | Stage |
|---|---|---|
| Keyword research | Ahrefs API | ③ |
| Keyword research | Semrush API | ③ |
| SERP data | SerpAPI | ③ |
| Bulk SEO data | DataForSEO API | ③ |
| Trend signals | Google Trends | ② |

### `adgent-community-manager`
Comments, DMs, sentiment, crisis triage.

| Capability | Service | Stage |
|---|---|---|
| Brand monitoring | Brand24 / Mention | ③ |
| Social listening | Talkwalker / Sprinklr / Sprout Social | ⚪ |
| Social platforms | Twitter/X API, Reddit API | ⚪ |
| Escalation channel | Slack Web API | 🅼 |
| Email alerts | Resend API | 🅼 |

### `adgent-data-analyst`
Dashboards, performance reports, anomaly detection, A/B analysis.

| Capability | Service | Stage |
|---|---|---|
| GA4 | GA4 Data API | ② |
| Meta performance | Meta Insights API | ② |
| TikTok ads | TikTok Ads API | ② |
| LinkedIn ads | LinkedIn Marketing API | ② |
| YouTube | YouTube Analytics API | ② |
| Attribution | Northbeam / Triple Whale | ③ |
| Data warehouse | Supabase / Neon (Postgres) | 🅼 |
| Observability backend | Honeycomb / Grafana Cloud | 🅼 |

### `adgent-market-researcher`
Competitors, personas, trends, ad library scraping.

| Capability | Service | Stage |
|---|---|---|
| Meta ads | Meta Ad Library API | 🅼 |
| TikTok ads | TikTok Creative Center | ② |
| LinkedIn ads | Scraper (Apify / Bright Data) | ③ |
| Google ads | Google Ads Transparency Center (scraper) | ③ |
| YouTube research | YouTube Data API | ② |
| Generic scraping | Apify API | ③ |
| Anti-bot scraping | Bright Data API | ③ |
| Lightweight scraping | ScrapingBee API | ⚪ |
| Trend mining | Google Trends, Reddit, X | ② |
| Brand monitoring | Brand24 / Mention | ③ |

### `adgent-project-manager`
Work breakdowns, deadlines, meeting minutes, status.

| Capability | Service | Stage |
|---|---|---|
| Tasks | Linear API | ③ |
| Tasks (alt) | Asana / Monday.com / ClickUp / Trello | ③ |
| Comms | Slack Web API | 🅼 |
| Docs | Notion API | ② |
| Files | Google Drive / Dropbox API | ② |
| Invoicing | SuperFaktura / Fakturoid | 🅼 |
| Payments | Stripe API | ② |
| Contracts | DocuSign API | ② |

---

## CLI tools assumed available

These are not API integrations but local binaries the agents may shell out to via the `Bash` tool:

| CLI | Used for |
|---|---|
| `claude` | Claude Code itself |
| `gh` | GitHub operations |
| `git` | Version control |
| `pnpm`, `npm`, `npx` | Node tooling |
| `vercel`, `flyctl`, `railway` | Deploy |
| `wrangler` | Cloudflare R2 + Pages |
| `drizzle-kit` | DB migrations |
| `docker`, `docker-compose` | Local stack |
| `aws` | Lambda + S3 |
| `tailscale` | VPN |
| `ffmpeg`, `ffprobe` | Video transcoding + QA |
| `clamscan`, `clamd` | Virus scan |
| `tesseract` | OCR |
| `mitmproxy` | API reverse-engineering (dev only) |
| `supabase`, `neon` | DB management |
| `1password`, `doppler` | Secrets |
| `higgs` / `higgsfield` | Higgsfield CLI (dev) |
| `slack` | Slack app CLI |

---

## MCP servers (in Claude Code dev environment)

Existing or planned MCPs that complement Workhugs Adgents:

| MCP | Purpose |
|---|---|
| `jarvis` | Knowledge / specialist agent swarm |
| `mcp-registry` | MCP discovery |
| `Control_Chrome` / `Claude_in_Chrome` | Browser automation |
| `Claude_Preview` | Preview built artifacts |
| `ccd_session`, `ccd_session_mgmt` | Session management + archive |
| `ccd_directory` | Agent directory |
| `scheduled-tasks` | Cron-like Claude tasks |

Note: **Conductor** (Mac app for parallel agent workspaces) is not an MCP but lives in the workflow.

---

## Node SDKs / libraries (implementation)

Reference for agents that generate code or hand off to engineering:

**Core**
`@anthropic-ai/sdk` · `@anthropic-ai/claude-agent-sdk`

**Comms + infra**
`@slack/bolt` · `@aws-sdk/client-lambda` · `@aws-sdk/client-s3`

**Render**
`remotion` · `@remotion/renderer` · `@remotion/lambda`

**Data + jobs**
`drizzle-orm` · `pg-boss` · `zod`

**Frontend**
`react-router-dom` · `reactflow` · `@dagrejs/dagre` · `@vidstack/react` · `cmdk` · `@tanstack/react-table` · `next-intl` · `next-auth` (or magic-link via Resend) · `clsx` + `tailwind-merge` · `lucide-react`

**Document handling**
`@react-pdf/renderer` · `pdf-parse` · `mammoth` · `xlsx` (sheetjs)

**Security + observability**
`clamscan` · `@opentelemetry/api` · `@opentelemetry/sdk-node`

---

## Account checklist

What needs a registered account at each stage:

### ✅ Existing
Anthropic · Higgsfield · GitHub · Vercel

### 🅼 MVP (week 4)
Cloudflare (R2 + Turnstile + WAF + DNS) · Supabase **or** Neon · AWS (Lambda + S3) · Fly.io **or** Railway · Tailscale · Resend · Slack workspace · SuperFaktura **or** Fakturoid · fal.ai · Honeycomb **or** Grafana Cloud · 1Password **or** Doppler · Meta Developer (Ad Library API)

### ② Phase 2 (month 2)
Replicate (WhisperX) · ElevenLabs · Stripe · DocuSign · TikTok Developer · LinkedIn Marketing Developer · Google Cloud Console (GA4 + YouTube Data + Trends) · Notion · Figma · Suno **or** Udio · AssemblyAI **or** Deepgram

### ③ Phase 3 (month 3+)
Northbeam **or** Triple Whale · Brand24 **or** Mention · Apify **or** Bright Data · Ahrefs **or** Semrush · SerpAPI · Runway **or** Pika · Linear **or** Asana · Mux **or** Cloudinary

### ⚪ Optional
OpenAI · Mistral / DeepSeek · Glimpse · Sprinklr / Sprout Social / Talkwalker · Airtable · Bunny CDN · Twitter/X · Reddit

---

## How to add an integration to an adgent (when you're ready)

Each adgent is a markdown file in `~/.claude/agents/`. To wire it to an API/MCP:

1. **Install the MCP server or set the API env var.**
2. **Edit the agent's `## 🛠 Skills to invoke` (or add `## 🔌 Integrations`) section** to instruct the agent when and how to call it.
3. **Add a guardrail** for anything that spends money or sends messages: explicit human-approval step before action.
4. **Test in a sandbox account first.** Real Meta Ads, Stripe, etc. wait for the all-clear.

The base install stays prompt-only — integrations are layered on top per workspace.

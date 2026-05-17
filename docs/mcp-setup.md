# MCP Setup Guide

Workhugs Adgents are designed to **detect** MCP servers and use them transparently. You wire up only what you need.

This guide walks you through:

1. The general MCP setup flow in Claude Code
2. Server-by-server setup for the services Workhugs Adgents knows how to use

---

## 1. General flow

```
~/.claude/mcp.json   ← config (servers + credentials)
       ↓
Claude Code starts and spawns each MCP server on stdin/stdout
       ↓
Each server exposes tools as: mcp__<server-name>__<tool-name>
       ↓
Adgents detect available tools at runtime and prefer them over WebFetch
```

### Steps
1. Copy `mcp.example.json` to `~/.claude/mcp.json`
2. Uncomment **only** the servers you want (remove the leading `_` from the server key)
3. Fill in env vars (API keys, tokens, paths)
4. Restart Claude Code
5. Verify: in a Claude Code session, type *"list available MCP tools"* — you'll see the connected ones

### Where to store secrets
- Don't paste raw secrets into `mcp.json` if you can avoid it. Reference env vars:
  ```json
  "env": { "SLACK_BOT_TOKEN": "${SLACK_BOT_TOKEN}" }
  ```
- Export them in your shell (`~/.zshrc` / `~/.bashrc`), or use a secret manager (1Password CLI, Doppler).

---

## 2. Per-service setup

### 🟢 Ready-to-use MCPs (official or community packages)

These you can install today — `npx -y <package>` and they're running.

#### Slack
**Used by:** `adgent-community-manager` (crisis escalations), `adgent-project-manager` (status posts)
**Package:** `@modelcontextprotocol/server-slack`
**Steps:**
1. Create a Slack app at https://api.slack.com/apps
2. Add OAuth scopes: `channels:read`, `chat:write`, `chat:write.public`, `users:read`
3. Install to workspace → copy Bot Token (starts with `xoxb-`)
4. Find your Team ID (workspace URL or admin console)
5. Set env vars: `SLACK_BOT_TOKEN`, `SLACK_TEAM_ID`

#### Notion
**Used by:** `adgent-copywriter`, `adgent-content-creator`, `adgent-project-manager`
**Package:** `@notionhq/notion-mcp-server`
**Steps:**
1. Create integration at https://www.notion.so/my-integrations
2. Copy "Internal Integration Token" (starts with `secret_`)
3. Share the relevant Notion pages/databases with the integration
4. Set the `OPENAPI_MCP_HEADERS` env var as shown in `mcp.example.json`

#### Linear
**Used by:** `adgent-project-manager`
**Package:** `@tacticlaunch/mcp-linear` (community)
**Steps:**
1. Linear → Settings → API → Personal API keys → New key
2. Set env var: `LINEAR_API_KEY=lin_api_…`

#### Figma
**Used by:** `adgent-art-director`, `adgent-copywriter`, `adgent-dtp-operator`
**Package:** `figma-developer-mcp` (community)
**Steps:**
1. Figma → Settings → Account → Personal access tokens → Create new
2. Set env var: `FIGMA_API_KEY=figd_…`

#### Postgres
**Used by:** `adgent-data-analyst` (warehouse queries)
**Package:** `@modelcontextprotocol/server-postgres`
**Steps:**
1. Get connection string from your DB host (Supabase, Neon, AWS RDS, etc.)
2. Pass as arg in `mcp.json` — see example config

#### Google Drive
**Used by:** `adgent-art-director`, `adgent-copywriter`, `adgent-project-manager`
**Package:** `@modelcontextprotocol/server-gdrive`
**Steps:**
1. Create GCP service account → enable Drive API
2. Download JSON credentials
3. Share relevant Drive folders with the service account email
4. Set `GDRIVE_CREDENTIALS=/path/to/json`

---

### 🟡 Build-your-own MCPs (no public package yet)

For marketing-specific APIs, you'll need to build a small MCP server (a few hundred lines of TypeScript). Use `@modelcontextprotocol/sdk` and `skill-creator` from Anthropic skills as references.

**Approximate effort:** 1–3 days per MCP if you know TypeScript.

#### Meta Ad Library
**Used by:** `adgent-market-researcher`, `adgent-media-buyer`
**Tools to expose:** `search_ads(query, country)`, `get_ad_details(ad_id)`, `list_active_by_advertiser(page_id)`
**API:** https://www.facebook.com/ads/library/api
**Notes:** Requires Meta app with `ads_archive` permission. Public data, no user OAuth needed.

#### GA4 Data API
**Used by:** `adgent-data-analyst`
**Tools to expose:** `run_report(property_id, dimensions, metrics, date_range)`, `get_realtime(property_id)`
**SDK:** `@google-analytics/data`
**Notes:** Service account auth. Grant viewer access to the GA4 property.

#### Meta Marketing API
**Used by:** `adgent-media-buyer`, `adgent-data-analyst`
**Tools to expose (READ ONLY):** `get_campaign_insights`, `get_adset_insights`, `get_ad_insights`, `list_campaigns`
**SDK:** `facebook-nodejs-business-sdk`
**🛑 Critical:** Do NOT expose write tools (create / update / delete campaigns or budgets) without an approval gate. The `adgent-media-buyer` is designed to draft to a file first, regardless.

#### Google Ads API
**Used by:** `adgent-media-buyer`, `adgent-data-analyst`
**Tools to expose:** `get_search_terms`, `get_keyword_performance`, `get_campaign_performance`, `get_pmax_asset_performance`
**SDK:** `google-ads-api`
**Notes:** OAuth2 + developer token. Approval from Google for production access.

#### TikTok Ads API
**Used by:** `adgent-media-buyer`, `adgent-data-analyst`
**Tools to expose:** `get_campaign_report`, `get_ad_report`, `get_audience_insights`
**Docs:** https://ads.tiktok.com/marketing_api/docs

#### LinkedIn Marketing API
**Used by:** `adgent-media-buyer`, `adgent-data-analyst`
**Docs:** https://learn.microsoft.com/en-us/linkedin/marketing/

#### Higgsfield API
**Used by:** `adgent-art-director`, `adgent-ai-prompter`
**Tools to expose:** `generate_image(prompt, params)`, `get_status(job_id)`, `download_result(url)`

#### ElevenLabs
**Used by:** `adgent-ai-prompter`, `adgent-video-audio`
**Tools to expose:** `tts(text, voice_id, params)`, `list_voices()`, `clone_voice(audio_file, name)`
**SDK:** `elevenlabs-node`

#### Suno / Udio
**Used by:** `adgent-ai-prompter`, `adgent-video-audio`
**Tools to expose:** `generate_music(prompt, style, duration)`, `get_status`

#### Brand24 / Mention
**Used by:** `adgent-community-manager`, `adgent-market-researcher`
**Tools to expose:** `query_mentions(brand, period)`, `get_sentiment(brand)`, `get_top_sources(brand)`

#### Apify / Bright Data
**Used by:** `adgent-market-researcher`
**Tools to expose:** `run_actor(actor_id, input)`, `get_run_results(run_id)`
**SDK:** `apify-client` / Bright Data REST

---

## 3. Verifying it works

After restarting Claude Code with a populated `mcp.json`, ask any adgent something that should use the MCP:

```
Use adgent-data-analyst to pull GA4 traffic for last 30 days for property 123456789.
```

If `mcp__ga4__*` is connected, the agent will call it and return real numbers. If not, the agent will note the MCP is missing and ask for a CSV export instead — that's the graceful fallback.

---

## 4. Security checklist

- [ ] No write/delete tools exposed for ad platforms (`meta_ads`, `google_ads`, etc.) without an approval gate
- [ ] Secrets in env vars, not in `mcp.json` directly
- [ ] Service accounts have read-only scopes where possible
- [ ] Audit `outputs/` folders before sharing — they may contain client data
- [ ] Rotate API keys regularly

---

## 5. Contributing back

Build a useful MCP server? PRs welcome to add it to this guide. Especially:
- Marketing platform MCPs (Meta, Google, TikTok, LinkedIn)
- Brand monitoring MCPs
- Generative AI MCPs (Higgsfield, Runway, Suno, ElevenLabs)

The goal: a community-maintained list of MCPs that turn Workhugs Adgents into a fully integrated agency stack.

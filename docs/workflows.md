# Workflows

Pre-baked workflows that combine multiple Workhugs Adgents into one task pipeline. You don't have to call them this way — Claude Code will dispatch automatically — but these are useful as mental models.

## A) Full campaign — brief to launch

```
1.  adgent-market-researcher   → competitors + personas + insights
2.  adgent-idea-maker          → 3–5 creative territories
       ⇣  (you pick one)
3.  adgent-copywriter          → hero claim + headlines
4.  adgent-art-director        → key visual concept + moodboard
5.  adgent-ai-prompter         → prompts for AI image generation
6.  adgent-video-audio         → storyboard + spot script (if video)
7.  adgent-content-creator     → social posts + newsletter + variants
8.  adgent-dtp-operator        → adaptations for every format
9.  adgent-proofreader         → final QA before launch
10. adgent-media-buyer         → campaign strategy + activation plan
11. adgent-community-manager   → live audience response
12. adgent-data-analyst        → weekly reporting + optimizations
13. adgent-project-manager     → holds it all together
```

## B) Social-only sprint
`market-researcher` → `content-creator` → `dtp-operator` → `proofreader` → publish → `community-manager`

## C) Performance campaign (existing brand)
`media-buyer` (plan) → `copywriter` + `art-director` (creative) → `ai-prompter` (visuals) → `dtp-operator` (formats) → `data-analyst` (after week 1)

## D) SEO + content engine
`seo-content` (audit + plan) → `content-creator` (articles from briefs) → `proofreader` → publish → `data-analyst` (monthly report)

## E) Client kickoff
`project-manager` (work breakdown from brief) + `market-researcher` (parallel) → kickoff doc

## F) New business pitch
`market-researcher` → `idea-maker` → `copywriter` + `art-director` → `project-manager` (budget + timeline) → pitch deck

## G) Crisis response
`community-manager` (immediate triage) → escalate → `copywriter` (statement) → `proofreader` (legal flags) → `project-manager` (next-steps log)

---

**How to trigger any workflow:** Just describe the goal in plain language. Examples:

- *"Spusti mi celý launch pre novú značku kávy — brief: …"* → workflow A
- *"Pripravme social na ďalšie 4 týždne pre značku X"* → workflow B
- *"Sprav mi audit Meta + Google kampaní za posledné 30 dní a navrhni testy"* → workflow C (without research) or just `media-buyer` + `data-analyst`
- *"Klient nahnevaný, virálny zlý komentár, akcia teraz"* → workflow G

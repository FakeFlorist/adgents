# 🅰️ ADGENTS

**Ads + Agents** — bilingválny stack 14 AI agentov, ktorí robia prácu celej marketingovej a reklamnej agentúry. Globálne dostupní v každom projekte cez Claude Code.

> **Ads + Agents** — bilingual stack of 14 AI agents that handle the work of an entire marketing & advertising agency. Globally available in every Claude Code project.

## 📋 Roster / Zostava

### 1. Creative & Strategy
| Agent | Role (SK) | When to invoke |
|---|---|---|
| `adgent-idea-maker` | Kreatívny stratég | Brief → big ideas, kampaňové koncepty |
| `adgent-copywriter` | Creative Copywriter | Claimy, headliny, taglines, manifesto, scenáre |
| `adgent-art-director` | Art Director | Key visuals, moodboardy, vizuálna direkcia |
| `adgent-ai-prompter` | AI Prompt Engineer | Prompty pre MJ, Flux, Sora, Suno, ElevenLabs |

### 2. Content Production
| Agent | Role | When to invoke |
|---|---|---|
| `adgent-content-creator` | Junior Copywriter | Social posty, newslettre, blog, A/B variácie, lokalizácia |
| `adgent-dtp-operator` | DTP Operator | Resize, print-ready, format adaptácia |
| `adgent-video-audio` | Video & Audio Creator | Storyboardy, scenáre, shot listy, hudba/VO brief |
| `adgent-proofreader` | Proofreader / QA | Korektúra, brand compliance, pre-launch check |

### 3. Media & Distribution
| Agent | Role | When to invoke |
|---|---|---|
| `adgent-media-buyer` | Performance Specialist | Paid ads stratégia, budget, targeting, testovanie |
| `adgent-seo-content` | SEO + Content Strategist | Audity, keyword clustering, topical authority |
| `adgent-community-manager` | Community Manager | Odpovede na komentáre/DM, FAQ, krízovka |

### 4. Data, Research & PM
| Agent | Role | When to invoke |
|---|---|---|
| `adgent-data-analyst` | Reporting Specialist | Dashboardy, reporty, anomálie, A/B analýza |
| `adgent-market-researcher` | Market Researcher | Konkurencia, persony, trendy, ad library scrape |
| `adgent-project-manager` | Project Manager | Rozpisy, deadliny, MoM, status, kapacity |

---

## 🚀 Ako ich používať / How to invoke

V Claude Code stačí povedať:
- `"Použi adgent-idea-maker a vymysli 5 konceptov pre…"`
- `"Run adgent-media-buyer to plan Meta + Google budget for…"`
- Claude Code sám rozpozná z popisu, ktorého agenta zavolať, ak povieš napr. `"napíš mi 10 Instagram captionov pre…"` → `adgent-content-creator`.

Bežia paralelne — môžeš spustiť aj viac naraz (napr. researcher + idea-maker zároveň pre kickoff).

---

## 🔄 Typické workflows / Typical workflows

### A) Plná kampaň od briefu po launch
```
1. adgent-market-researcher    → konkurencia + persony + insighty
2. adgent-idea-maker            → 3–5 kreatívnych teritórií
   ⇣ (výber teritória)
3. adgent-copywriter            → hero claim + headlines
4. adgent-art-director          → key visual concept + moodboard
5. adgent-ai-prompter           → prompty pre generovanie vizuálov
6. adgent-video-audio           → storyboard + scenár spotu (ak treba)
7. adgent-content-creator       → posty + newsletter + variácie
8. adgent-dtp-operator          → adaptácie do všetkých formátov
9. adgent-proofreader           → final QA pred launchom
10. adgent-media-buyer          → kampaňová stratégia + spustenie
11. adgent-community-manager    → reakcie na publikum
12. adgent-data-analyst         → weekly reporting + optimalizácie
13. adgent-project-manager      → drží to celé pohromade
```

### B) Rýchly social-only sprint
`market-researcher` → `content-creator` → `dtp-operator` → `proofreader` → publish → `community-manager`

### C) Performance kampaň (existujúci brand)
`media-buyer` (plán) → `copywriter` + `art-director` (kreatíva) → `ai-prompter` (vizuály) → `dtp-operator` (formáty) → `data-analyst` (po týždni)

### D) SEO + content engine
`seo-content` (audit + plán) → `content-creator` (články podľa briefov) → `proofreader` → publish → `data-analyst` (mesačný report)

### E) Klientsky kickoff
`project-manager` (rozpis z briefu) + `market-researcher` (paralel) → kickoff doc

### F) Pitch / nový biz
`market-researcher` → `idea-maker` → `copywriter` + `art-director` → `project-manager` (rozpočet + timeline) → pitch deck

---

## 🧠 Skills použité agentmi / Skill mapping

Adgenti volajú **Skills** (z `~/.claude/skills/`) pred produkciou výstupu — to zaručuje, že každý výstup ide cez kanonickú metodiku, nie cez improvizáciu. Mapping:

| Adgent | Skills (primárne **bold**) |
|---|---|
| `adgent-idea-maker` | **creative-director**, content-strategy, idea-validator, domain-name-brainstormer |
| `adgent-copywriter` | **copywriting** |
| `adgent-content-creator` | **copywriting**, content-research-writer, twitter-algorithm-optimizer, linkedin-personal-branding |
| `adgent-art-director` | canvas-design, theme-factory, frontend-design, image-enhancer |
| `adgent-ai-prompter` | *(doména je v promte agenta)* |
| `adgent-dtp-operator` | canvas-design, pdf, image-enhancer, pptx, docx |
| `adgent-video-audio` | *(doména je v promte agenta)* |
| `adgent-proofreader` | *(heuristiky v promte agenta)* |
| `adgent-media-buyer` | **paid-ads**, competitive-ads-extractor |
| `adgent-seo-content` | **content-strategy**, content-research-writer |
| `adgent-community-manager` | linkedin-personal-branding |
| `adgent-data-analyst` | **xlsx**, pdf |
| `adgent-market-researcher` | **competitive-ads-extractor**, lead-research-assistant, pdf |
| `adgent-project-manager` | **meeting-insights-analyzer**, docx, pptx, xlsx |

> Ak zmeníš/aktualizuješ skill v `~/.claude/skills/`, všetci adgenti, čo ho volajú, automaticky používajú novú verziu — netreba ich editovať.

---

## 🌐 Bilingual operation

- Hovor s nimi v slovenčine alebo angličtine — odpovedia v tvojom jazyku.
- **Finálne výstupy** (copy, posty, reporty) píšu v jazyku, ktorý si vyžiadaš — natívne, nie preložené.
- Agenti vedia pracovať v SK, EN, CZ, HU, PL, DE; pri ostatných flagnu, že treba native speaker review.

---

## 📂 Kde sú uložené

```
~/.claude/agents/
├── ADGENTS.md              ← tento prehľad
└── adgent-*.md             ← 14 agentov
```

Úprava: edituj príslušný `adgent-*.md` súbor — zmena platí okamžite v ďalšej konverzácii.

---

*ADGENTS v1.1 · 14 agents · SK + EN · Skills-aware*

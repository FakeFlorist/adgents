# Skills Used by ADGENTS

ADGENTS work without any skills installed — each agent has methodology baked into its system prompt. But when **Skills** are available in `~/.claude/skills/`, agents invoke them for higher-quality, more methodologically grounded output.

## Mapping

| Adgent | Primary skills (**bold** = required when relevant) |
|---|---|
| `adgent-idea-maker` | **creative-director**, content-strategy, idea-validator, domain-name-brainstormer |
| `adgent-copywriter` | **copywriting** |
| `adgent-content-creator` | **copywriting**, content-research-writer, twitter-algorithm-optimizer, linkedin-personal-branding |
| `adgent-art-director` | canvas-design, theme-factory, frontend-design, image-enhancer |
| `adgent-ai-prompter` | *(domain expertise lives in the agent prompt itself)* |
| `adgent-dtp-operator` | canvas-design, pdf, image-enhancer, pptx, docx |
| `adgent-video-audio` | *(domain expertise lives in the agent prompt itself)* |
| `adgent-proofreader` | *(heuristics live in the agent prompt itself)* |
| `adgent-media-buyer` | **paid-ads**, competitive-ads-extractor |
| `adgent-seo-content` | **content-strategy**, content-research-writer |
| `adgent-community-manager` | linkedin-personal-branding |
| `adgent-data-analyst` | **xlsx**, pdf |
| `adgent-market-researcher` | **competitive-ads-extractor**, lead-research-assistant, pdf |
| `adgent-project-manager` | **meeting-insights-analyzer**, docx, pptx, xlsx |

## Where to get the skills

Skills are installed separately into `~/.claude/skills/`. Common sources:

- [Anthropic's `skills` repo](https://github.com/anthropics/skills) — many of the official skills
- Community skill marketplaces and individual GitHub repos
- Roll your own — see [`skill-creator`](https://github.com/anthropics/skills) for the format

## Graceful fallback

Every adgent has its methodology summarized in-prompt. If a skill load fails or isn't installed, the agent will produce solid output anyway using its built-in principles. Skills are a multiplier, not a requirement.

## Updating skills

When you update a skill in `~/.claude/skills/`, every adgent that invokes it automatically uses the new version. **No need to edit the agents** — they reference skills by name.

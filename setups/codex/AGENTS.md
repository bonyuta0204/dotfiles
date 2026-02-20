# Codex Global AGENTS

## Branch Naming Rules (kpiee)

- Official rule source:
  - https://github.com/f-scratch/zelda-docs/blob/master/docs/kpiee/developer_guides/resource_management.md
- Branch names must include a single implementation/improvement ID.
- Naming patterns:
  - Feature: `feat/<実装ID>_<変更内容>`
  - Internal improvement: `chore/<内部改善ID>_<変更内容>`
  - Rollback: `detach/<実装ID>_<変更内容>`
- One branch must handle only one ID.

## Commit Message Rules (kpiee)

- Prefix every commit message with the corresponding ID.
- Naming patterns:
  - Feature: `[実装ID] 説明`
  - Internal improvement: `[内部改善ID] 説明`
  - Rollback: `[DETACH_実装ID] 説明`

## Notes

- For CHORE tickets, use `chore/CHORExxxx_<変更内容>`.
- Current example: `chore/CHORE0333_update_agents_resource_rules`.
- At the end of each session, if there are reusable/general learnings, ask the user whether to append them to `~/.codex/AGENTS.md`.
- Repositories are managed with `ghq`; discover repo paths from `ghq` first when locating projects (for example, `ghq list -p` and `ghq root`).

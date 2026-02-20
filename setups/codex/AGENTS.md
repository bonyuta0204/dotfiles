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
- At the end of each session, classify learnings into `repo-specific` and `general/reusable`.
- Append `repo-specific` learnings only to the current repository `AGENTS.md`.
- Append `general/reusable` learnings only to `~/.codex/AGENTS.md`.
- Never propose appending `repo-specific` learnings to `~/.codex/AGENTS.md`.
- If classification is ambiguous, default to `repo-specific`.
- Before asking to append to either file, first present the exact proposed bullet content, then ask whether to append it.
- Repositories are managed with `ghq`; discover repo paths from `ghq` first when locating projects (for example, `ghq list -p` and `ghq root`).

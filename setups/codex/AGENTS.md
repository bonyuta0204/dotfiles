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
- For conflict resolution between long-lived branches (`develop` and `integration/*`, or `develop` and `staging*`), always create and use a dedicated fix branch (current operation uses `chore/CHORE0333_fix_confict`).
- Never push conflict-resolution commits directly to `develop`, `integration/*`, or `staging*`; create a PR from the dedicated fix branch instead.
- This dedicated-branch rule is only for long-lived branch-to-branch conflict resolution; normal feature-branch conflicts should be resolved on that feature branch.
- At the end of each session, classify learnings into `repo-specific` and `general/reusable`.
- Append `repo-specific` learnings only to the current repository `AGENTS.md`.
- Append `general/reusable` learnings only to `~/.codex/AGENTS.md`.
- Never propose appending `repo-specific` learnings to `~/.codex/AGENTS.md`.
- If classification is ambiguous, default to `repo-specific`.
- Before asking to append to either file, first present the exact proposed bullet content, then ask whether to append it.
- Repositories are managed with `ghq`; discover repo paths from `ghq` first when locating projects (for example, `ghq list -p` and `ghq root`).
- For long-lived design docs and code comments, regularly rewrite toward the current intent/spec and remove obsolete step-by-step history so later readers can understand decisions quickly.
- Before implementation, investigate the relevant specs and similar existing implementations, then develop with explicit consistency in behavior and interfaces unless divergence is intentionally required.
- Mermaid skill では、render 検証を `npx -y -p @mermaid-js/mermaid-cli mmdc` に寄せ、syntax error とは別に quoting/style/comment の heuristic warning を出す補助 script を同梱する。
- `dx-kpiee` の PR CI は `test` environment 保護のため、`waiting` の run は手動承認しないと進まない。
  - 手順1: `gh run list --commit <HEAD_SHA> --json databaseId,workflowName,status,url`
  - 手順2: `gh api -X GET /repos/f-scratch/dx-kpiee/actions/runs/<RUN_ID>/pending_deployments`
  - 手順3: `gh api -X POST /repos/f-scratch/dx-kpiee/actions/runs/<RUN_ID>/pending_deployments --input - <<'JSON'`
    - `{"environment_ids":[7773130912],"state":"approved","comment":"Approve test environment for CI"}`
    - `JSON`
  - 手順4: `gh pr checks <PR番号> --watch`（または `gh run watch <RUN_ID>`）で完了確認する。
  - 補足: `-f environment_ids[]=...` は integer 解釈エラーになることがあるため、`--input` で JSON を渡す。
- 長文の社内発信レビューでは、`内容レビュー` と `最終校正` を分けて進めると、構成調整と誤字修正が混ざらず精度が上がる。
- 外部FBを取り込む時は、全文適用ではなく `適用する / 部分適用にする / 見送る` に分けて方針を決めると、文章の芯を壊しにくい。

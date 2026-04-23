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

## Meaning-First Modeling

- Before changing code, understand the meaning of the workflow rather than the current shape of the implementation. Identify the business object, actor, operation, lifecycle, state transitions, invariants, and failure/empty states in plain language first.
- Treat new booleans, optional props, fallback branches, counters, and ad hoc condition combinations as signals that a concept may be missing. Do not patch the symptom by adding another condition until you can name the concept the condition is standing in for.
- Do not let one variable, ID, DTO, enum, or object carry multiple meanings just because it happens to work in one path. UI selection, operation target, display target, API lookup key, persistence key, cache key, and editing session are different roles unless the domain proves they are the same.
- Model the domain relationship explicitly before choosing the code structure. Prefer named concepts, value objects, discriminated unions, and small resolver functions that make invalid states hard to represent over nullable fields plus scattered branching.
- Place decisions at the layer that owns the meaning. Container/UI orchestration may translate user state into a domain input; data-fetching hooks and API builders should receive already-resolved intent and mechanically translate it. Lower layers should not reconstruct business meaning from raw flags or counts.
- At external boundaries, read the producer/consumer contract and translate language deliberately. Name parameters by what the receiving system uses them to resolve, not by what the current screen appears to show. If UI language, domain language, and API language differ, create an explicit boundary mapping instead of reusing one term everywhere.
- Avoid "safe-looking" fallbacks until the intended absence semantics are clear. A fallback that hides an impossible or invalid state makes the model less truthful; a fallback that represents a real business rule should be named as that rule.
- Before implementing, be able to explain: what concept is being represented, who owns it, which states are valid, which boundary cases matter, what invariants are preserved, and why the chosen model makes later branches unnecessary. If that explanation is vague, keep analyzing rather than coding.

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

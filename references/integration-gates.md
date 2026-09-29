# Review and Integration Gates

## Contents

1. Minimum gates
2. Risk-based gates
3. Severity model
4. Integration checklist
5. Failure handling

## 1. Minimum gates

Every implementation task requires:

- scope and ancestry verification;
- acceptance-criteria verification;
- relevant automated checks;
- independent diff review;
- integration-branch verification after merge.

Documentation-only work still requires factual and consistency review.

## 2. Risk-based gates

| Change type | Additional required gate |
| --- | --- |
| Authentication, authorization, sessions, secrets | Security review |
| Database schema, constraints, migrations, backfills | Data/migration review and rollback analysis |
| Public API or event contract | Compatibility review and contract tests |
| Offline sync, retries, ordering, idempotency | Concurrency and failure-mode review |
| Build, CI, deployment, infrastructure | Environment and rollback verification |
| Performance-critical path | Measurement or benchmark evidence |
| Destructive operation | Explicit human approval |

## 3. Severity model

- **Critical:** likely security compromise, unrecoverable data loss, or production-wide failure. Stop immediately.
- **High:** violates a core contract, permits unauthorized behavior, corrupts state, or breaks the main path. Blocks integration.
- **Medium:** real correctness, reliability, or maintainability problem with bounded impact. Fix before integration unless the owner explicitly accepts deferral.
- **Low:** improvement that does not invalidate acceptance criteria. Record without blocking by default.

Severity depends on demonstrated impact, not tone or reviewer preference.

## 4. Integration checklist

Before merge:

```text
[ ] Correct branch and commit
[ ] Expected base ancestry
[ ] Clean worker worktree
[ ] Diff limited to assigned scope
[ ] Required generated files included
[ ] Required checks passed
[ ] Independent reviews complete
[ ] No unresolved blockers
[ ] Contracts and docs still accurate
```

After merge:

```text
[ ] Integration branch is clean
[ ] Build/typecheck/lint pass as applicable
[ ] Unit and integration tests pass as applicable
[ ] Migrations or generated clients verify cleanly
[ ] End-to-end acceptance path is demonstrable
[ ] Status artifacts reflect actual Git state
```

## 5. Failure handling

When a gate fails:

1. Preserve the failing evidence.
2. Classify whether the fault is implementation, contract, test, environment, or integration.
3. Route a narrow fix to the appropriate owner.
4. Re-run the failed gate and any affected downstream gates.
5. Do not weaken or delete tests merely to obtain green status.

If the contract is wrong, update it deliberately, record the decision, and identify every task or review invalidated by the change.

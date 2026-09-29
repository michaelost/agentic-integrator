# Agent Roles and Assignment Templates

## Contents

1. Role selection
2. Worker assignment
3. Reviewer assignment
4. Evidence report
5. Integrator boundaries

## 1. Role selection

Use the smallest team that reduces risk or latency:

| Role | Use when | May modify files |
| --- | --- | --- |
| Explorer | Separate repository areas need inspection | No |
| Architect | Multiple viable boundaries or major trade-offs exist | Normally no |
| Implementer | A narrow, approved task is ready | Assigned scope only |
| Test agent | Contract-first or independent tests add value | Assigned tests only |
| Specification reviewer | Behavior must be checked against acceptance criteria | No |
| Code-quality reviewer | Correctness and regression risk require independent review | No |
| Security reviewer | Trust boundaries or sensitive flows change | No |
| Integration agent | Mechanical merge support is useful | Only when explicitly authorized |

Do not create roles for ceremony. One reviewer may cover multiple low-risk dimensions if independence remains credible.

## 2. Worker assignment

Every assignment must include:

```text
Outcome:
Base branch and commit:
Worktree or branch:
Read first:
Owned files/modules:
Forbidden scope:
Frozen contracts:
Acceptance criteria:
Verification commands:
Required report:
Stop conditions:
```

Tell the worker not to refactor unrelated code, alter shared contracts, merge branches, or suppress failing checks. If the requested scope is insufficient, the worker should report the smallest necessary expansion rather than taking it silently.

## 3. Reviewer assignment

Reviewers receive the contract, acceptance criteria, base commit, target commit, and relevant repository instructions. Do not provide the implementer's conclusions as ground truth.

Use this finding format:

```text
Severity: critical | high | medium | low
Location: file and symbol or contract section
Evidence: what was observed
Impact: concrete failure or risk
Remediation: smallest viable correction
Confidence: high | medium | low
```

Require reviewers to say “No blocking findings” explicitly when appropriate. Absence of output is not approval.

## 4. Evidence report

Workers return:

```text
Status:
Branch/worktree:
Commit:
Changed files:
Acceptance criteria covered:
Commands run and results:
Known risks or assumptions:
Requested follow-up:
```

The integrator verifies these claims independently before merging.

## 5. Integrator boundaries

The integrator owns:

- shared architecture and contracts;
- dependency graph and wave scheduling;
- file ownership assignments;
- review routing and blocker classification;
- merge order and integrated verification;
- concise communication with the owner.

The integrator must not conceal uncertainty, reinterpret a failed check as success, or approve consequential contract changes merely to keep execution moving.

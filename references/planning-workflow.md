# Planning and Delivery Workflow

## Contents

1. State recovery
2. Discovery
3. Contract and architecture phase
4. Roadmap phase
5. Execution waves
6. Review and integration
7. Completion
8. Durable artifacts

## 1. State recovery

When resuming work, reconstruct reality from the repository rather than relying on conversation summaries:

1. Read repository instructions and active planning documents.
2. Inspect `git status`, the current branch, recent commits, and `git worktree list`.
3. Compare documented task status with actual branches and commits.
4. Mark claims as verified, unverified, stale, or contradictory.
5. Continue only after the active base commit and outstanding work are known.

## 2. Discovery

Identify:

- user-visible outcome and non-goals;
- affected modules and existing conventions;
- current tests and verification commands;
- external dependencies and deployment constraints;
- security, privacy, migration, compatibility, and operational risks;
- ambiguities that change architecture or public behavior.

Use explorer agents only when separate areas can be inspected independently. Explorers should report evidence and make no changes.

## 3. Contract and architecture phase

Document only decisions needed for safe implementation. Depending on the feature, this can include:

- HTTP endpoints and error envelopes;
- database entities, constraints, and transaction boundaries;
- events, messages, idempotency keys, and ordering rules;
- module boundaries and ownership;
- offline, retry, conflict, deletion, and recovery semantics;
- trust boundaries and security invariants.

Resolve blocking security and consistency questions before implementation. Mark the contract frozen with the commit that contains it. Later contract changes require explicit integrator ownership and renewed review of affected tasks.

## 4. Roadmap phase

Build milestones around demonstrable vertical outcomes, not technical layers alone. Each slice should leave the repository in a coherent, verifiable state.

For every slice, capture:

- outcome;
- prerequisites;
- tasks and dependency edges;
- acceptance criteria;
- integration and review gates;
- owner decisions that may block execution.

Do not plan all future slices in implementation-level detail. Elaborate the active slice and keep later slices at milestone level until their prerequisites stabilize.

## 5. Execution waves

A wave contains tasks that:

- have all prerequisites satisfied;
- do not edit overlapping files or shared contracts;
- can be reviewed independently;
- begin from the same declared base when appropriate.

Before launching a wave, record its base commit, task owners, file scopes, expected outputs, and reviewers. Never launch a dependent task merely because its expected prerequisite seems obvious.

## 6. Review and integration

For every task:

1. Verify the worker's branch, commit, diff scope, and test evidence.
2. Run the assigned independent reviews.
3. Route confirmed blockers back to an implementer with narrow remediation scope.
4. Re-review changed areas.
5. Integrate in topological dependency order.
6. Run integrated verification after every meaningful merge group.

If integration reveals a contract conflict, stop the wave, update the contract deliberately, and identify all invalidated work.

## 7. Completion

A slice is complete when its behavior is demonstrable end to end, required checks pass on the integration branch, documentation reflects reality, and follow-up risks are recorded.

Completion does not require implementing unrelated improvements discovered during review. Record non-blocking improvements separately and keep scope stable.

## 8. Durable artifacts

Adapt to the repository's conventions. Typical artifacts include:

```text
docs/
├── architecture.md
├── roadmap.md
├── dependency-graph.md
├── decisions/
├── contracts/
└── agent-tasks/
```

Avoid duplicating equivalent documents. Prefer updating one authoritative artifact. Store decisions that future agents must know in the repository, not only in chat transcripts.

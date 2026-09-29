---
name: agentic-integrator
description: Coordinate substantial software delivery across multiple coding agents. Use when a task requires repository discovery, architecture or API contracts, a roadmap and dependency graph, parallel work in isolated branches or worktrees, independent specification/code/security reviews, controlled integration, or concise owner approval briefs. Also use to resume an existing multi-agent implementation from repository artifacts, or to review an integration branch without changing it.
---

# Agentic Integrator

Turn a feature request into a dependency-aware, review-gated delivery process. Own shared contracts and integration; delegate narrow implementation work; report decisions instead of forwarding raw agent transcripts.

## Choose the operating mode

Infer the narrowest mode that satisfies the request:

- **Plan only:** inspect, design, document, and propose execution waves. Do not implement.
- **Execute:** plan, delegate, review, integrate, and verify within the user's authorization.
- **Review only:** inspect existing work and report findings. Do not modify or merge.
- **Resume:** reconstruct state from Git history and durable repository artifacts before acting.

Do not treat a request to explain, plan, diagnose, or review as permission to modify code or merge branches.

## Establish control before delegation

1. Read repository instructions such as `CLAUDE.md`, `AGENTS.md`, and relevant existing documentation.
2. Inspect Git status, current branch, recent history, available worktrees, project scripts, and affected modules.
3. Preserve unrelated user changes. Stop if they overlap the proposed work and cannot be isolated safely.
4. Define the requested outcome, non-goals, acceptance criteria, risks, and unresolved decisions.
5. Reuse existing architecture and planning artifacts. Create new ones only when durable coordination requires them.
6. Freeze shared contracts before parallel implementation. Keep contract ownership with the integrator unless explicitly delegated.

Read [references/planning-workflow.md](references/planning-workflow.md) for the full phase model and artifact guidance.

## Build the dependency-aware plan

Express work as tasks containing:

- stable task ID and outcome;
- dependencies;
- owned files or modules;
- inputs and frozen contracts;
- acceptance criteria;
- verification commands;
- required reviewer type;
- risk level and approval requirements.

Construct a directed acyclic graph. Put only independent, non-overlapping tasks in the same execution wave. Never parallelize merely to keep agents busy.

Read [references/dependency-graph.md](references/dependency-graph.md) for task format, wave construction, and conflict detection.

## Delegate isolated work

For each worker:

1. Create or verify an isolated branch/worktree from the exact approved base commit.
2. Assign one narrow outcome and explicit file ownership.
3. Include relevant repository instructions, contract references, acceptance criteria, and verification commands.
4. State prohibited files and scope boundaries.
5. Require a commit and a structured evidence report: branch, commit, changed files, commands, results, risks, and assumptions.
6. Instruct the worker to stop on contract ambiguity instead of silently redesigning shared behavior.

Do not ask multiple workers to edit the same shared file concurrently. Use the integrator or a dedicated contract task for shared files.

Read [references/agent-roles.md](references/agent-roles.md) before composing worker or reviewer assignments.

## Review independently

An implementer's self-check is evidence, not approval.

Apply review proportional to risk:

- **Specification review:** verify acceptance criteria and contract compliance.
- **Code-quality review:** verify correctness, maintainability, regressions, and test adequacy.
- **Security review:** required for authentication, authorization, secrets, cryptography, untrusted input, permissions, or sensitive data.
- **Data/migration review:** required for destructive schema changes, backfills, constraints, or compatibility-sensitive persistence.

Keep review independent: reviewers must not rely only on worker summaries. They must inspect the diff and relevant source directly. Return findings with severity, evidence, impact, and a concrete remediation. Block integration on confirmed critical/high findings or failed required checks.

Read [references/integration-gates.md](references/integration-gates.md) for the gate matrix and finding format.

## Integrate in dependency order

Before integrating each branch, independently verify:

- expected branch and base ancestry;
- clean worktree and committed changes;
- changed files remain within scope;
- required tests and reviews passed;
- no unresolved blocking findings;
- downstream contracts remain compatible.

Prefer non-destructive, auditable Git operations. Never force-push, discard user changes, delete branches/worktrees, or bypass protections without explicit authorization.

Integrate prerequisites before dependants. After integration, run the relevant full verification suite on the integration branch; worker-branch results alone are insufficient. Record unresolved risks and deferred work.

The bundled `scripts/verify-worktrees.sh` performs read-only Git inventory checks. Run it from the repository root when worktrees are involved.

## Ask for decisions, not transcript analysis

Pause for human approval when a choice would:

- change a frozen contract or architecture;
- create a meaningful security, privacy, cost, or data-integrity trade-off;
- expand scope materially;
- perform a destructive or difficult-to-reverse action;
- merge despite a blocking finding;
- require credentials, production access, or external coordination not already authorized.

Present one recommended option first, then alternatives and consequences. Do not ask the owner to digest raw worker output.

## Produce concise owner briefs

During execution, report only meaningful state transitions. At a decision point or completion, use the format in [references/owner-brief.md](references/owner-brief.md).

Default to five headings:

1. Outcome
2. Evidence
3. Blockers or risks
4. Recommendation
5. Decision needed

Omit empty headings. Keep the default brief under 12 lines; provide detailed evidence only on request or when needed to justify a consequential recommendation.

## Completion criteria

Do not claim completion until:

- acceptance criteria are satisfied;
- required independent reviews passed;
- integration-branch verification passed;
- documentation and contracts match implemented behavior;
- unresolved risks are explicit;
- the owner receives a concise final brief.

If blocked, identify the exact blocker, preserve completed work, and propose the smallest safe next action.

# Owner Briefs

## Default progress brief

Keep progress updates short and evidence-based:

```text
Outcome: Wave 1 schema and contract tests completed.
Evidence: two scoped commits; schema build passed; expected contract tests await implementation.
Risk: security review found a refresh-token race condition.
Recommendation: amend the contract before starting implementation.
Decision needed: approve the atomic-update approach.
```

## Decision brief

```text
Decision: choose refresh-token concurrency behavior.
Recommendation: atomically mark the presented token used; only one request may succeed.
Why: prevents two valid successor tokens from one credential.
Alternative: serialize the whole session transaction; simpler semantics but greater contention.
Impact of delay: auth implementation remains blocked.
```

Put the recommendation first. Explain no more than the owner needs to make the decision. Link or name the detailed artifact when evidence is extensive.

## Completion brief

```text
Outcome: Slice 1 is integrated and verified.
Evidence: build, typecheck, unit, integration, and security gates passed on the integration branch.
Delivered: email/password auth, device-bound sessions, refresh rotation, and logout revocation.
Residual risks: Google sign-in and rate limiting remain explicitly out of scope.
Next: approve merge to main or begin Slice 2 planning.
```

## Blocked brief

```text
Blocked: the migration conflicts with an existing uncommitted schema change.
Preserved: worker commits and review evidence are intact.
Recommendation: let the owner of the local schema change commit or separate it first.
Decision needed: identify whether the local change belongs to this slice.
```

## Communication rules

- Do not paste full worker reports unless requested.
- Do not hide failed commands or disagreement between reviewers.
- Distinguish verified facts from inferences.
- State when no owner decision is needed.
- Avoid asking the owner to choose between options without recommending one.
- Keep routine briefs under 12 lines.

#!/usr/bin/env bash
set -euo pipefail

repo_path="${1:-.}"

git -C "$repo_path" rev-parse --is-inside-work-tree >/dev/null

printf 'Repository: %s\n' "$(git -C "$repo_path" rev-parse --show-toplevel)"
printf 'Current branch: %s\n' "$(git -C "$repo_path" branch --show-current)"
printf 'Current commit: %s\n' "$(git -C "$repo_path" rev-parse --short HEAD)"

if test -n "$(git -C "$repo_path" status --porcelain)"; then
  printf 'Current worktree: DIRTY\n'
  git -C "$repo_path" status --short
else
  printf 'Current worktree: CLEAN\n'
fi

printf '\nRegistered worktrees:\n'
git -C "$repo_path" worktree list --porcelain

printf '\nRecent branches:\n'
git -C "$repo_path" for-each-ref \
  --sort=-committerdate \
  --count=20 \
  --format='%(refname:short) %(objectname:short) %(committerdate:iso8601)' \
  refs/heads/

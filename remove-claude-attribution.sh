#!/usr/bin/env bash
#
# Removes the "Co-Authored-By: Claude ..." trailer from the five commits made
# in the 2026-10-22 session, which is what puts "claude" in each repository's
# Contributors list.
#
# Each of those commits is the newest commit on main, so only that one commit
# is rewritten in each repository. Nothing earlier in the history is touched.
#
# WHAT THIS DOES, PLAINLY:
#   - clones each repository into a scratch directory
#   - rewrites the newest commit's message with the trailer removed
#   - force-pushes main
#
# The commit SHA changes (that is unavoidable: a commit message is part of the
# commit's identity). The file contents, the author, and the date stay the same.
#
# BEFORE RUNNING: you must be able to push to these repositories, so run this
# on a machine where `git push` to your account already works (SSH key or a
# credential helper / token). Run it from any directory; it works in a scratch
# folder and does not touch your existing clones.
#
# Run:  bash remove-claude-attribution.sh
#       bash remove-claude-attribution.sh --dry-run    # show, change nothing
#

set -euo pipefail

DRY_RUN=0
[ "${1:-}" = "--dry-run" ] && DRY_RUN=1

OWNER="Ouraking"
REPOS=(
  "Ouraking"
  "zero-trust-architecture-phase1"
  "azure-cloud-security-project"
  "secure-network-design"
  "security-audit-compliance"
)

WORK="$(mktemp -d -t declaude-XXXXXX)"
echo "Working in: $WORK"
echo

for REPO in "${REPOS[@]}"; do
  echo "=============================================================="
  echo "  $OWNER/$REPO"
  echo "=============================================================="

  cd "$WORK"
  git clone --quiet "https://github.com/$OWNER/$REPO.git"
  cd "$REPO"

  BRANCH="$(git symbolic-ref --short HEAD)"
  OLD_SHA="$(git rev-parse HEAD)"

  if ! git log -1 --format='%B' | grep -qi 'Co-Authored-By: Claude'; then
    echo "  No Claude trailer on the newest commit. Nothing to do."
    echo
    continue
  fi

  echo "  Branch:        $BRANCH"
  echo "  Commit:        ${OLD_SHA:0:7}  $(git log -1 --format='%s')"
  echo "  Removing trailer lines:"
  git log -1 --format='%B' | grep -iE 'Co-Authored-By: Claude|Claude-Session:' | sed 's/^/      /'

  if [ "$DRY_RUN" -eq 1 ]; then
    echo "  [dry run] would rewrite and force-push."
    echo
    continue
  fi

  # Strip the two attribution lines, then trim trailing blank lines.
  NEW_MSG="$(git log -1 --format='%B' \
    | grep -viE '^[[:space:]]*(Co-Authored-By: Claude|Claude-Session:)' \
    | sed -e :a -e '/^\n*$/{$d;N;};/\n$/ba')"

  git commit --amend --no-edit --message "$NEW_MSG" --quiet
  NEW_SHA="$(git rev-parse HEAD)"

  echo "  Rewrote:       ${OLD_SHA:0:7} -> ${NEW_SHA:0:7}"
  echo "  Message now:"
  git log -1 --format='%B' | sed 's/^/      /'

  # --force-with-lease refuses to push if someone else changed the branch since
  # the clone, so a surprise change upstream is not silently overwritten.
  git push --force-with-lease origin "$BRANCH"
  echo "  Pushed."
  echo
done

echo "=============================================================="
echo "Done."
echo
echo "Check each repository's Contributors list in the right sidebar."
echo "GitHub recomputes it from the commit history, so it can take a few"
echo "minutes and a hard refresh before 'claude' disappears."
echo
echo "Scratch clones are in $WORK and can be deleted:"
echo "  rm -rf $WORK"

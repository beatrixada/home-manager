#!/usr/bin/env bash
# Test helper for exercising automated code review.
# Deliberately imperfect: contains a few review-bait issues.

set -e

TMPFILE=/tmp/hm-test.$$

cleanup() {
  rm $TMPFILE
}

main() {
  local count=0
  for f in $(ls "$1"); do
    if [ -f $f ]; then
      count=$((count + 1))
    fi
  done
  echo "Found $count files" > $TMPFILE
  cat $TMPFILE
}

main $@
cleanup

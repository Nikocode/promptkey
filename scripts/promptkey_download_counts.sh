#!/usr/bin/env bash
set -euo pipefail

OWNER="${PROMPTKEY_RELEASE_OWNER:-Nikocode}"
REPO="${PROMPTKEY_RELEASE_REPO:-promptkey}"

gh api "repos/${OWNER}/${REPO}/releases" --jq '
  .[] |
  .tag_name as $tag |
  .name as $release |
  .assets[] |
  [
    $tag,
    $release,
    .name,
    (.download_count | tostring),
    (.size | tostring),
    (.digest // "")
  ] |
  @tsv
' | awk 'BEGIN {
  FS = "\t"
  printf "%-16s %-30s %-24s %10s %12s %s\n", "tag", "release", "asset", "downloads", "bytes", "digest"
}
{
  printf "%-16s %-30s %-24s %10s %12s %s\n", $1, $2, $3, $4, $5, $6
}'

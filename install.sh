#!/bin/sh
# Sets up Meowdoro's remote helper on this machine (Linux, a VM, another Mac) so its agents show up in the island
# on your Mac. Meowdoro (Settings → Remote agents) shows the exact line to paste:
#   curl -fsSL https://raw.githubusercontent.com/lc66/meowdoro-public/main/install.sh | sh -s -- https://<relay> <code> [name]
# The code carries the channel and the encryption key; it goes to ~/.meowdoro/remote.json (owner-only).
#
# This file is published together with one helper release and knows that release's version and SHA-256:
# it downloads exactly that file (by its version tag, never "latest") and runs it only if the hash matches.
# (In the source repository the two values are placeholders; remote/publish.sh fills them in.)
set -eu

HELPER_VERSION="0.5.0"
HELPER_SHA256="b02e9628c13bc6734e5572daa2af851f0961b41b311e6499bedb4946545d2ae6"
BASE="${MEOWDORO_HELPER_BASE:-https://raw.githubusercontent.com/lc66/meowdoro-public/helper-v$HELPER_VERSION}"

case "$HELPER_SHA256" in
    @*) echo "This is the unpublished install.sh template; use the one from the published repository." >&2; exit 1 ;;
esac

relay="${1:?relay URL missing}"
code="${2:?setup code missing}"
name="${3:-}"

command -v python3 >/dev/null 2>&1 || { echo "Meowdoro needs python3 on this machine." >&2; exit 1; }

mkdir -p "$HOME/.meowdoro/bin"
chmod 700 "$HOME/.meowdoro"
helper="$HOME/.meowdoro/bin/meowdoro-remote"
curl -fsSL "${BASE%/}/meowdoro-remote" -o "$helper.new"

actual=$(python3 -c 'import hashlib, sys; print(hashlib.sha256(open(sys.argv[1], "rb").read()).hexdigest())' "$helper.new")
if [ "$actual" != "$HELPER_SHA256" ]; then
    rm -f "$helper.new"
    echo "Meowdoro: the downloaded helper isn't release $HELPER_VERSION (sha256 $actual). Nothing was installed." >&2
    exit 1
fi
chmod 755 "$helper.new"
mv "$helper.new" "$helper"
echo "Meowdoro: helper $HELPER_VERSION installed."

if [ -n "$name" ]; then
    python3 "$helper" setup "$relay" "$code" "$name"
else
    python3 "$helper" setup "$relay" "$code"
fi

#!/usr/bin/env bash
# Serve the offline deck locally and open it in the browser.
set -euo pipefail

PORT="${1:-8000}"
FILE="Digital Smoke Signals - OFFLINE.html"

cd "$(dirname "$0")"

URL="http://localhost:${PORT}/$(python3 -c "import urllib.parse,sys; print(urllib.parse.quote(sys.argv[1]))" "$FILE")"
echo "Serving on $URL"

# Open in the default browser once the server is up.
( sleep 1; (xdg-open "$URL" >/dev/null 2>&1 || open "$URL" >/dev/null 2>&1 || true) ) &

exec python3 -m http.server "$PORT"

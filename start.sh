#!/bin/bash
set -euo pipefail

[[ -n "${DEBUG:-}" ]] && set -x
addr="${REDIRECT_URL:?REDIRECT_URL is not specified while deploying}"
port="${PORT:?PORT is not specified (it is given by Cloud Run)}"

if ! [[ $addr =~ https?:// ]]; then
    echo >&2 "URL must begin with http:// or https://, got: ${addr}"
    exit 1
fi

# remove trailing slash
addr="${addr%/}"

echo >&2 "Redirect address configured as: \"${addr}\"."

cat > /etc/nginx/nginx.conf <<EOF
daemon off;
user   nginx;
error_log /dev/stderr warn;

events {}

http {
    access_log /dev/stdout;

    server {
        listen ${port};
        return 301 ${addr}\$request_uri;
    }
}
EOF

echo >&2 "CONFIGURATION:"
echo >&2 "--------------"
cat  >&2 /etc/nginx/nginx.conf
echo >&2 "--------------"

exec nginx

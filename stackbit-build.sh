#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://923dc125.ngrok.io/project/5dc07402cda8724a41257050/webhook/build/pull > /dev/null
if [[ -z "${STACKBIT_API_KEY}" ]]; then
    echo "WARNING: No STACKBIT_API_KEY environment variable set, skipping stackbit-pull"
else
    npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://923dc125.ngrok.io/pull/5dc07402cda8724a41257050 
fi
curl -s -X POST https://923dc125.ngrok.io/project/5dc07402cda8724a41257050/webhook/build/ssgbuild > /dev/null
hugo
curl -s -X POST https://923dc125.ngrok.io/project/5dc07402cda8724a41257050/webhook/build/publish > /dev/null

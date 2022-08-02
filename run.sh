#!/bin/sh

export GOOGLE_APPLICATION_CREDENTIALS=/dev/shm/gcs.json

if [[ -z "$GCS_CREDS" ]]; then
	echo "GCS_CREDS environment variable not set" >&2
	exit 2
fi
echo "$GCS_CREDS" >"$GOOGLE_APPLICATION_CREDENTIALS"

./plikd --config ./plikd.cfg

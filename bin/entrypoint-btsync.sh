#!/bin/bash

set -e

dockerize -template "${PROJECT_DIR}/btsync.conf.tmpl:${PROJECT_DIR}/var/btsync.conf"

mkdir -p "${PROJECT_DIR}/var/.sync"
mkdir -p "${PROJECT_DIR}/var/shared_folder"

if [[ -z "$(ls -A ${PROJECT_DIR}/var/.sync)" ]]; then
    # This seems to return with a non-zero exit status, so explicitly allow the
    # script to continue.
    btsync --config "${PROJECT_DIR}/var/btsync.conf" --identity "${HOSTNAME}" || true
fi

exec "$@"

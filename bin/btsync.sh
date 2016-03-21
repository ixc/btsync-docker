#!/bin/bash

set -e

exec dockerize -stdout "${PROJECT_DIR}/var/.sync/sync.log" btsync --config "${PROJECT_DIR}/var/btsync.conf" --nodaemon

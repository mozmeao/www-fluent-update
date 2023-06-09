#!/bin/bash
set -exo pipefail

DOCKER_IMAGE=mozmeao/bedrock:latest

docker pull "$DOCKER_IMAGE"
docker run --rm \
    -e FLUENT_REPO \
    -e FLUENT_REPO_AUTH \
    -e FLUENT_L10N_TEAM_REPO \
    "$DOCKER_IMAGE" \
    python manage.py process_ftl --push

if [[ -n "$SNITCH_ID" ]]; then
    curl "https://nosnch.in/${SNITCH_ID}"
fi

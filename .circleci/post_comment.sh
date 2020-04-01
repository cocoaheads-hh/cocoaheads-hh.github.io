#!/bin/bash

PR_API_URL="$(echo -n ${CIRCLE_PULL_REQUEST} | sed -e 's_github.com_api.github.com/repos_g' -e 's/pull/issues/g')"


echo "Posting to ${PR_API_URL}"
curl --request POST \
  --url "${PR_API_URL}/comments" \
  --header 'accept: application/vnd.github.v3+json' \
  --header 'content-type: application/json' \
  -u cocoaheads-bot:${GITHUB_ACCESS_TOKEN} \
  --data "{\"body\": \"You can find the preview for your commit ${CIRCLE_SHA1} here: http://preview.cocoaheads.hamburg/${CIRCLE_BUILD_NUM}/ \"}" #

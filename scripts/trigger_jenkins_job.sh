#!/bin/sh
PASSWD="${1}"
CRUMB=$(curl -u "admin:${PASSWD}" -s 'http://gcp_jenkins/crumbIssuer/api/xml?xpath=concat(//crumbRequestField,":",//crumb)')
echo "Collected crumb=${CRUMB}"
JOB_URL='http://gcp_jenkins/job/my-first-job'
echo "Trigger job from ${JOB_URL}..."
curl -u "admin:${PASSWD}" -H "${CRUMB}" -X POST "$JOB_URL/build?delay=0sec"
echo "Return code=$?"

#!/bin/sh
PASSWD="${1}"
CRUMB=$(curl -u "admin:${PASSWD}" -s 'http://gcp_jenkins/crumbIssuer/api/xml?xpath=concat(//crumbRequestField,":",//crumb)')
echo "Collected crumb=${CRUMB}"
JOB_URL='http://gcp_jenkins/job/ansible-task'
echo "Trigger job from ${JOB_URL}..."
MESSAGE='Test'
curl -u "admin:${PASSWD}" -H "${CRUMB}" -X POST "$JOB_URL/buildWithParameters?ANSIBLE_MSG=${MESSAGE}"
echo "Return code=$?"

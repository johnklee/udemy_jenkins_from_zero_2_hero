This course is from [here](https://www.udemy.com/course/jenkins-from-zero-to-hero/learn/lecture/12847804#overview)


## 86. Trigger your Jobs from Bash Scripts (No parameters)
This [session](https://www.udemy.com/course/jenkins-from-zero-to-hero/learn/lecture/13085766#overview) is about how to trigger a Jenkins job from bash script. For example `scripts/trigger_jenkins_job.sh`:
```bash
#!/bin/sh
PASSWD="${1}"
CRUMB=$(curl -u "admin:${PASSWD}" -s 'http://gcp_jenkins/crumbIssuer/api/xml?xpath=concat(//crumbRequestField,":",//crumb)')
echo "Collected crumb=${CRUMB}"
JOB_URL='http://gcp_jenkins/job/my-first-job'
echo "Trigger job from ${JOB_URL}..."
curl -u "admin:${PASSWD}" -H "${CRUMB}" -X POST "$JOB_URL/build?delay=0sec"
echo "Return code=$?"
```
For some FAQ regarding to this session, please check [Session 85](https://www.udemy.com/course/jenkins-from-zero-to-hero/learn/lecture/16495944#questions/9476468).

## 87. Trigger your Jobs from Bash Scripts (With Parameters)
This session is about on how to trigger a Jenkins job with parameter(s). For example `scripts/trigger_jenkins_job_with_params.sh`:
```bash
#!/bin/sh
PASSWD="${1}"
CRUMB=$(curl -u "admin:${PASSWD}" -s 'http://gcp_jenkins/crumbIssuer/api/xml?xpath=concat(//crumbRequestField,":",//crumb)')
echo "Collected crumb=${CRUMB}"
JOB_URL='http://gcp_jenkins/job/ansible-task'
echo "Trigger job from ${JOB_URL}..."
MESSAGE='Test'
curl -u "admin:${PASSWD}" -H "${CRUMB}" -X POST "$JOB_URL/buildWithParameters?ANSIBLE_MSG=${MESSAGE}"
echo "Return code=$?"
```

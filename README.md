This course is from [here](https://www.udemy.com/course/jenkins-from-zero-to-hero/learn/lecture/12847804#overview)


## Trigger your Jobs from Bash Scripts (No parameters)
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


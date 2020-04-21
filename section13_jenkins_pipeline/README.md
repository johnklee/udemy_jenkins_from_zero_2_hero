# Jenkins Pipeline - Jenkinsfile
For the resources of this section, please refer to [section13.zip](resources/section13.zip). 
* [Jenkins document - Pipeline](https://jenkins.io/doc/book/pipeline/)

## 131. Introduction to Pipeline
This [**session**](https://www.udemy.com/course/jenkins-from-zero-to-hero/learn/lecture/13624054#overview)

## 132. Introduction to Jenkinsfile
This [**session**](https://www.udemy.com/course/jenkins-from-zero-to-hero/learn/lecture/13624060#overview)

## 133. Install the Jenkins Pipeline Plugin
This [**session**](https://www.udemy.com/course/jenkins-from-zero-to-hero/learn/lecture/13624066#overview) is going to learn how to install the Jenkins pipeline plugging.

## 134. Create your first Pipeline
From this [**session**](https://www.udemy.com/course/jenkins-from-zero-to-hero/learn/lecture/13624072#overview), we're going to be creating our first Jenkins pipeline.

* **first-pipeline**
```groovy
pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building..'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
```
![my first pipeline project](../images/s13_1.PNG)

## 135. Add multi-steps to your Pipeline
From this [**session**](https://www.udemy.com/course/jenkins-from-zero-to-hero/learn/lecture/13624076#overview), we're going to learn how to execute real estate types in our pipeline.
* **multiple-steps**
```groovy
pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'echo "My first pipeline"'
                sh '''
                    echo "By the way, I can do more stuff in here"
                    ls -lah
                '''
            }
        }
    }
}
```
![multiple steps](../images/s13_2.PNG)

## 136. Retry
From this [**session**](https://www.udemy.com/course/jenkins-from-zero-to-hero/learn/lecture/13624080#overview), we're going to learn about retrace in pipeline. ([Timeouts, retries and more](https://jenkins.io/doc/pipeline/tour/running-multiple-steps/#timeouts-retries-and-more))
* **retry**
```groovy
pipeline {
    agent any
    stages {
        stage('Timeout') {
            steps {
                retry(3) {
                    sh 'I am not going to work :c'
                }
            }
        }
    }
}
```
![retry](../images/s13_3.PNG)

## 137. Timeouts
From this [**session**](https://www.udemy.com/course/jenkins-from-zero-to-hero/learn/lecture/13624084#overview), we're going to learn about time outs in the previous video.
* **timeout**
```groovy
pipeline {
    agent any
    stages {
        stage('Deploy') {
            steps {
                retry(3) {
                    sh 'echo hello'
                }

                timeout(time: 3, unit: 'SECONDS') {
                    sh 'sleep 5'
                }
            }
        }
    }
}
```
![aborted](../images/s13_4.PNG)

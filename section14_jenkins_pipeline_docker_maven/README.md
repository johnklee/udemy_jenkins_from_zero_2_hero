# CI/CD + Jenkins Pipeline + Docker + Maven
For the resources of this section, please refer to [section14.zip](resources/section14.zip).

## 142. Introduction
In this [**session**](https://www.udemy.com/course/jenkins-from-zero-to-hero/learn/lecture/13664346#overview), we're going to be building out real pipeline using Jenkins file continuous integration.

## 143. Learn how to install Docker inside of a Docker Container
In this [**session**](https://www.udemy.com/course/jenkins-from-zero-to-hero/learn/lecture/13664352#overview), we're going to learn how to install doctor inside of a doctor container.

## 144. Define the steps for your Pipeline
In this [**session**](https://www.udemy.com/course/jenkins-from-zero-to-hero/learn/lecture/13664360#overview), we're going to define the steps that our pipeline will execute.

## 145. Build: Create a Jar for your Maven App using Docker
In this [**session**](https://www.udemy.com/course/jenkins-from-zero-to-hero/learn/lecture/13713958#overview), we're going to learn how to create a jar how to build a maybe an application using Docker. Firstly, let's pull the necessary image:
```console
# docker pull maven:3-alpine
```
Unzip the resource file into current working dir:
```console
# unzip resources/section14.zip -d ./
# cd jenkins-pipeline/pipeline/
# ls
Dockerfile  java-app  jenkins  Jenkinsfile
```
Then we can start the container to build target app:
```console
# docker run --rm -it -v $PWD/java-app/:/app -v /root/.m2/:/root/.m2/ -w /app maven:3-alpine sh
/app # ls
README.md  jenkins    pom.xml    src        target
/app # mvn package
```
Now we are inside container and build the target app. Or you can execute below command to build directly:
```console
//  -B,--batch-mode                        Run in non-interactive (batch) mode (disables output color)
# docker run --rm -it -v $PWD/java-app/:/app -v /root/.m2/:/root/.m2/ -w /app maven:3-alpine mvn -B -DskipTests clean package
```
You can observe the line `Building jar: /app/target/my-app-1.0-SNAPSHOT.jar` which disclose the location of target jar file.

## 146. Build: Write abash script to automate the Jar creation
In this [**session**](https://www.udemy.com/course/jenkins-from-zero-to-hero/learn/lecture/13713968#overview), we're going to automate the process of creating the jar using Ducker because probably. Check `mvn.sh`:
```bash
#!/bin/bash

echo "***************************"
echo "** Building jar ***********"
echo "***************************"

WORKSPACE=$PWD

docker run --rm  -v  $WORKSPACE/java-app:/app -v /root/.m2/:/root/.m2/ -w /app maven:3-alpine "$@"
```

## 147. Build: Create a Dockerfile and build an image with your Jar
In this [**session**](https://www.udemy.com/course/jenkins-from-zero-to-hero/learn/lecture/13713972#overview), we're going to learn how to create a darker image using that yard that we are generating using Maven. 
```console
# cd jenkins/build/
# docker build -f Dockerfile-Java -t test-app .
# docker images | grep test-app
# docker run test-app
Hello from Pipeline!
```

## 148. Build: Create a Docker Compose file to automate the Image build process
In this [**session**](https://www.udemy.com/course/jenkins-from-zero-to-hero/learn/lecture/13713976#overview), we're going to learn how to create a doctor composed file to automatically build our image.
* **docker-compose-build.yml**
```yaml
version: '3'
services:
  app:
    image: "maven-project:$BUILD_TAG"
    build:
      context: .
      dockerfile: Dockerfile-Java
```
Then you can build the image by command:
```console
#  export BUILD_TAG=1
#  docker-compose -f docker-compose-build.yml build
Building app
Step 1/4 : FROM openjdk:8-jre-alpine
 ---> f7a292bbb70c
Step 2/4 : RUN mkdir /app
 ---> Using cache
 ---> bc769d2de05e
Step 3/4 : COPY *.jar /app/app.jar
 ---> b2646c624e03
Step 4/4 : CMD java -jar /app/app.jar
 ---> Running in 88c227f9fb4d
Removing intermediate container 88c227f9fb4d
 ---> 5b81257a1697
Successfully built 5b81257a1697
Successfully tagged maven-project:1
```

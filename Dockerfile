FROM openjdk:8-alpine3.7

COPY  target/java-maven-junit-helloworld-1.0-SNAPSHOT.jar /home/java-maven-junit-helloworld-1.0-SNAPSHOT.jar

CMD ["java","-jar","/home/java-maven-junit-helloworld-1.0-SNAPSHOT.jar"]

EXPOSE 8888
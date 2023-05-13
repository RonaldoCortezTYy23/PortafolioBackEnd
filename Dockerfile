FROM amazoncorretto:8-alpine-jdk
MAINTAINER Ronaldo
COPY target/mgb-0.0.1-SNAPSHOT.jar   ronaldo-app.jar
ENTRYPOINT ["java","-jar","/ronaldo-app.jar"]
EXPOSE 8080

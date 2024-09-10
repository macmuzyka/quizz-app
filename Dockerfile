#TODO: communicate with database
FROM eclipse-temurin:17-jdk-alpine
MAINTAINER m.muzyka
LABEL authors="m.muzyka"
COPY target/quizz-1.1.0-SNAPSHOT.jar quizz-1.1.0.jar
ENTRYPOINT ["java","-jar", "quizz-1.1.0.jar"]
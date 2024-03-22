FROM openjdk:11
ARG JAR_FILE=target/sourabh/*.jar
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","/app.jar"]

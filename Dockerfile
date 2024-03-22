FROM openjdk:11
COPY /home/vsts/work/1/a/.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]

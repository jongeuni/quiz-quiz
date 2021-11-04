FROM openjdk:11-jdk
EXPOSE 8010
ARG JAR_FILE=build/libs/*.jar
ENV ADMIN_ID = $ADMIN_ID
ENV ADMIN_PW = $ADMIN_PW
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java", "-Dadmin.id=${ADMIN_ID}", "-Dadmin.pw=${ADMIN_PW}", "-jar","/app.jar"]
FROM openjdk:17-alpine

WORKDIR "/demo-app"

ARG VER

COPY ./target/demo-app-${VER}.jar demo-app.jar

CMD ["java", "-jar", "/demo-app/demo-app.jar"]

EXPOSE 8080
FROM maven:3-eclipse-temurin-17 AS builder
WORKDIR build
COPY src/ ./src/
COPY pom.xml ./
RUN mvn clean package

FROM eclipse-temurin:17-jre as runtime
WORKDIR app
COPY --from=builder build/target/*.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]

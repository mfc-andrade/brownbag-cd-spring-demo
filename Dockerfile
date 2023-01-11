FROM maven:3.8.7-eclipse-temurin-17-alpine as builder
WORKDIR /opt/app
COPY pom.xml ./
RUN mvn dependency:go-offline
COPY ./src ./src
RUN mvn clean install


FROM eclipse-temurin:17-jre-alpine
WORKDIR /opt/app
EXPOSE 8080
COPY --from=builder /opt/app/target/*.jar /opt/app/*.jar
ENTRYPOINT ["java", "-jar", "/opt/app/*.jar" ]
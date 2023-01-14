FROM maven:3.8.7-eclipse-temurin-17-alpine as builder
WORKDIR /opt/app
COPY pom.xml ./
COPY ./src ./src
RUN mvn package

FROM eclipse-temurin:17-jre-alpine
WORKDIR /opt/app
EXPOSE 80
COPY --from=builder /opt/app/target/*.jar /opt/app/*.jar
ENTRYPOINT ["java", "-jar", "/opt/app/*.jar", "--server.port=80" ]

#FROM openjdk:17-jdk-alpine
#ARG JAR_FILE=target/*.jar
#COPY ${JAR_FILE} app.jar
#ENTRYPOINT ["java","-jar","/app.jar"]

#FROM openjdk:17-jdk-alpine
#RUN addgroup -S spring && adduser -S spring -G spring
#USER spring:spring
#ARG JAR_FILE=target/*.jar
#COPY ${JAR_FILE} app.jar
#ENTRYPOINT ["java","-jar","/app.jar"]

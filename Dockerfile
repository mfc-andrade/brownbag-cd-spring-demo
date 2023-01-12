#FROM maven:3.8.7-eclipse-temurin-17-alpine as builder
#WORKDIR /opt/app
#COPY pom.xml ./
#RUN mvn dependency:go-offline
#COPY ./src ./src
#RUN mvn clean install
#
#
#FROM eclipse-temurin:17-jre-alpine
#WORKDIR /opt/app
#EXPOSE 8080
#COPY --from=builder /opt/app/target/*.jar /opt/app/*.jar
#ENTRYPOINT ["java", "-jar", "/opt/app/*.jar" ]

#FROM openjdk:17-jdk-alpine
#ARG JAR_FILE=target/*.jar
#COPY ${JAR_FILE} app.jar
#ENTRYPOINT ["java","-jar","/app.jar"]

FROM openjdk:17-jdk-alpine
RUN addgroup -S spring && adduser -S spring -G spring
USER spring:spring
ARG DEPENDENCY=target/dependency
COPY ${DEPENDENCY}/BOOT-INF/lib /app/lib
COPY ${DEPENDENCY}/META-INF /app/META-INF
COPY ${DEPENDENCY}/BOOT-INF/classes /app
ENTRYPOINT ["java","-cp","app:app/lib/*","com.brownbag.demo.DemoApplication"]
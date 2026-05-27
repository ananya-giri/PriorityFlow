# Stage 1: Build the application using Maven & JDK 21
FROM maven:3.9.6-eclipse-temurin-21 AS build
WORKDIR /app

# Copy the build configuration and source code
COPY pom.xml .
COPY src ./src

# Compile and package the application inside the container (skipping tests for speed)
RUN mvn clean package -DskipTests

# Stage 2: Create the runtime JRE image
FROM eclipse-temurin:21
WORKDIR /app

# Copy the compiled executable WAR from the build stage
COPY --from=build /app/target/*.war app.war

# Expose the port for web traffic
EXPOSE 8080

# Run the Spring Boot application using non-blocking urandom to prevent container startup freezes
ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar", "app.war"]

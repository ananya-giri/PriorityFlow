# Use Eclipse Temurin JDK 21 base image
FROM eclipse-temurin:21

# Set the working directory inside the container
WORKDIR /app

# Copy the compiled JAR file from target directory into the container
COPY target/*.jar app.jar

# Expose port 8080 for web traffic
EXPOSE 8080

# Run the Spring Boot application
ENTRYPOINT ["java", "-jar", "app.jar"]

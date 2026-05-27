# Use a modern OpenJDK image to match and support your local Java 26 runtime
FROM openjdk:latest

# Set the working directory inside the container
WORKDIR /app

# Copy the compiled JAR file from target directory into the container
COPY target/*.jar app.jar

# Expose port 8080 for web traffic
EXPOSE 8080

# Run the Spring Boot application
ENTRYPOINT ["java", "-jar", "app.jar"]

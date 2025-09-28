# Use official OpenJDK 21 as base image
FROM eclipse-temurin:21-jdk-jammy

# Set working directory inside container
WORKDIR /app

# Copy the built JAR into the container
COPY target/cloudfullstack-0.0.1-SNAPSHOT.jar app.jar

# Expose port
EXPOSE 8080

# Run the Spring Boot app
ENTRYPOINT ["java", "-jar", "app.jar"]

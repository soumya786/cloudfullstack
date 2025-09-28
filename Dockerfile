# Stage 1: Build the application
FROM maven:3.9.6-eclipse-temurin-21 AS build
WORKDIR /workspace/app

# Copy the Maven project files
COPY pom.xml .
COPY src src/

# Build the application
RUN mvn clean package -DskipTests

# Stage 2: Create the runtime image
FROM eclipse-temurin:21-jre-jammy

# Set working directory inside container
WORKDIR /app

# Copy the JAR from the build stage
COPY --from=build /workspace/app/target/cloudfullstack-0.0.1-SNAPSHOT.jar app.jar

# Expose port
EXPOSE 8080

# Run the Spring Boot app
ENTRYPOINT ["java", "-jar", "app.jar"]

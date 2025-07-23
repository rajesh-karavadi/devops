# Use OpenJDK as base image
FROM openjdk:11-jdk-slim

# Set working directory
WORKDIR /app

# Copy app
COPY ./app /app

# Build the app using Maven
RUN apt-get update && apt-get install -y maven && \
    mvn clean package -DskipTests

# Run the app
CMD ["java", "-jar", "target/java-docker-app-1.0-SNAPSHOT-jar-with-dependencies.jar"]

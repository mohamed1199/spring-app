FROM adoptopenjdk/openjdk11:alpine-jre

# Set the working directory to /app
WORKDIR /usr/app

# Copy the build files from the host to the container
COPY build/libs/demo-0.0.1-SNAPSHOT.jar /usr/app.jar

# Expose port 80 for the container
EXPOSE 80

# Set the command to run when the container starts
CMD ["java", "-jar", "/app.jar"]

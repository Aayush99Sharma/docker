# Use the official MySQL image from Docker Hub
FROM mysql:latest

# Copy the custom initialization SQL script into the image
COPY init.sql /docker-entrypoint-initdb.d/

# Expose MySQL default port
EXPOSE 3306

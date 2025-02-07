# Use the official Nginx image
FROM nginx:latest

# Set the working directory
WORKDIR /etc/nginx

# Remove the default Nginx config
RUN rm -rf /etc/nginx/conf.d/default.conf

# Copy the custom Nginx configuration file
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Expose port 80 for HTTP traffic
EXPOSE 80



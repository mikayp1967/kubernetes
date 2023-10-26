# Use the official Nginx image as a base
FROM nginx:latest

# Remove the default Nginx configuration
RUN rm /etc/nginx/conf.d/default.conf

# Copy my custom Nginx configuration to the container
COPY nginx.conf /etc/nginx/conf.d/

# Expose port 80 for HTTP
EXPOSE 80

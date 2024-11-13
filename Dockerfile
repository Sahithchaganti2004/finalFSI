# Start from an official Nginx image
FROM nginx:alpine

# Remove the default Nginx configuration
RUN rm /usr/share/nginx/html/*

# Copy the static website files from the build context into the Nginx directory
COPY ./index.html /usr/share/nginx/html

# Expose port 80 to access the website
EXPOSE 80

# Start Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]

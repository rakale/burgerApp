# Use an official Node.js runtime as the base image
FROM node:latest as build

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install the dependencies
RUN npm install

# Copy all the source files to the container
COPY . .

# Build the React app for production
RUN npm run build

# Use a lightweight Nginx server to serve the production build
FROM nginx:alpine

# Copy the build files from the previous stage to the Nginx server
COPY --from=build /app/build /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Command to start Nginx
CMD ["nginx", "-g", "daemon off;"]

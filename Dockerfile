# Use official Node.js LTS version as base image
FROM node:18

# Set working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json first
# This helps Docker cache npm install if these files haven't changed
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of your application files
COPY . .

# Expose the port your app will run on
EXPOSE 3000

# Start the application
CMD ["node", "index.js"]



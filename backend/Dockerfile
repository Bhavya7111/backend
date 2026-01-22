# Dockerfile for backend
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the source code
COPY . .

# Expose port 5000
EXPOSE 5000

# Start the server
CMD ["node", "src/server.js"]

FROM node:18-alpine

WORKDIR /app

# Copy package files
COPY package*.json ./

RUN npm install

# Copy backend source code
COPY . .

EXPOSE 5000

CMD ["npm", "start"]

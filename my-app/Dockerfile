# Base image
FROM node:18

# Working directory
WORKDIR /app

# Copy app files
COPY package*.json ./
RUN npm install
COPY . .

# Expose app port
EXPOSE 3000

# Start command
CMD ["node", "app.js"]

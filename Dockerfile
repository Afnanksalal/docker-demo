# 1. Start from the official Node.js 20 image (Alpine = tiny Linux distro)
FROM node:20-alpine

# 2. Set the working directory inside the container
WORKDIR /app

# 3. Copy ONLY package files first (so npm install is cached separately)
COPY package*.json ./

# 4. Install dependencies (ci = clean install, faster and consistent)
RUN npm ci --only=production

# 5. Copy the rest of the source code
COPY . .

# 6. Tell Docker which port the app listens on (documentation only)
EXPOSE 3000

# 7. The command to run when the container starts
CMD ["node", "index.js"]
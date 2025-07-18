FROM node:20-alpine

WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm ci --only=production

# Copy built artifacts
COPY dist/ ./dist/

# Create symlink for global access
RUN npm link

EXPOSE 8000

ENTRYPOINT ["supergateway"]
CMD ["--help"]
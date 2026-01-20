# Multi-stage build for Astro static site
FROM node:18-alpine AS builder

# Set working directory
WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm ci

# Copy source code
COPY . .

# Build the application
RUN npm run build

# Production stage
FROM nginx:alpine AS production

# Install curl for health checks
RUN apk add --no-cache curl

# Copy built assets from builder stage
COPY --from=builder /app/dist /usr/share/nginx/html

# Copy nginx configuration for SPA
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Create non-root user
RUN addgroup -g 1001 -S nodejs && adduser -S astro -u 1001

# Change ownership
RUN chown -R astro:nodejs /usr/share/nginx/html
RUN chown -R astro:nodejs /var/cache/nginx
RUN chown -R astro:nodejs /var/log/nginx
RUN chown -R astro:nodejs /etc/nginx/conf.d
RUN touch /var/run/nginx.pid
RUN chown -R astro:nodejs /var/run/nginx.pid

# Switch to non-root user
USER astro

# Expose port 80
EXPOSE 80

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD curl -f http://localhost/health || exit 1

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
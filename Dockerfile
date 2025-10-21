FROM n8nio/n8n:latest

# Set working directory
WORKDIR /home/node

# Set environment variables
ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=5678
ENV N8N_PROTOCOL=https
ENV N8N_BASIC_AUTH_ACTIVE=false
ENV N8N_SECURE_COOKIE=false

# Create .n8n directory
USER root
RUN mkdir -p /home/node/.n8n/workflows
RUN chown -R node:node /home/node/.n8n
USER node

# Copy workflow
COPY --chown=node:node workflow.json /home/node/.n8n/workflows/

# Expose port
EXPOSE 5678

# Start n8n
CMD ["n8n", "start"]
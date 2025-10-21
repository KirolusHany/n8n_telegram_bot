FROM n8nio/n8n:latest

# Set working directory
WORKDIR /home/node

# Copy workflow
COPY --chown=node:node workflow.json /home/node/.n8n/workflows/

# Fix permissions
USER root
RUN chown -R node:node /home/node/.n8n
USER node

# Environment variables
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true
ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=5678
ENV N8N_PROTOCOL=http
ENV N8N_BASIC_AUTH_ACTIVE=false
ENV N8N_SECURE_COOKIE=false

# Expose port
EXPOSE 5678

# Use the default startup command from the base image
ENTRYPOINT ["tini", "--"]
CMD ["n8n"]

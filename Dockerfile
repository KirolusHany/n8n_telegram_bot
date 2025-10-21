FROM n8nio/n8n:latest

# Switch to root to create directories and set permissions
USER root

# Create necessary directories
RUN mkdir -p /home/node/.n8n/workflows /home/node/.n8n/nodes

# Copy workflow file
COPY workflow.json /home/node/.n8n/workflows/

# Set proper ownership
RUN chown -R node:node /home/node/.n8n

# Switch back to node user
USER node

# Set all environment variables
ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=5678
ENV N8N_PROTOCOL=https
ENV N8N_BASIC_AUTH_ACTIVE=false
ENV N8N_SECURE_COOKIE=false
ENV N8N_USER_MANAGEMENT_DISABLED=true
ENV N8N_DIAGNOSTICS_ENABLED=false
ENV N8N_VERSION_NOTIFICATIONS_ENABLED=false
ENV N8N_TEMPLATES_ENABLED=false
ENV N8N_ONBOARDING_FLOW_DISABLED=true
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=false
ENV WEBHOOK_URL=https://n8ntelegrambot-production.up.railway.app
ENV N8N_PAYLOAD_SIZE_MAX=16

# Expose port
EXPOSE 5678

# Use the original entrypoint and command
ENTRYPOINT ["tini", "--"]
CMD ["n8n", "start"]
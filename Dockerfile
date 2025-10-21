# Use the official n8n image
FROM n8nio/n8n:latest

# Set environment variables
ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=5678
ENV N8N_PROTOCOL=https
ENV N8N_BASIC_AUTH_ACTIVE=false
ENV N8N_SECURE_COOKIE=false
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true

# Copy workflow (optional)
COPY --chown=node:node workflow.json /home/node/.n8n/workflows/workflow.json

# Expose the correct port
EXPOSE 5678

# Start n8n (no "start" argument!)
CMD ["n8n"]

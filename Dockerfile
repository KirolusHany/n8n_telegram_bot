FROM n8nio/n8n:latest

WORKDIR /home/node

USER root
RUN mkdir -p /home/node/.n8n/workflows
RUN chown -R node:node /home/node/.n8n
USER node

COPY --chown=node:node workflow.json /home/node/.n8n/workflows/

ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=5678
ENV N8N_PROTOCOL=https
ENV N8N_BASIC_AUTH_ACTIVE=false
ENV N8N_SECURE_COOKIE=false
ENV N8N_USER_MANAGEMENT_DISABLED=true

EXPOSE 5678

CMD ["sh", "-c", "n8n import:workflow --input=/home/node/.n8n/workflows/workflow.json && n8n start"]
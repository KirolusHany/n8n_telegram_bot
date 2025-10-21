FROM n8nio/n8n:latest

USER root
RUN mkdir -p /home/node/.n8n/workflows
USER node

COPY workflow.json /home/node/.n8n/workflows/

ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=5678
ENV N8N_BASIC_AUTH_ACTIVE=false

EXPOSE 5678
CMD ["n8n"]
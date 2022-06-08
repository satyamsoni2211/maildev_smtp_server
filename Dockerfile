FROM node:latest
COPY package.json .
ARG SMTP_PORT=1025
ARG SERVER_PORT=1080
RUN yarn
CMD yarn maildev --smtp=${SMTP_PORT} --web=${SERVER_PORT}
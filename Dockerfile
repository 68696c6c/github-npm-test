FROM node:16-buster AS base

RUN mkdir /app
WORKDIR /app

FROM base AS final
COPY . .
RUN yarn

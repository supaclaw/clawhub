FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
  ca-certificates \
  curl \
  git \
  build-essential \
  pkg-config \
  openssl \
  zip \
  && rm -rf /var/lib/apt/lists/*

ENV BUN_INSTALL=/root/.bun
ENV PATH="${BUN_INSTALL}/bin:${PATH}"

RUN curl -fsSL https://bun.sh/install | bash

WORKDIR /app

COPY package.json bun.lock ./
COPY packages/schema/package.json ./packages/schema/package.json
COPY packages/clawdhub/package.json ./packages/clawdhub/package.json

RUN bun install --frozen-lockfile || bun install

COPY . .

RUN bun run build

ENV NODE_ENV=production

EXPOSE 3000

CMD ["bun", "run", "preview"]

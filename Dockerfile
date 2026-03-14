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

# Local-only container defaults so the app can build and boot without
# external Convex/SoulHub deployment configuration.
ENV NODE_ENV=production \
  VITE_SITE_URL=http://localhost:3000 \
  SITE_URL=http://localhost:3000 \
  VITE_SITE_MODE=skills \
  VITE_SOULHUB_SITE_URL=http://localhost:3000 \
  VITE_SOULHUB_HOST=localhost \
  VITE_CONVEX_SITE_URL=http://localhost:3000 \
  CONVEX_SITE_URL=http://localhost:3000 \
  VITE_CONVEX_URL=http://127.0.0.1:3210

RUN bun run build

EXPOSE 3000

CMD ["bun", "run", "preview", "--host", "0.0.0.0", "--port", "3000"]

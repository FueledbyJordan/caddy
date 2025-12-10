FROM caddy:builder AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare@2fc25ee62f40fe21b240f83ab2fb6e2be6dbb953

FROM caddy@sha256:dedfbbeb703b2ce9ff4a98fc06aa9c7c7d9a42f0b7d778738c1dd3ef11dcc767

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

FROM caddy:builder AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare@2fc25ee62f40fe21b240f83ab2fb6e2be6dbb953

FROM caddy@sha256:4fcafa98afd1c2e642e353e3c5cf9ddbe892fcee14bc990e7ba2c5b78e51f9cf

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

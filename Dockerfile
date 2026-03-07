FROM caddy:builder AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare@2fc25ee62f40fe21b240f83ab2fb6e2be6dbb953

FROM caddy@sha256:261437d35b88cc2f8fa1ed337ebb6b6ce2bd5cd61b2a28cdf83cb201db0a853b

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

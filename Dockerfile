FROM caddy:builder AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare@2fc25ee62f40fe21b240f83ab2fb6e2be6dbb953

FROM caddy@sha256:ce773ec7a742ce15ee6bf2bb5f65882b9e2a4487b10733e6f1484f86e6b5d8bc

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

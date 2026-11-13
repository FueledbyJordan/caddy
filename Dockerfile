FROM caddy:builder AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare@2fc25ee62f40fe21b240f83ab2fb6e2be6dbb953

FROM caddy@sha256:9c1b76fb701c1f77383d3124d9f626e38bcf83bc1255ed47475d4f2420701d03

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

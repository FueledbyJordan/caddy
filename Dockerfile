FROM caddy:builder AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare@2fc25ee62f40fe21b240f83ab2fb6e2be6dbb953

FROM caddy@sha256:13b7fbadd017b042956fddbceedeeea12bb1e560534f9b3df281269dbcc61813

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

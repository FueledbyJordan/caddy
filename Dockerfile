FROM caddy:builder AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare@2fc25ee62f40fe21b240f83ab2fb6e2be6dbb953

FROM caddy@sha256:504a44d7d74bd2bc28a66afc4774912fc21223ca8a67734af1c54ab2f999b489

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

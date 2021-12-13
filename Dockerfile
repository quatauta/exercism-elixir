ARG ELIXIR_VERSION=latest
FROM elixir:${ELIXIR_VERSION}-alpine
RUN apk add bash

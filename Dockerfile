FROM alpine:latest

RUN apk add elixir nodejs npm inotify-tools

WORKDIR /app

RUN mix local.hex --force
RUN mix local.rebar --force

RUN mix archive.install hex phx_new 1.5.8 --force

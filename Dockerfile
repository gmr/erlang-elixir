FROM erlang:21

ARG ELIXIR_VERSION=1.10.4
ARG ELIXIR_SHA512=9727ae96d187d8b64e471ff0bb5694fcd1009cdcfd8b91a6b78b7542bb71fca59869d8440bb66a2523a6fec025f1d23394e7578674b942274c52b44e19ba2d43

ENV MIX_ENV=prod LANG=C.UTF-8

RUN set -xe \
  && ELIXIR_DOWNLOAD_URL="https://github.com/elixir-lang/elixir/releases/download/v${ELIXIR_VERSION}/Precompiled.zip" \
  && curl -sfSL -o /tmp/precompiled.zip ${ELIXIR_DOWNLOAD_URL} \
  && echo "${ELIXIR_SHA512} /tmp/precompiled.zip" | sha512sum -c - \
  && cd /usr/local \
  && unzip /tmp/precompiled.zip \
  && rm /tmp/precompiled.zip \
  && mix local.hex --force \
  && mix local.rebar --force

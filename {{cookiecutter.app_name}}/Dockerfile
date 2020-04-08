FROM elixir:1.10.2 as build

# install build dependencies
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list && \
  apt update && \
  apt install -y yarn python git && \
  node --version && \
  yarn --version && \
  npm --version && \
  rm -rf /var/lib/apt/lists/* /tmp/*

# prepare build dir
RUN mkdir /app
WORKDIR /app

# install hex + rebar
RUN mix local.hex --force && \
mix local.rebar --force

# set build ENV
ENV MIX_ENV=prod

# install mix dependencies
COPY mix.exs mix.lock ./
COPY VERSION VERSION
COPY config config
RUN mix deps.get
RUN mix deps.compile

# add assets
COPY assets assets
COPY priv priv
RUN cd assets && npm install && npm run build

# build project
COPY lib lib
RUN mix phx.digest
RUN mix compile

# build release (uncomment COPY if rel/ exists)
# COPY rel rel
RUN mix release



# prepare release image
FROM elixir:1.10.2 AS app

RUN mkdir /app
WORKDIR /app

COPY --from=build /app/_build/prod/rel/{{ cookiecutter.app_name }} ./
RUN chown -R nobody: /app
USER nobody

ENV HOME=/app

CMD bin/{{ cookiecutter.app_name }} start

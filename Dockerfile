FROM ruby:latest

# DebianまたはUbuntuLinuxでDebianパッケージリポジトリからYarnをインストールするためのリポジトリ構成指定
# webpackerのインストールにnodejsとyarnが必須
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
  apt-get update -qq && apt-get install -y \
  nodejs \
  yarn \
  postgresql-client \
  imagemagick \
  build-essential \
  libpq-dev && \
  mkdir /app
WORKDIR /app
COPY Gemfile Gemfile.lock /app/
RUN bundle install

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]

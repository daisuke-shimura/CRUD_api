FROM ruby:3.2.3-slim

# 必要パッケージのインストール
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y \
    git \
    libsqlite3-dev \
    sqlite3 \
    build-essential \
    curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Railsアプリのディレクトリ
WORKDIR /app

# Gemfileを先にコピーしてbundle install
COPY Gemfile Gemfile.lock ./
RUN gem install bundler && \
    bundle install

# アプリのソースをコピー
COPY . .

# ポート開放 & 起動コマンド
EXPOSE 3000
#CMD ["rails", "server", "-b", "0.0.0.0"]

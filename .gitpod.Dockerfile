FROM ruby:3.1.2-buster

# Prepare to install node and yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
  curl -fsSL https://deb.nodesource.com/setup_16.x | bash - && \
  # Install node and yarn
  apt-get update && apt-get install -y nodejs yarn && \
  # Install redis-server
  apt-get install -y redis-server && \
  # Install zsh
  apt-get install -y zsh && \
  # Update git
  add-apt-repository ppa:git-core/ppa && \
  apt-get update && apt-get install git && \
  rm -rf /var/lib/apt/lists/*

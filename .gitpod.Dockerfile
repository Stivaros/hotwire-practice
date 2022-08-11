FROM gitpod/workspace-base

RUN sudo apt update && \
  # Install Ruby dependencies
  sudo apt-get install -y autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm6 libgdbm-dev libdb-dev uuid-dev && \
  # Install Ruby from source
  curl -L https://cache.ruby-lang.org/pub/ruby/3.1/ruby-3.1.2.tar.gz | tar xvzf - -C /tmp && \
  cd /tmp/ruby-3.1.2 && ./configure && make && sudo make install && \
  rm -rf /tmp/ruby-3.1.2 && \
  # Prepare to install node and yarn
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list && \
  curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash - && \
  # Install node and yarn
  sudo apt update && sudo apt install -y nodejs yarn && \
  # Install redis-server
  sudo apt-get install -y redis-server && \
  sudo rm -rf /var/lib/apt/lists/* && \
  # Move omz config back into Dockerfile
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended && \
  curl https://raw.githubusercontent.com/Stivaros/dotfiles/main/.zsh/.zshrc > ~/.zshrc

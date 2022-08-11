FROM gitpod/workspace-ruby-3

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list && \
    curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash - && \
    # Install node and yarn
    sudo apt update && sudo apt install -y nodejs yarn && \
    # Install redis-server
    sudo apt-get install -y redis-server && \
    sudo rm -rf /var/lib/apt/lists/* && \
    # Move omz config back into Dockerfile
    mv ~/.zshrc ~/.zshrc_gp && \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended && \
    curl https://raw.githubusercontent.com/Stivaros/dotfiles/main/.zsh/.zshrc > ~/.zshrc && \
    echo '[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"' >> ~/.zshrc

ENV GEM_HOME=/home/gitpod/.rvm/ruby-3.1.2
ENV GEM_PATH=$GEM_HOME:$GEM_HOME@global
ENV PATH=/home/gitpod/.rvm/bin:$PATH

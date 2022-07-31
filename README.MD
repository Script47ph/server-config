# My configuration settings for server

## Installation
### With script

    curl -sL https://raw.github.com/script47ph/server-config/master/install.sh | bash


### Manual
1. Update the system
    
    ```bash
    sudo apt-get update && \
    sudo apt-get upgrade -y && \
    sudo apt-get install -y git zsh wget unzip vim
    ```

2.  Install oh-my-zsh
    
    ```bash
    curl -sL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | bash && \
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting && \
    sed -i 's/plugins=(git)/plugins=(git zsh-syntax-highlighting)/g' ~/.zshrc
    ```
3.  Install ohmyposh
    ```bash
    sudo wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh && \
    sudo chmod +x /usr/local/bin/oh-my-posh
    ```
4.  Download themes
    ```bash
    mkdir ~/.poshthemes && \
    wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/themes.zip -O ~/.poshthemes/themes.zip && \
    unzip ~/.poshthemes/themes.zip -d ~/.poshthemes && \
    chmod u+rw ~/.poshthemes/*.omp.* && \
    rm ~/.poshthemes/themes.zip
    ```
5.  Set the default theme and zsh configuration
    ```bash
    echo -e 'eval "$(oh-my-posh init zsh --config ~/.poshthemes/material.omp.json)" \nalias="clear"' >> ~/.zshrc && \
    chsh -s /bin/zsh
    ```
6.  Additional settings
    ```bash
    echo -e "set number \nsyntax on" > ~/.vimrc
    ```
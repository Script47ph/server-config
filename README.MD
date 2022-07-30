# My configuration settings for server

## Installation
### With script

    curl -sL https://raw.githubusercontent.com/script47ph/server-config/master/install.sh | bash


### Manual
1. Update the system
    
    ```bash
    sudo apt-get update && \
    sudo apt-get upgrade -y && \
    sudo apt-get install -y git zsh wget unzip vim
    ```
2.  Install ohmyposh
    ```bash
    sudo wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh && \
    sudo chmod +x /usr/local/bin/oh-my-posh
    ```
3.  Download themes
    ```bash
    mkdir ~/.poshthemes && \
    wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/themes.zip -O ~/.poshthemes/themes.zip && \
    unzip ~/.poshthemes/themes.zip -d ~/.poshthemes && \
    chmod u+rw ~/.poshthemes/*.omp.* && \
    rm ~/.poshthemes/themes.zip
    ```
4.  Set the theme and zsh to default shell
    ```bash
    echo "eval '$(oh-my-posh init zsh --config ~/.poshthemes/material.omp.json)'" >> ~/.zshrc && \
    chsh -s $(which zsh)
    ```
5.  Set Vim
    ```bash
    echo "set number" \n "syntax on" > ~/.vimrc
    ```
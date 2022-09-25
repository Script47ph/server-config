#!/bin/bash
OS=$(cat /etc/os-release | grep ID= | grep -vE "VERSION_ID" | cut -d= -f2 | tr -d \");

# Update Repository
echo "Update repository..."
if [[ $OS == ubuntu || $OS == debian ]];
then
    sudo apt-get update > /dev/null
elif [[ $OS == centos || $OS == almalinux || $OS == rockylinux ]];
then
    sudo yum update > /dev/null
else
    echo "Your OS not support yet. Please contact Admin."
    exit 0
fi

# Install dependencies
echo "Install dependencies..."
if [[ $OS == ubuntu || $OS == debian ]];
then
    if [ -f /usr/bin/lsb_release ];
    then
        sudo apt-get install -y git zsh wget unzip vim > /dev/null
    else
        sudo apt-get install -y git zsh wget unzip vim lsb-release > /dev/null
    fi
elif [[ $OS == centos || $OS == almalinux || $OS == rockylinux ]];
then
    if [ -f /usr/bin/lsb_release ];
    then
        sudo yum install -y epel-release
        sudo yum install -y git zsh wget unzip vim > /dev/null
    else
        sudo yum install -y epel-release
        sudo yum install -y git zsh wget unzip vim redhat-lsb-core > /dev/null
    fi
else
    echo "Your OS not support yet. Please contact Admin."
    exit 0
fi

# Get Oh-my-zsh packages
curl -sL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | bash > /dev/null

# Get zsh syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Add plugin zsh syntax highlighting
sed -i 's/plugins=(git)/plugins=(git zsh-syntax-highlighting)/g' ~/.zshrc

# Get Oh-my-posh
sudo wget -q https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh
sudo chmod +x /usr/local/bin/oh-my-posh
mkdir -p ~/.poshthemes
wget -q https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/themes.zip -O ~/.poshthemes/themes.zip
unzip ~/.poshthemes/themes.zip -d ~/.poshthemes > /dev/null
chmod u+rw ~/.poshthemes/*.omp.*
rm -rf ~/.poshthemes/themes.zip
echo "Setup zsh as default shell..."
echo -e 'eval "$(oh-my-posh init zsh --config ~/.poshthemes/material.omp.json)" \nalias cl="clear"' >> ~/.zshrc
chsh -s $(which zsh)
echo -e "set number \nsyntax on" > ~/.vimrc
echo "Successfully installed! Enjoy your new shell!" "Exiting..."
sleep 3
exit 0

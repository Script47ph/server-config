#!/bin/bash
echo "Update repository..."
sudo apt-get update > /dev/null
echo "Install dependencies..."
sudo apt-get install -y git zsh wget unzip vim > /dev/null
curl -sL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | bash > /dev/null
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
sed -i 's/plugins=(git)/plugins=(git zsh-syntax-highlighting)/g' ~/.zshrc
sudo wget -q https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh
sudo chmod +x /usr/local/bin/oh-my-posh
mkdir -p ~/.poshthemes
wget -q https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/themes.zip -O ~/.poshthemes/themes.zip
unzip ~/.poshthemes/themes.zip -d ~/.poshthemes > /dev/null
chmod u+rw ~/.poshthemes/*.omp.*
rm ~/.poshthemes/themes.zip
echo "Setup zsh as default shell..."
echo -e 'eval "$(oh-my-posh init zsh --config ~/.poshthemes/material.omp.json)" \nalias cl="clear"' >> ~/.zshrc
chsh -s $(which zsh)
echo -e "set number \nsyntax on" > ~/.vimrc
echo "Successfully installed! Enjoy your new shell!" "Exiting..."
sleep 3
exit 0
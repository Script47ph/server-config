#!/bin/bash
echo "Update and upgrade repository..."
sudo apt-get update > /dev/null && sudo apt-get upgrade -y > /dev/null
echo "Install dependencies..."
sudo apt-get install -y git zsh wget unzip vim > /dev/null
curl -sL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | bash > /dev/null
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
sed -i 's/plugins=(git)/plugins=(git zsh-syntax-highlighting)/g' $HOME/.zshrc
sudo wget -q https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh
sudo chmod +x /usr/local/bin/oh-my-posh
mkdir -p $HOME/.poshthemes
wget -q https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/themes.zip -O $HOME/.poshthemes/themes.zip
unzip $HOME/.poshthemes/themes.zip -d $HOME/.poshthemes > /dev/null
chmod u+rw $HOME/.poshthemes/*.omp.*
rm $HOME/.poshthemes/themes.zip
echo "Setup zsh as default shell..."
echo -e 'eval "$(oh-my-posh init zsh --config ~/.poshthemes/material.omp.json)" \nalias="clear"' >> $HOME/.zshrc
chsh -s $(which zsh)
echo -e "set number \nsyntax on" > $HOME/.vimrc
echo "Successfully installed! Enjoy your new shell!" "Exiting..."
sleep 3
exit 0
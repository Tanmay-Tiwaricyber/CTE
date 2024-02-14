#!/bin/bash

# CyberTerminalEnhancer - One-click terminal enhancement tool

# Colors
red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
blue='\033[0;34m'
purple='\033[0;35m'
cyan='\033[0;36m'
white='\033[0;37m'
clear='\033[0m'

# Banner
echo -e "${purple}"
echo "_________ ______________________ "
echo "\_   ___ \\__    ___/\_   _____/ "
echo "/    \  \/  |    |    |    __)_  "
echo "\     \____ |    |    |        \ "
echo " \______  / |____|   /_______  / "
echo "        \/                   \/  "
echo -e "${clear}"
echo -e "${yellow}          Your terminal is about to get an awesome techy makeover!${clear}"

# Function to install and set up Zsh and Oh My Zsh
install_zsh() {
    echo -e "${green}[*] Installing Zsh and Oh My Zsh...${clear}"
    pkg install zsh -y
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}

# Function to install and set up Powerlevel10k theme
install_powerlevel10k() {
    echo -e "${green}[*] Installing Powerlevel10k theme...${clear}"
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $HOME/.oh-my-zsh/themes/powerlevel10k
}

# Function to update .zshrc configuration
update_zshrc() {
    echo -e "${green}[*] Updating .zshrc configuration...${clear}"
    sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="powerlevel10k\/powerlevel10k"/' $HOME/.zshrc
    echo "source ~/.oh-my-zsh/themes/powerlevel10k/powerlevel10k.zsh-theme" >> $HOME/.zshrc
}

# Main function
main() {
    install_zsh
    install_powerlevel10k
    update_zshrc

    echo -e "${green}[+] Terminal enhancement completed successfully! Please restart your terminal.${clear}"
}

# Execute main function
main

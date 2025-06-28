sudo apt update && sudo apt upgrade -y

sudo apt install -y build-essential curl wget git vim nano htop tree unzip

sudo apt install -y git-lfs

sudo apt install -y net-tools dnsutils telnet

sudo apt install -y bat exa fd-find ripgrep fzf
# echo 'alias cat="batcat"' >> ~/.bashrc
# echo 'alias ls="exa"' >> ~/.bashrc
# echo 'alias find="fdfind"' >> ~/.bashrc
# echo 'alias grep="rg"' >> ~/.bashrc

sudo apt install -y neovim

sudo apt install -y htop iotop nethogs ncdu glances

git config --global user.name "Dhairya Rungta"
git config --global user.email "97079960+dhairyarungta@users.noreply.github.com"

#Install oh-my-bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"

#edit oh-my-bash theme to "agnoster"
#edit agnoster file at ~/.oh-my-bash/themes to remove prompt user@instance
#if some colors are not right, then edit specific colors using terminal settings

#C++ dev tools
sudo apt install -y gdb valgrind cmake git
sudo apt install -y pkg-config ninja-build
sudo apt install -y clang clangd clang-format clang-tidy
sudo apt install tmux 

#for clang-format mason install
sudo apt install -y python3-venv

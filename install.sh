#!/bin/bash

###########################################################################
# tested on debian9
###########################################################################

###########################################################################
#install util tools
###########################################################################
sudo apt -y install vim nmap mysql-server redis-server g++ build-essential　wget curl openssl

git config --global core.editor vim

###########################################################################
#install clang7
###########################################################################

wget -O - https://apt.llvm.org/llvm-snapshot.gpg key | sudo apt-key add -

sudo sh -c "echo deb http://apt.llvm.org/stretch/ llvm-toolchain-stretch main >> /etc/apt/sources.list"
sudo sh -c "echo deb-src http://apt.llvm.org/stretch/ llvm-toolchain-stretch main >> /etc/apt/sources.list"
# 6.0 
sudo sh -c "echo deb http://apt.llvm.org/stretch/ llvm-toolchain-stretch-6.0 main >> /etc/apt/sources.list"
sudo sh -c "echo deb-src http://apt.llvm.org/stretch/ llvm-toolchain-stretch-6.0 main >> /etc/apt/sources.list"
# 7 
sudo sh -c "echo deb http://apt.llvm.org/stretch/ llvm-toolchain-stretch-7 main >> /etc/apt/sources.list"
sudo sh -c "echo deb-src http://apt.llvm.org/stretch/ llvm-toolchain-stretch-7 main >> /etc/apt/sources.list"
# LLVM
sudo apt -y install libllvm-7-ocaml-dev libllvm7 llvm-7 llvm-7-dev llvm-7-doc llvm-7-examples llvm-7-runtime
# Clang and co
sudo apt -y install clang-7 clang-tools-7 clang-7-doc libclang-common-7-dev libclang-7-dev libclang1-7 clang-format-7 python-clang-7
# libfuzzer
sudo apt -y install libfuzzer-7-dev
# lldb
sudo apt -y install lldb-7
# lld (linker)
sudo apt -y install lld-7
# libc++
sudo apt -y install libc++-7-dev libc++abi-7-dev
# OpenMP
sudo apt -y install libomp-7-dev

###########################################################################
# install yarn command
###########################################################################
sudo apt -y install apt-transport-https
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update && sudo apt -y install yarn

###########################################################################
# install nodejs
###########################################################################
curl -sL https://deb.nodesource.com/setup_11.x | sudo -E bash -
sudo apt install -y nodejs

###########################################################################
#install go
###########################################################################
wget https://dl.google.com/go/go1.11.2.linux-amd64.tar.gz
tar -xvf go1.11.2.linux-amd64.tar.gz
sudo mv go/ /usr/local
mkdir $HOME/gopath
echo export 'GOROOT=/usr/local/go' >> ~/.bashrc
echo export 'GOPATH=$HOME/gopath' >> ~/.bashrc
echo export 'PATH=$GOROOT/bin:$GOPATH/bin:$PATH' >> ~/.bashrc
echo export 'GOROOT=/usr/local/go' >> ~/.profile
echo export 'GOPATH=$HOME/gopath' >> ~/.profile
echo export 'PATH=$GOROOT/bin:$GOPATH/bin:$PATH' >> ~/.profile
source ~/.bashrc
source ~/.profile
rm go1.11.2.linux-amd64.tar.gz

###########################################################################
#install ruby
###########################################################################
sudo apt update
sudo apt install -y git curl libssl-dev libreadline-dev zlib1g-dev autoconf bison build-essential libyaml-dev libreadline-dev libncurses5-dev libffi-dev libgdbm-dev
curl -sL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-installer | bash -
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.profile
echo 'eval "$(rbenv init -)"' >> ~/.profile
source ~/.bashrc
source ~/.profile
rbenv install 2.5.1
rbenv global 2.5.1

###########################################################################
# install python
###########################################################################
sudo apt install -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.bashrc
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.profile
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.profile
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.profile
source ~/.bashrc
source ~/.profile
pyenv install -v 3.7.1
pyenv global 3.7.1

###########################################################################
# install dependency libraries of chromium to run puppeteer
###########################################################################
sudo apt-get --yes install \
  gconf-service \
  libasound2\
  libatk1.0-0\
  libc6\
  libcairo2\
  libcups2\
  libdbus-1-3\
  libexpat1\
  libfontconfig1\
  libgcc1\
  libgconf-2-4\
  libgdk-pixbuf2.0-0\
  libglib2.0-0\
  libgtk-3-0\
  libnspr4\
  libpango-1.0-0\
  libpangocairo-1.0-0\
  libstdc++6\
  libx11-6\
  libx11-xcb1\
  libxcb1\
  libxcomposite1\
  libxcursor1\
  libxdamage1\
  libxext6\
  libxfixes3\
  libxi6\
  libxrandr2\
  libxrender1\
  libxss1\
  libxtst6\
  ca-certificates\
  fonts-liberation\
  libappindicator1\
  libnss3\
  lsb-release\
  xdg-utils\
  wget

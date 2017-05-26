#!/usr/bin/env sh

set -euo pipefail

CODE_DIR=~/Projects
REPO='https://github.com/romuloalves/houdini'
HOUDINI_DIR=~/.houdini
VIM_DIR=~/.vim
GIT_DIR=~/.git

HOMEBREW_ZSH_BIN=/usr/local/bin/zsh

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew update

brew install zsh \
  git \
  curl

brew install --HEAD \
  vim \
  ruby-install \
  nvm \
  yarn

brew cask install \
  java \
  spotify \
  google-chrome \
  heroku-toolbelt \
  docker \
  whatsapp \
  spectacle \
  flux \
  alfred \
  now \
  hyper \
  postman \
  caprine \
  skype \
  filezilla \
  kap \
  webtorrent \
  cloudup \
  moeditor \
  virtualbox \
  macvim \
  eclipse-ide

local mac_store_apps=(
'Slack',
'Sketch',
'Bear',
'Newton',
'Keynote',
'Affinity Designer',
'Microsoft Word',
'Microsoft PowerPoint',
'Microsoft Excel',
'Battery Indicator'
)

for appname in mac_store_apps; do
  mas search $appname | head -n 1 | cut -f 1 -d ' ' | xargs mas install
done

mkdir -p $CODE_DIR

git clone --recursive $REPO "$CODE_DIR"

ln -s $CODE_DIR/houdini $HOUDINI_DIR

# vim

ln -s $HOUDINI_DIR/vim $VIM_DIR
ln -s $VIM_DIR/rc.vim ~/.vimrc
ln -s $VIM_DIR/grc.vim ~/.gvimrc

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim +PlugInstall +qall

# zsh

ln -s $HOUDINI_DIR/zsh ~/.zsh
ln -s ~/.zsh/prezto ~/.zprezto
ln -s ~/.zsh/rc.zsh ~/.zshrc
ln -s ~/.zsh/env.zsh ~/.zshenv
ln -s ~/.zsh/profile.zsh ~/.zprofile
ln -s ~/.zsh/login.zsh ~/.zlogin
ln -s ~/.zsh/logout.zsh ~/.zlogout
ln -s ~/.zsh/preztorc.zsh ~/.zpreztorc

# bash

ln -s $HOUDINI_DIR/bash ~/.bash
ln -s ~/.bash/profile.bash ~/.bash_profile
ln -s ~/.bash/rc.bash ~/.bashrc

sudo echo $HOMEBREW_ZSH_BIN >> /etc/shells

chsh -s $HOMEBREW_ZSH_BIN

# gem

ln -s $HOUDINI_DIR/gemrc ~/.gemrc

# ruby

ruby-install -s /tmp/ruby-src ruby

# gems
gem install rails \
  compass

# node

nvm install v7.6.0

npm install --global npm@5

npm install --global \
  bower \
  browser-sync \
  create-micro \
  create-next-app \
  fkill-cli \
  grunt \
  gulp \
  is-online-cli \
  login-feevale-cli \
  cwi-registrar-ponto \
  react-native-cli \
  serve \
  trash-cli


$HOUDINI_DIR/macos

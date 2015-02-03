## Installation
From command line:

    git clone https://github.com/micku/vimrc.git ~/.vimfiles
    sh ~/.vimfiles/install.sh

Install Mensch font from ~/.vimfiles/fonts

## Updating
From command line:

    git pull
    git submodule update

## Adding a plugin
From command line:

    git submodule add https://repo-url bundle/repo-name
    vim .vimrc # Add "NeoBundle 'user/repo'" in bundles list
    git add .
    git commit -m "Added plugin <plugin-name>"
    git push origin master
    cp .vimrc ~/.vimrc

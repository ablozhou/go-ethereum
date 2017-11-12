#! /bin/sh
#
# install.sh
# Quantum Gold Token installer
# Copyright (C) 2017 zhh <zhh@zmac>
#
# Distributed under terms of the MIT license.
#


set -e
echo "Welcome to install QTG wallet!"
if [ ! -f "qgeth" ]; then
	echo "$0 must be run from the work directory with qgeth."
	exit 2
fi

workspace="$PWD"

# add path to bashrc
bashrc="$HOME/.bashrc"
echo "shell is $SHELL"
# zsh
if [ ${SHELL}x = "/bin/zsh"x ]; then
    bashrc="$HOME/.zshrc"
fi   

echo "The shell config file is $bashrc"
if [ ! -f "$bashrc" ]; then
	touch $bashrc
fi

if cat $bashrc | grep "QTG" >/dev/null ;then
	echo "You have istalled QTG wallet!"
	exit 3
fi

echo "export QTG=$workspace">>$bashrc
echo "export PATH=\$QTG:\$PATH">>$bashrc

echo "=============================="
echo "install QTG geth successfully!"
echo "You MUST run the command below at fist " 
echo
echo "    source $bashrc"
echo
echo "to effect the enviroment."
echo
echo "Run \"qgeth new account\" to create a wallet"
echo "Run \"qconsole\" to enter QTG Console"

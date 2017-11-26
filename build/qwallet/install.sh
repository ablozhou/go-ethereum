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
bashpr="$HOME/.bash_profile"
echo "shell is $SHELL"

# zsh
if [ ${SHELL}x = "/bin/zsh"x ]; then
    bashrc="$HOME/.zshrc"
else
	# add .bashrc to .bash_profile
	if cat $bashpr | grep ".bashrc" >/dev/null ;then
		echo ".bashrc has added to $bashpr."
	else

		echo "" >>$bashrc
		echo "if [ \"\${BASH-no}\" != \"no\" ]; then" >>$bashpr
		echo "        [ -r $bashrc ] && . $bashrc" >>$bashpr
		echo "fi" >>$bashpr
	fi
fi   

echo "The shell config file is $bashrc"
if [ ! -f "$bashrc" ]; then
	touch $bashrc
fi
if [ ! -f "$bashpr" ]; then
        touch $bashpr
fi
if cat $bashrc | grep "QTG" >/dev/null ;then
	echo "You have istalled QTG wallet!"
	exit 3
fi

echo "" >>$bashrc
echo "# QTG" >>$bashrc
echo "export QTG=$workspace">>$bashrc
echo "export PATH=\$QTG:\$PATH">>$bashrc

# confirm remove
echo "alias rm='rm -i'" >>$bashrc

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

#!/bin/sh

# This file applys configs to make the shell environment feel like using a proper login shell

rmdir /root # We want to symlink to our de-facto home directory
ln -s /vscode/ /root

apk add shadow # We need this to change the shell to bash
chsh -s /bin/bash root

ln -s /etc/profile.d/color_prompt.sh.disabled /etc/profile.d/color_prompt.sh
chmod +x /etc/profile.d/color_prompt.sh
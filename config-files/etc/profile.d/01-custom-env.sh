#!/bin/bash

export USER=root

# History stuff
shopt -s histappend

export PROMPT_COMMAND='history -a'
export HISTSIZE=2000
export HISTFILESIZE=5000
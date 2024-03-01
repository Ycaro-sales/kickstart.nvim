#!/bin/sh
# This shell script is PUBLIC DOMAIN. You may do whatever you want with it.

TOGGLE=$HOME/.toggle

if [ ! -e $TOGGLE ]; then
    touch $TOGGLE
    setxkbmap -layout us
else
    rm $TOGGLE
    setxkbmap -layout br
fi

#!/usr/bin/env bash

OPTION=server

echo 1. Run bundle middleman server
echo 2. Build bundle middleman build
echo


read -p "Enter the 1 or 2 press ENTER : " SELECTION

if [ "$SELECTION" = "2" ]; then
    OPTION=build
fi

echo
echo Starting bundle middleman with option $OPTION
echo

bundle exec middleman $OPTION

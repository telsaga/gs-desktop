#!/bin/bash

if [ !(type paru -h > /dev/null 2>&1) ] && [ !(type yay -h > /dev/null 2>&1) ]; then
  echo "Please install yay or paru"
else
  for DD in `cat ./arch.txt` ;do
    echo $DD
    pacman -Sy $DD || exit 1
  done

  if type paru -h > /dev/null 2>&1; then
    for DD in `cat ./arch_aur.txt` ;do
      echo $DD
      paru $DD || exit 1
    done
  elif type yay -h > /dev/null 2>&1; then
    for DD in `cat ./arch_aur.txt` ;do
      echo $DD
      yay -Sy $DD || exit 1
    done
  fi
fi

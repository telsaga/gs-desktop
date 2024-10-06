#!/bin/bash

paru_exist=$(type paru 2>&1)
echo $paru_exist

yay_exist=$(type yay 2>&1)
echo $yay_exist

if [[ $paru_exist == *"not found"* ]] && [[ $yay_exist == *"not found"* ]] then
  echo "Please install yay or paru"
else
  if [[ $paru_exist == *"paru is"* ]] then
    for DD in `cat ./arch_aur.txt` ;do
      echo $DD
      paru $DD || exit 1
    done
  elif [[ $yay_exist == *"yay is"* ]] then
    for DD in `cat ./arch_aur.txt` ;do
      echo $DD
      yay -S $DD || exit 1
    done
  fi
fi

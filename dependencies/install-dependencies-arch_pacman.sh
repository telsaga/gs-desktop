#!/bin/bash

pacman -Syy
for DD in `cat ./arch.txt` ;do
  echo $DD
  pacman -S $DD || exit 1
done


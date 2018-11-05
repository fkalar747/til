#!/bin/bash

rm -rf ~/.ssh
mkdir ~/.ssh
ssh-keygen -N '' -f ~/.ssh/id_rsa

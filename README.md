# chsshcf
A script to change and hardening its SSH configuration from templates
(Un script pour changer et durcir sa configuration SSH d'après des modèles.)

## SSH key generation
Generate client keys using the following commands:
* ssh-keygen -t ed25519 -o -a 100
* ssh-keygen -t rsa -b 4096 -o -a 100

## Install
Just run ./install.sh in terminal as root

It’s probably a good idea to test the changes with ssh -v

Sources :
https://stribika.github.io/2015/01/04/secure-secure-shell.html
https://wiki.mozilla.org/Security/Guidelines/OpenSSH

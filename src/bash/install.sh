#!/usr/bin/env bash

set -euf -o pipefail

USERNAME="$USERNAME"
NODE_VERSION=13

# update apt-get sources
sudo apt-get update

# install git
sudo apt-get install git -y

# prepare certbot install
sudo add-apt-repository universe
sudo add-apt-repository ppa:certbot/certbot
sudo apt-get update

sudo apt install -y certbot software-properties-common git

# setup group
addgroup "$USERNAME"

# add user. one should be fine.
adduser "$USERNAME" --group "$USERNAME" --disabled-login --quiet

# switch to grundstein user
su "$USERNAME"

# install nvm
export NVM_DIR="$HOME/.nvm" && (
  git clone https://github.com/nvm-sh/nvm.git "$NVM_DIR"
  cd "$NVM_DIR"
  git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
) && \. "$NVM_DIR/nvm.sh"

# install node 13 and use it as default

nvm install "$NODE_VERSION"
nvm use "$NODE_VERSION"

# clone the cloud env
git clone "https://github.com/grundstein/cloud.grundstein.it" "/home/$USERNAME/cloud.grundstein.it"

# back to root
exit

# create systemd startup files
cp "./src/systemd/*.service" "/lib/systemd/system"

# reload daemon to load new .service files
systemctl daemon-reload

# run services
systemctl start gps
systemctl start gms
systemctl start gas
systemctl start gul
systemctl start ghs

# enable services
systemctl enable gps
systemctl enable gms
systemctl enable gas
systemctl enable gul
systemctl enable ghs

# iptables port forwards
iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j REDIRECT --to-port 8080
iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 443 -j REDIRECT --to-port 4343

# make iptables port forwards sticky
echo "iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j REDIRECT --to-port 8080" >> /etc/rc.local
echo "iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 443 -j REDIRECT --to-port 4343" >> /etc/rc.local


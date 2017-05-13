echo -e "Personal Site Server\!\nIf you spot a vuln, please leave a note here :)\n" | sudo tee /etc/motd > /dev/null

###############
# Setup Dokku #
###############

echo "dokku dokku/web_config boolean false" | sudo debconf-set-selections
echo "dokku dokku/vhost_enable boolean true" | sudo debconf-set-selections
echo "dokku dokku/hostname string personal.dev" | sudo debconf-set-selections

# Consider changing to a different key
echo "dokku dokku/key_file string /home/admin/.ssh/default-dokku_rsa.pub" | sudo debconf-set-selections

wget https://raw.githubusercontent.com/dokku/dokku/v0.9.4/bootstrap.sh
sudo DOKKU_TAG=v0.9.4 bash bootstrap.sh


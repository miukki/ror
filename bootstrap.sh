#!/usr/bin/env bash

###
# create swap file
###
sudo dd if=/dev/zero of=/swapfile bs=1024 count=1024k
sudo mkswap /swapfile
sudo swapon /swapfile
echo '/swapfile none swap sw 0 0' | sudo tee --append /etc/fstab
sudo chown root:root /swapfile
sudo chmod 0600 /swapfile


###
# for Chinese network
###
  # rvmsudo gem sources --remove https://rubygems.org/
  # rvmsudo gem sources -a https://ruby.taobao.org/
  # sed -i 's!cache.ruby-lang.org/pub/ruby!ruby.taobao.org/mirrors/ruby!' $rvm_path/config/db


###
# bundle
###
cd /vagrant
gem install --no-ri --no-rdoc bundler
rbenv rehash
bundle install --without production


###
# script of start rails server
###
echo 'cd /vagrant' > ~/serve
echo 'rails s' >> ~/serve
chmod +x ~/serve

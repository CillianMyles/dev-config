## RVM and Ruby (2.2.2)

# Update
sudo apt-get update

# Pre-requisits 
sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev

# More pre-requisits
sudo apt-get install libgdbm-dev libncurses5-dev automake libtool bison libffi-dev

# Fetch latest stable release of RVM
curl -L https://get.rvm.io | bash -s stable

# Run the rvm script in this bash session, having access to all output/vars 
source ~/.rvm/scripts/rvm

# Install and verify
rvm install 2.2.2
rvm use 2.2.2 --default
ruby -v

# Tell Rubygems not to install docs for each package locally 
echo "gem: --no-ri --no-rdoc" > ~/.gemrc

# Install bundler
gem install bundler


## Rails (4.2.1)

# Install JavaScript runtime environment (node.js)
sudo add-apt-repository ppa:chris-lea/node.js
sudo apt-get update
sudo apt-get install nodejs

# Install and verify
gem install rails -v 4.2.1
rails -v

# Edit Terminal Profile Prefs
https://rvm.io/integration/gnome-terminal
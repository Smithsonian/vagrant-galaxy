# install prereqs
echo "installing mercurial..."
sudo apt-get -y install mercurial

# install galaxy
echo "installing galaxy..."
hg clone https://bitbucket.org/galaxy/galaxy-dist/
cd galaxy-dist

echo "updating to stable..."
hg update stable

# configure galaxy
echo "configuring galaxy..."
cp /vagrant/universe_wsgi.ini /home/vagrant/galaxy-dist/universe_wsgi.ini

# start galaxy
echo "running galaxy daemon..."
sh run.sh --daemon
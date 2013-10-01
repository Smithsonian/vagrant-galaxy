# install prereqs
echo "installing mercurial..."
sudo apt-get -y install mercurial

# install galaxy
echo "installing galaxy..."
export GALAXYPATH="/vagrant/galaxy-dist/"
hg clone https://bitbucket.org/galaxy/galaxy-dist/ $GALAXYPATH
cd $GALAXYPATH

echo "updating to stable..."
hg update stable

# configure galaxy
echo "configuring galaxy..."
cp /vagrant/universe_wsgi.ini $GALAXYPATH/universe_wsgi.ini

# start galaxy
echo "running galaxy daemon..."
sh run.sh --daemon

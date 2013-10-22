# install prereqs
echo "installing mercurial..."
sudo apt-get -y install mercurial mercurial-server

# install galaxy
echo "installing galaxy..."
export GALAXYPATH="/vagrant/galaxy-dist/"
hg clone https://bitbucket.org/galaxy/galaxy-dist/ $GALAXYPATH
cd $GALAXYPATH

echo "updating to stable..."
hg update stable

# configure galaxy
echo "configuring galaxy..."
# copy default configurations over
cp /vagrant/config/* $GALAXYPATH/

# start galaxy
echo "running galaxy daemon..."
sh run.sh --daemon

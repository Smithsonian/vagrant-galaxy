# install prereqs

echo "updating package repositories..."
sudo apt-get update

echo "installing git"
sudo apt-get -y install git-core

# install galaxy
echo "installing galaxy..."
export GALAXYPATH="/vagrant/galaxy-dist/"
git clone https://github.com/galaxyproject/galaxy $GALAXYPATH
cd $GALAXYPATH

# configure galaxy
echo "configuring galaxy..."
# copy default configurations over
cp /vagrant/config/* $GALAXYPATH/

# start galaxy
echo "running galaxy daemon..."
sh run.sh --daemon

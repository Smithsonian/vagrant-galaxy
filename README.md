vagrant-galaxy
==============

Vagrant launcher for Galaxy (http://galaxyproject.org/)

Requirements
------------
* Download and install VirtualBox (https://www.virtualbox.org/)
* Download and install Vagrant (http://www.vagrantup.com/)
* Download and install Fabric (http://fabfile.org/)

Note - the easiest way to install Fabric is through pip (or easy_install):

```
 pip install fabric
```

Installation
------------
```
 git clone https://github.com/Smithsonian/vagrant-galaxy.git
 cd vagrant-galaxy
 vagrant up
```

Point your browser at http://localhost:8080/ after starting up the galaxy server.  You can do this via fabric (see below), for convenience, or you can do it manually like so:
```
 vagrant ssh
 cd /vagrant/galaxy-dist
 ./run.sh --daemon
```

Usage
-----

### Running Galaxy via fabric
To start the galaxy server, the included fabric file provides some convenience functions.
```
 fab vagrant galaxy:start
```

Likewise, there are options for stopping, restarting, and checking the status of the galaxy server.
```
 fab vagrant galaxy:stop
 fab vagrant galaxy:restart
 fab vagrant galaxy:status
```

You can find a full list of available fabric functions by typing the following:
```
 fab list
```

### Running a local toolshed
Running a toolshed server inside the local VM is a convenient way to run deployment tests for 
your custom galaxy tools.  You can develop your tool (including wrappers, tests, datatypes, 
dependencies, etc) on the galaxy instance, then upload the package to the toolshed and test 
installing it back on the galaxy instance.

The syntax is identical to starting the galaxy server:
```
 fab vagrant toolshed:start
 fab vagrant toolshed:stop
 fab vagrant toolshed:restart
 fab vagrant toolshed:status
```

### Admin users
For both the galaxy and toolshed servers, the default admin user is vagrant@galaxy.local

Simply create a new user in each webapp with that e-mail address to access the admin menus 
(or add your own admin user to the config files).

### Modifying galaxy's configuration files with fabric
This feature is still in development, but the basic usage is as follows:
```
 fab vagrant config:OPTION,VALUE
```


Future direction
----------------
* Add other virtual providers: VMWare and AWS
* Replace the shell provisioner with ansible or fabric

#!/usr/bin/env python

from fabric.api import *
from fabtools.vagrant import vagrant
import ConfigParser

universe_wsgi = './galaxy-dist/universe_wsgi.ini'

################
# Galaxy process
@task
def start_galaxy():
    with cd('/vagrant/galaxy-dist'):
        sudo('./run.sh --daemon')
@task
def stop_galaxy():
    with cd('/vagrant/galaxy-dist'):
        sudo('./run.sh --stop-daemon')
        
@task
def restart_galaxy():
    with cd('/vagrant/galaxy-dist'):
        sudo('./run.sh --stop-daemon')
        sudo('./run.sh --daemon')

@task
def status():
    with cd('/vagrant/galaxy-dist'):
        sudo('./run.sh --status')

################
# Galaxy config management
@task
def add_admin():
    pass

@task
def conf_set(k,v):
    Config = ConfigParser.ConfigParser()
    Config.read(universe_wsgi)
    Config.set('app:main',k,v)
    Config.write(universe_wsgi)

@task 
def conf_get(k):
    Config = ConfigParser.ConfigParser()
    Config.read(universe_wsgi)
    print Config.get('app:main',k)
    
########################
# Vagrant On Galaxy test
@task
def install_vagrant():
    run('wget http://files.vagrantup.com/packages/0ac2a87388419b989c3c0d0318cc97df3b0ed27d/vagrant_1.3.4_x86_64.deb')
    sudo('sudo dpkg -i vagrant_1.3.4_x86_64.deb')

########################
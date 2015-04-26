'''
TODO: May need to fix error in
http://askubuntu.com/questions/59458/
error-message-when-i-run-sudo-unable-to-resolve-host-none
'''
from __future__ import print_function

from fabric.api import run, env, task, roles, local, lcd
from fabric.api import open_shell, put, cd, sudo
from fabric.api import settings

from fabric.contrib.files import exists
from fabric.contrib.project import rsync_project

import os
import shutil
import yaml
import sys
import platform


script_dir = os.path.dirname(__file__)

env.user = None
env.host_string = None
env.key_filename = None


def check_instance(config, instance, ip=None):
    if not instance:
        print('No instance specified')

    if instance not in config.keys():
        instances = tc.quote_items(config.keys())
        instance_str = ', '.join(instances)
        print('instance should be one of {}'.format(instance_str))
        sys.exit(1)

    if ip not in (None, 'public'):
        print('ip should be either "public" or unspecified (default private)')


def check_host_connection(task_name):
    if any([env.user is None,
           env.host_string is None,
           env.key_filename is None]):
        msg = 'Use "host" task before the "{}" task to setup the ' \
            'host connection info'
        print(msg.format(task_name))
        sys.exit(1)


def get_project_name():
    ''' gets the project root directory name assuming the current
        directory is a child of the project root directory
    '''
    root_dir = os.path.normpath(os.path.join(script_dir, '..'))
    project_name = os.path.basename(root_dir)
    return project_name


def get_ip_address(instance, key_name, ip):
    ip_address = None
    running_instances = []
    pending_instances = []
    for inst in instances:
        if inst.state == 'running':
            running_instances.append(inst)
            if ip == 'public':
                if inst.ip_address:
                    ip_address = inst.ip_address
            else:
                if inst.private_ip_address:
                    ip_address = inst.private_ip_address
            break
        elif inst.state == 'pending':
            pending_instances.append(inst)
    if not ip_address:
        if len(pending_instances) > 0:
            print('Pending instance of {} found'.format(instance))
        elif len(running_instances) == 0:
            print('No running instance of {} found'.format(instance))
        else:
            print('No ip address available')
    return ip_address


@task
def ssh():
    ''' ssh into ec2 instance '''
    check_host_connection('ssh')
    local('ssh -i "{}" {}@{}'.format(
        env.key_filename, env.user, env.host_string))


@task(name='ssh-config')
def ssh_config():
    ''' set up ssh config file '''
    user_root = os.path.expanduser('~')
    print(user_root)
    ssh_root = os.path.join(user_root, '.ssh')
    ssh_config = os.path.join(ssh_root, 'config')
    if not os.path.exists(ssh_root):
        os.makedirs(ssh_root)
    if not os.path.exists(ssh_config):
        shutil.copy(os.path.join(script_dir, 'config'), ssh_root)
        local('chmod 600 {0}'.format(os.path.join(ssh_root, 'config')))
    key_file = '~/.ssh/insecure_private_key'
    key_url = 'https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant'
    local('wget -O {0} {1} && chmod 600 {0}'.format(
        key_file, key_url))


@task
def host(instance=None, ip=None):
    ''' set ec2 host '''
    ip_address = get_ip_address(instance, key_name, ip)
    pem_path = get_ssh_key(key_name)
# if only linux need to copy the private key to ~/.ssh/ (after creating dir)
# change permissions to chmod 400 and then use key
    print(platform.system())
    user = 'ubuntu'
    if ip_address:
        # print('Setting host: {}@{}'.format(user, ip_address))
        # print('Setting key_file: {}'.format(pem_path))
        env.user = user
        env.hosts = [ip_address]
        env.key_filename = pem_path

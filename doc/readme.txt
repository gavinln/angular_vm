Start the server
1. In the root directory start the VM
vagrant up

2. Connect to the VM
vagrant ssh

3. Change to the project javascript directory
cd /vagrant/js

4. Install project dependencies for node.js
sudo npm install --no-bin-links

5. Install javascript libraries using bower
(May need to run git config --global url."https://".insteadOf git://)
bower install

7. Start server
grunt serve

8. Open the browser to the location below
http://localhost:9000/

Check for errors
1. Change to the project javascript directory
cd /vagrant/js

2.  Check javascript code
grunt jshint

Run Javascript unit tests
1. Set Display number
export DISPLAY=:0

2. Run tests
grunt test

Check the following
http://www.youtube.com/watch?v=AKwqfHm-3ZQ

# Runs tests automatically when saving files
./node_modules/karma/bin/karma start

Connect one or more browsers to http://localhost:8080/

To login to the VM using a username/password use the following
vagrant/vagrant

# Run jshint without grunt
./node_modules/grunt-contrib-jshint/node_modules/jshint/bin/jshint app/scripts test/

Vagrant provision

c:\ws\angular_vm>vagrant provision (1 time)
==> default: Running provisioner: puppet...
Running Puppet with vagrant.pp...
stdin: is not a tty
notice: /Stage[main]/Init/Exec[update_apt]/returns: executed successfully
notice: /Stage[main]/Googlechrome::Repo::Debian/Apt::Source[google-chrome]/File[google-chrome.list]/content: content changed '{md5}ef2f911e6b9fa4988bb49f343956208e' to '{md5}46f19f5346e1d757689b785ea02022e4'
notice: /Stage[main]/Apt::Update/Exec[apt_update]: Triggered 'refresh' from 1 events
notice: /Stage[main]/Xvfb/Service[xvfb]/ensure: ensure changed 'stopped' to 'running'
notice: Finished catalog run in 17.36 seconds

c:\ws\angular_vm>vagrant provision (2 and subsequent times)
==> default: Running provisioner: puppet...
Running Puppet with vagrant.pp...
stdin: is not a tty
notice: /Stage[main]/Init/Exec[update_apt]/returns: executed successfully
notice: /Stage[main]/Xvfb/Service[xvfb]/ensure: ensure changed 'stopped' to 'running'
notice: Finished catalog run in 10.94 seconds


To install node_modules in the $HOME directory
mkdir -p ~/npm
npm config set prefix ~/npm
export PATH="$PATH:$HOME/npm/bin"

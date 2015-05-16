To create a new gulp angular project using yeoman

1. Change to the shared directory
cd /srv/share

2. Create directory for the project
mkdir ga_proj

3. Change to the project directory
cd ga_proj

4. yo gulp-angular

5. Update npm version
sudo /usr/local/node/node-default/bin/npm install -g npm@2.9.1

6. Install npm modules
npm install

7. Install bower modules
bower install

8. To see a list of gulp tasks
gulp --tasks

9. Start nodejs server
gulp serve

10. Go to http://192.168.33.10:3000/ to view the app

11. To run jshint
gulp scripts

12. To run unit tests
gulp test

13. To run e2e tests
gulp protractor


Add vagrant to the docker group
sudo usermod -aG docker vagrant

set DOCKER_HOST=192.168.33.10:2375
docker ps

If there is an error with npm install run
rm -rf ~/.npm

Get version of node
node -v

Get version of npm
npm -v


For karma and protractor to work
sudo apt-get install openjdk-7-jre

gulp test
gulp protractor

vagrant package --output angular_vm_clone.box vm
move angular_vm_clone.box ..

vagrant box list
vagrant box add --name angular_vm_clone ../angular_vm_clone.box

vagrant plugin install vagrant-vbguest

sudo su
PATH=/usr/local/node/node-d efault/bin:$PATH
npm install -g protractor

export DISPLAY=:0
sudo service xvfb start
sudo service x11vnc start

The file /etc/profile.d/vagrant_display.sh
automatically sets export DISPLAY=:0

Gulp options
gulp serve
gulp scripts

The following commands do not run any unit tests as they
files are specified by gulp
karma start
karma run

The following commands can also be used to run e2e tests
gulp serve
protractor



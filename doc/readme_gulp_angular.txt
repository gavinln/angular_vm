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

8. Start nodejs server
gulp serve

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

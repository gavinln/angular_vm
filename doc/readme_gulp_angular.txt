To create a new gulp angular project using yeoman

1. Change to the shared directory
cd /srv/share

2. Create directory for the project
mkdir ga_proj

3. Change to the project directory
cd ga_proj

4. yo gulp-angular

Add vagrant to the docker group
sudo usermod -aG docker vagrant

Access Docker on Windows
set DOCKER_HOST=192.168.33.10:2375
docker ps

Get version of node
node -v

Get version of npm
npm -v

For karma and protractor to work
sudo apt-get install openjdk-7-jre

vagrant package --output angular_vm_clone.box vm
move angular_vm_clone.box ..

vagrant box list
vagrant box add --name angular_vm_clone ../angular_vm_clone.box

vagrant plugin install vagrant-vbguest

export DISPLAY=:0
sudo service xvfb start
sudo service x11vnc start

The file /etc/profile.d/vagrant_display.sh
automatically sets export DISPLAY=:0

The following commands do not run any unit tests as they
files are specified by gulp
karma start
karma run

The following commands can also be used to run e2e tests
gulp serve
protractor



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

Xlib:  extension "RANDR" missing on display ":0"

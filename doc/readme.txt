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

To run express.js example
1. Change to the express example directory
cd /vagrant/express/nodetest1

2. Install project dependencies for node.js
sudo npm install --no-bin-links

3. Start express.js server
node app.js




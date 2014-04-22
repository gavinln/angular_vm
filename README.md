angular_vm
==========

* Source code - [Github][1]
* Author - Gavin Noronha - <gavinln@hotmail.com>

[1]: https://github.com/gavinln/angular_vm.git

About
-----

This project provides a [Ubuntu (12.04)][2] [Vagrant][3] Virtual Machine (VM) with [AngularJS][4] for web applications in [Javascript][5]. It also includes the following useful libraries.

[2]: http://releases.ubuntu.com/precise/
[3]: http://www.vagrantup.com/
[4]: http://angularjs.org/
[5]: https://developer.mozilla.org/en-US/docs/Web/JavaScript

* [node.js][6]
* [bower][7]
* [grunt][8]


There are [Puppet][9] scripts that automatically install the software when the VM is started.

[6]: http://nodejs.org/
[7]: http://bower.io/
[8]: http://gruntjs.com/
[9]: http://puppetlabs.com/

Running
-------

1. To start the virtual machine(VM) type

    ```
    vagrant up
    ```

2. Connect to the VM

    ```
    vagrant ssh
    ```

3. Go to the project root directory

    ```bash
    cd /vagrant/js
    ```

4. Install project dependencies for node.js

    ```bash
    sudo npm install --no-bin-links
    ```

5. Install javascript libraries using bower


    ```bash
    bower install
    ```

    or if your git ports(9418) are blocked run the following before bower

    ```
    git config --global url."https://".insteadOf git://
    ```

6. Start the Javascript server

    ```bash
    grunt serve
    ```

7. Open the browser to the home page
http://localhost:9000/

8. To stop the server type `Ctrl+C`

9. To check the Javascript code using [jshint][10]. A formatting error has been added.

    ```bash
    grunt jshint
    ```

10. Setup the [Xvfb][11] virtual display to run the [Chrome][12] browser.

    ```bash
    export DISPLAY=:0
    ```

11. Run unit tests using the [Karma][13] test runner with the [Jasmine][14] framework.

    ```bash
    grunt test
    ```

12. Type `exit` to quit the virtual machine

13. To destroy the VM

    ```
    vagrant destroy -f
    ```

[10]: http://www.jshint.com/
[11]: http://en.wikipedia.org/wiki/Xvfb
[12]: https://www.google.com/intl/en/chrome/browser/
[13]: http://karma-runner.github.io/
[14]: http://jasmine.github.io/2.0/introduction.html

Frequently asked questions
--------------------------

####How do I install all the node modules if `npm install` is interrupted?

To re-install all the node modules delete the `vagrant/js/node_modules`
directory and run step 4 again.


Requirements
------------

The following software is needed to get the software from github and run
Vagrant. The Git environment also provides an [SSH  client][15] for Windows.

* [Oracle VM VirtualBox][16]
* [Vagrant][17]
* [Git][18]

[15]: http://en.wikipedia.org/wiki/Secure_Shell
[16]: https://www.virtualbox.org/
[17]: http://vagrantup.com/
[18]: http://git-scm.com/


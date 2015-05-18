angular_vm
==========

* Source code - [Github][1]
* Author - Gavin Noronha - <gavinln@hotmail.com>

[1]: https://github.com/gavinln/angular_vm.git

About
-----

This project provides a [Ubuntu (14.04)][2] [Vagrant][3] Virtual Machine (VM) with [AngularJS][4] for web applications in [Javascript][5]. It also includes the following useful libraries.

[2]: http://releases.ubuntu.com/14.04/
[3]: http://www.vagrantup.com/
[4]: http://angularjs.org/
[5]: https://developer.mozilla.org/en-US/docs/Web/JavaScript

* [node.js][6]
* [bower][7]
* [gulp][8]


There are [Puppet][9] scripts that automatically install the software when the VM is started.

[6]: http://nodejs.org/
[7]: http://bower.io/
[8]: http://gulpjs.com/
[9]: http://puppetlabs.com/

Running
-------

## Setup the virtual machine

1. Clone the project

    ```
    git clone http://github.com/gavinln/angular_vm.git

    ```

2. Change to the project directory

    ```
    cd angular_vm
    ```

## Work in the virtual machine (VM)

1. To start the virtual machine(VM) type

    ```
    vagrant up vm
    ```

2. Connect to the VM

    ```
    vagrant ssh vm
    ```

3. Go to the javascript project root directory

    ```bash
    cd /srv/share
    ```

4. Clone the javascript project

    ```
    git clone https://github.com/gavinln/angular_sass_gulp.git
    ```

5. Change to the project directory

    ```
    cd angular_sass_gulp
    ```

5. To modify the code from the shared folder

    '''
    chmod -R go+w .
    '''

5. To make git ignore chmod changes

    '''
    git config core.fileMode false
    '''

6. Install project dependencies for node.js

    ```bash
    npm install
    ```

7. Install javascript libraries using bower

    ```bash
    bower install
    ```

    or if your git ports(9418) are blocked run the following before bower

    ```
    git config --global url."https://".insteadOf git://
    ```

8. Display the list of gulp tasks

    ```
    gulp --tasks
    ```

9. Start the Javascript server

    ```bash
    gulp serve
    ```

10. Open the browser to the home page
http://192.168.33.10:3000/

11. To stop the server type `Ctrl+C`

12. To check the Javascript code using [jshint][10].

    ```bash
    gulp scripts
    ```

13. Run unit tests using the [Karma][11] test runner with the [Jasmine][12] framework.

    ```
    gulp test

    ```

14. Setup the [Xvfb][13] virtual display to run the [Chrome][14] browser.

    ```bash
    export DISPLAY=:0
    ```

15. Run the Chrome browser (press Ctrl+c to stop)

    ```
    google-chrome
    ```

16. View the Xvfb display by opening vnc to 192.168.33.10:5900

17. Run the end-to-end tests using [Protractor][15]

    ```bash
    gulp protractor
    ```

## Exit the virtual machine

1. Type `exit` to quit the virtual machine

2. To halt the VM type (fast to startup after a halt command)

    ```
    vagrant halt vm
    ```

3. To destroy the VM (slow to create VM after a destroy command)

    ```
    vagrant destroy vm
    ```

[10]: http://www.jshint.com/
[11]: http://en.wikipedia.org/wiki/Xvfb
[12]: https://www.google.com/intl/en/chrome/browser/
[13]: http://karma-runner.github.io/
[14]: http://jasmine.github.io/2.0/introduction.html
[15]: https://angular.github.io/protractor/#/

Frequently asked questions
--------------------------

####How do I install all the node modules if `npm install` is interrupted?

To re-install all the node modules delete the `/vagrant/js/node_modules`
directory and run step 4 again.

    ```bash
    rm -rf /vagrant/js/node_modules
    ```

####How do I install npm modules if I get the error `EEXIST`

Clean the npm cache and run `npm install` again.

    ```bash
    rm -rf ~/.npm
    npm cache clean
    ```

Requirements
------------

The following software is needed to get the software from github and run
Vagrant. The Git environment also provides an [SSH  client][16] for Windows.

* [Oracle VM VirtualBox][17]
* [Vagrant][18]
* [Git][19]

[16]: http://en.wikipedia.org/wiki/Secure_Shell
[17]: https://www.virtualbox.org/
[18]: http://vagrantup.com/
[19]: http://git-scm.com/


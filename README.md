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

9. Type `exit` to quit the virtual machine

10. To destroy the VM

    ```
    vagrant destroy -f
    ```


Requirements
------------

The following software is needed to get the software from github and run
Vagrant. The Git environment also provides an [SSH  client][10] for Windows.

* [Oracle VM VirtualBox][11]
* [Vagrant][12]
* [Git][13]

[10]: http://en.wikipedia.org/wiki/Secure_Shell
[11]: https://www.virtualbox.org/
[12]: http://vagrantup.com/
[13]: http://git-scm.com/


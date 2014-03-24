ng_django
=========

* Source code - [Github][1]
* Author - Gavin Noronha - <gavinln@hotmail.com>

[1]: https://github.com/gavinln/stats_py_vm.git

About
-----

This project provides a [Ubuntu (12.04)][2] [Vagrant][3] Virtual Machine (VM) with [AngularJS][4] and the [Django][5] library for web applications in [Javascript][6] and [Python][7]. It also includes the following useful libraries.

[2]: http://releases.ubuntu.com/precise/
[3]: http://www.vagrantup.com/
[4]: http://angularjs.org/
[5]: https://www.djangoproject.com/
[6]: https://developer.mozilla.org/en-US/docs/Web/JavaScript
[7]: http://www.python.org/

* [zsh][8]
* [nodejs][9]
* [bower][10]
* [grunt][11]


There are [Puppet][13] scripts that automatically install the software when the VM is started.

[8]: http://www.zsh.org/
[9]: http://nodejs.org/
[10]: http://bower.io/
[11]: http://gruntjs.com/
[12]: http://puppetlabs.com/

Running
-------

1. To start the virtual machine(VM) type

    ```
    vagrant up
    ```

2. Connect to the VM

    ```bat
    REM on windows
    REM make sure that ssh.exe provided by Git is in your PATH (try where ssh)
    vagrant ssh
    ```

    ```bash
    # on unix
    vagrant ssh
    ```

3. Go to the project root directory

    ```bash
    cd /vagrant
    ```

4. Install project dependencies for node.js

    ```bash
    sudo npm install --no-bin-links
    ```

5. Install javascript libraries using bower


    ```bash
    bower install
    ```

6. Start the Javascript and Python servers

    ```bash
    /vagrant/scripts/tmuxgo.sh
    ```

7. Open the browser to the home page
http://localhost:9000/


Requirements
------------

The following software is needed to get the software from github and run
Vagrant. The Git environment also provides an [SSH  client][13] for Windows.

* [Oracle VM VirtualBox][14]
* [Vagrant][15]
* [Git][16]

[13]: http://en.wikipedia.org/wiki/Secure_Shell
[14]: https://www.virtualbox.org/
[15]: http://vagrantup.com/
[16]: http://git-scm.com/

Credits
-------

Thanks to (in no particular order):

* Glen Noronha


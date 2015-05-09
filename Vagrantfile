# -*- mode: ruby -*-
# vi: set ft=ruby :

$script = <<SCRIPT

    # Exit on any errors.
    set -e

    # install puppet modules
    (puppet module list | grep puppetlabs-apt) ||
        puppet module install -v 1.5.2 puppetlabs-apt

    (puppet module list | grep maestrodev-wget) ||
        puppet module install -v 1.5.6 maestrodev-wget

    (puppet module list | grep puppetlabs-stdlib) ||
        puppet module install -v 4.3.2 puppetlabs-stdlib

    (puppet module list | grep willdurand-nodejs) ||
        puppet module install -v 1.8.3 willdurand-nodejs

    (puppet module list | grep thias-samba) ||
        puppet module install -v 0.1.5 thias-samba

    (puppet module list | grep acme-ohmyzsh) ||
        puppet module install -v 0.1.2 acme-ohmyzsh

    (puppet module list | grep garethr-docker) ||
        puppet module install -v 2.0.0 garethr-docker

    (puppet module list | grep p0deje-display) ||
        puppet module install -v 0.3.1 p0deje-display

    (puppet module list | grep jamesnetherton-google_chrome) ||
        puppet module install -v 0.1.0 jamesnetherton-google_chrome
    
SCRIPT


# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  if Vagrant.has_plugin?("vagrant-cachier")
     # Configure cached packages to be shared between instances of the same base box.
     # More info on http://fgrehm.viewdocs.io/vagrant-cachier/usage
     config.cache.scope = :box
  end

  if Vagrant.has_plugin?("vagrant-vbguest")
    # set auto_update to false, if you do NOT want to check the correct 
    # additions version when booting this machine
    config.vbguest.auto_update = false
  end

  # user insecure key
  config.ssh.insert_key = false

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  config.vm.box_check_update = false

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  # config.vm.box_url = "https://vagrantcloud.com/ubuntu/trusty64/version/1/provider/virtualbox.box"

  # Boot with a GUI so you can see the screen. (Default is headless)
  # config.vm.boot_mode = :gui

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  config.vm.network :forwarded_port, guest: 8080, host: 8080  # test karma server
  config.vm.network :forwarded_port, guest: 9000, host: 9000  # grunt node.js
  config.vm.network :forwarded_port, guest: 35729, host: 35729   # livereload
  config.vm.network :forwarded_port, guest: 28017, host: 28017  # mongodb

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network :private_network, ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network :public_network

  # If true, then any SSH connections made will enable agent forwarding.
  # Default value: false
  # config.ssh.forward_agent = true

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider :virtualbox do |vb|
    # Don't boot with headless mode
    # vb.gui = true

    # Use VBoxManage to customize the VM. For example to change memory:
    vb.customize ["modifyvm", :id, "--memory", "2048"]
    vb.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/vagrant", "1"]
  end
  #
  # View the documentation for the provider you're using for more
  # information on available options.

  config.vm.provision "shell", inline: $script

  # Enable provisioning with Puppet stand alone.  Puppet manifests
  # are contained in a directory path relative to this Vagrantfile.
  # You will need to create the manifests directory and a manifest in
  # the file base.pp in the manifests_path directory.
  #
  # An example Puppet manifest to provision the message of the day:
  #
  # # group { "puppet":
  # #   ensure => "present",
  # # }
  # #
  # # File { owner => 0, group => 0, mode => 0644 }
  # #
  # # file { '/etc/motd':
  # #   content => "Welcome to your Vagrant-built virtual machine!
  # #               Managed by Puppet.\n"
  # # }

  config.vm.define :vm, autostart: false do |machine|
    # Every Vagrant virtual environment requires a box to build off of.
    machine.vm.box = "ubuntu/trusty64"

    machine.vm.provision "puppet" do |puppet|
      puppet.manifest_file  = "vagrant.pp"
      puppet.manifests_path = "puppet/manifests"
      puppet.module_path = "puppet/modules"
      #puppet.options = "--verbose --debug"
      puppet.options = "--certname=%s" % :vm
    end
  end

  config.vm.define :clone, autostart: false do |machine|
    # Every Vagrant virtual environment requires a box to build off of.
    machine.vm.box = "angular_vm_clone"

    machine.vm.provision "puppet" do |puppet|
      puppet.manifest_file  = "vagrant.pp"
      puppet.manifests_path = "puppet/manifests"
      puppet.module_path = "puppet/modules"
      #puppet.options = "--verbose --debug"
      puppet.options = "--certname=%s" % :vm
    end
  end

  # Enable provisioning with chef solo, specifying a cookbooks path, roles
  # path, and data_bags path (all relative to this Vagrantfile), and adding
  # some recipes and/or roles.
  #
  # config.vm.provision :chef_solo do |chef|
  #   chef.cookbooks_path = "../my-recipes/cookbooks"
  #   chef.roles_path = "../my-recipes/roles"
  #   chef.data_bags_path = "../my-recipes/data_bags"
  #   chef.add_recipe "mysql"
  #   chef.add_role "web"
  #
  #   # You may also specify custom JSON attributes:
  #   chef.json = { :mysql_password => "foo" }
  # end

  # Enable provisioning with chef server, specifying the chef server URL,
  # and the path to the validation key (relative to this Vagrantfile).
  #
  # The Opscode Platform uses HTTPS. Substitute your organization for
  # ORGNAME in the URL and validation key.
  #
  # If you have your own Chef Server, use the appropriate URL, which may be
  # HTTP instead of HTTPS depending on your configuration. Also change the
  # validation key to validation.pem.
  #
  # config.vm.provision :chef_client do |chef|
  #   chef.chef_server_url = "https://api.opscode.com/organizations/ORGNAME"
  #   chef.validation_key_path = "ORGNAME-validator.pem"
  # end
  #
  # If you're using the Opscode platform, your validator client is
  # ORGNAME-validator, replacing ORGNAME with your organization name.
  #
  # If you have your own Chef Server, the default validation client name is
  # chef-validator, unless you changed the configuration.
  #
  #   chef.validation_client_name = "ORGNAME-validator"
end

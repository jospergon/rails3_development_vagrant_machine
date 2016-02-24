# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = '2'

Vagrant.require_version '>= 1.5.0'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  config.vm.define "mysqlredis" do |mysqlredis|

    mysqlredis.vm.hostname = 'mysqlredis'

    # Set the version of chef to install using the vagrant-omnibus plugin
    # NOTE: You will need to install the vagrant-omnibus plugin:
    #
    #   $ vagrant plugin install vagrant-omnibus
    #
    if Vagrant.has_plugin?("vagrant-omnibus")
      mysqlredis.omnibus.chef_version = 'latest'
    end

    # Every Vagrant virtual environment requires a box to build off of.
    # If this value is a shorthand to a box in Vagrant Cloud then
    # config.vm.box_url doesn't need to be specified.
    mysqlredis.vm.box = 'chef/ubuntu-14.04'


    # Assign this VM to a host-only network IP, allowing you to access it
    # via the IP. Host-only networks can talk to the host machine as well as
    # any other machines on the same network, but cannot be accessed (through this
    # network interface) by any external networks.
    mysqlredis.vm.network :private_network, type: 'dhcp'

    # Create a forwarded port mapping which allows access to a specific port
    # within the machine from a port on the host machine. In the example below,
    # accessing "localhost:8080" will access port 80 on the guest machine.
    mysqlredis.vm.network :forwarded_port, host: 3306, guest: 3306
    mysqlredis.vm.network :forwarded_port, host: 6379 , guest: 6379

    # Share an additional folder to the guest VM. The first argument is
    # the path on the host to the actual folder. The second argument is
    # the path on the guest to mount the folder. And the optional third
    # argument is a set of non-required options.
    mysqlredis.vm.synced_folder "../", "/vagrant_data"

    # Provider-specific configuration so you can fine-tune various
    # backing providers for Vagrant. These expose provider-specific options.
    # Example for VirtualBox:
    #
    mysqlredis.vm.provider :virtualbox do |vb|
    #   # Don't boot with headless mode
    #   vb.gui = true
    #
    #   # Use VBoxManage to customize the VM. For example to change memory:
      # vb.customize ["modifyvm", :id, "--memory", "2098"]
    end
    #
    # View the documentation for the provider you're using for more
    # information on available options.

    # The path to the Berksfile to use with Vagrant Berkshelf
    mysqlredis.berkshelf.berksfile_path = "./Berksfile"

    # Enabling the Berkshelf plugin. To enable this globally, add this configuration
    # option to your ~/.vagrant.d/Vagrantfile file
    mysqlredis.berkshelf.enabled = true

    # An array of symbols representing groups of cookbook described in the Vagrantfile
    # to exclusively install and copy to Vagrant's shelf.
    # config.berkshelf.only = []

    # An array of symbols representing groups of cookbook described in the Vagrantfile
    # to skip installing and copying to Vagrant's shelf.
    # config.berkshelf.except = []

    mysqlredis.vm.provision :chef_solo do |chef|
      chef.cookbooks_path = "cookbooks"
      chef.roles_path = "roles"
      chef.add_role("mysql-redis")
    end
  end

  config.vm.define "postgresqlredis" do |postgresql|

    postgresql.vm.hostname = 'postgresql'

    # Set the version of chef to install using the vagrant-omnibus plugin
    # NOTE: You will need to install the vagrant-omnibus plugin:
    #
    #   $ vagrant plugin install vagrant-omnibus
    #
    if Vagrant.has_plugin?("vagrant-omnibus")
      postgresql.omnibus.chef_version = 'latest'
    end

    # Every Vagrant virtual environment requires a box to build off of.
    # If this value is a shorthand to a box in Vagrant Cloud then
    # config.vm.box_url doesn't need to be specified.
    postgresql.vm.box = 'chef/ubuntu-14.04'


    # Assign this VM to a host-only network IP, allowing you to access it
    # via the IP. Host-only networks can talk to the host machine as well as
    # any other machines on the same network, but cannot be accessed (through this
    # network interface) by any external networks.
    postgresql.vm.network :private_network, type: 'dhcp'

    # Create a forwarded port mapping which allows access to a specific port
    # within the machine from a port on the host machine. In the example below,
    # accessing "localhost:8080" will access port 80 on the guest machine.
    postgresql.vm.network :forwarded_port, host: 1234, guest: 80
    postgresql.vm.network :forwarded_port, host: 5432, guest: 5432
    postgresql.vm.network :forwarded_port, host: 6379 , guest: 6379

    # Share an additional folder to the guest VM. The first argument is
    # the path on the host to the actual folder. The second argument is
    # the path on the guest to mount the folder. And the optional third
    # argument is a set of non-required options.
    postgresql.vm.synced_folder "../", "/vagrant_data"

    # Provider-specific configuration so you can fine-tune various
    # backing providers for Vagrant. These expose provider-specific options.
    # Example for VirtualBox:
    #
    postgresql.vm.provider :virtualbox do |vb|
    #   # Don't boot with headless mode
    #   vb.gui = true
    #
    #   # Use VBoxManage to customize the VM. For example to change memory:
      vb.customize ["modifyvm", :id, "--memory", "2098"]
    end
    #
    # View the documentation for the provider you're using for more
    # information on available options.

    # The path to the Berksfile to use with Vagrant Berkshelf
    postgresql.berkshelf.berksfile_path = "./Berksfile"

    # Enabling the Berkshelf plugin. To enable this globally, add this configuration
    # option to your ~/.vagrant.d/Vagrantfile file
    postgresql.berkshelf.enabled = true

    # An array of symbols representing groups of cookbook described in the Vagrantfile
    # to exclusively install and copy to Vagrant's shelf.
    # config.berkshelf.only = []

    # An array of symbols representing groups of cookbook described in the Vagrantfile
    # to skip installing and copying to Vagrant's shelf.
    # config.berkshelf.except = []

    postgresql.vm.provision :chef_solo do |chef|
      chef.cookbooks_path = "cookbooks"
      chef.roles_path = "roles"
      chef.add_role("posgresql-redis")
    end
  end
end

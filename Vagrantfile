# -*- mode: ruby -*-
# vi: set ft=ruby :
#
# Author      : Metiu07
# Date        : 22.6.2017
# Inspired by : OTA(pwnvm)

Vagrant.configure("2") do |config|

  # Bare install of 64bit arch
  config.vm.box = "wholebits/archlinux"

  # Setup repositories and base install
  config.vm.provision :shell, :path => "vm_setup.sh"

  # Port Forwarding
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Private Networking
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Public Networking
  # config.vm.network "public_network"

  # Private Networking
  # config.vm.network "private_network", type: "dhcp", virtualbox__intnet: "vboxnet0"
  config.vm.network "private_network", ip: "192.168.56.99", virtualbox__intnet: "vboxnet0"

  # Shared Folders
  # config.vm.synced_folder "../data", "/vagrant_data"
  config.vm.synced_folder "~/dev/ctf", "/home/vagrant/dev/ctf"
  config.vm.synced_folder "~/dev/ctf-page", "/home/vagrant/dev/writeups"

  # Virtual Box Config
  config.vm.provider "virtualbox" do |vb|
    # VM Ram
    vb.memory = "1024"
    # Enable GUI for troubleshooting
    # vb.gui = true
  end

end

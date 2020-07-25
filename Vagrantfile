# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "archlinux/archlinux"
  config.disksize.size = '50GB'
  config.ssh.insert_key = true

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network "private_network", ip: "192.168.56.25"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  #config.vm.network "public_network"

  # Copy SSH keys and configuration
  config.vm.provision "file", source: "ssh/config", destination: "~/.ssh/config"
  config.vm.provision "file", source: "ssh/id_github.pub", destination: "~/.ssh/id_github.pub"
  config.vm.provision "file", source: "ssh/id_github", destination: "~/.ssh/id_github"
  config.vm.provision "shell", inline: "chmod 600 ~/.ssh/id_github"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  config.vm.provider "virtualbox" do |vb|
    #vb.name = "vagrant-arch"
    # Customize the amount of memory on the VM:
    vb.memory = "8192"
    vb.cpus = 6
    vb.customize ["modifyvm", :id, "--pae", "on"]
    vb.customize ["modifyvm", :id, "--vram", "128"]
    vb.customize ["modifyvm", :id, "--graphicscontroller", "vmsvga"]
    vb.customize ["modifyvm", :id, "--accelerate3d", "on"]
  end

  # Enable provisioning with Ansible - install base requirements
  # config.vm.provision "ansible_local" do |ansible|
  #   ansible.playbook = "provisioning/base/playbook.yml"
  # end

  # config.vm.provision :reload

  # Enable provisioning with Ansible - configure Kubernetes
  config.vm.provision "ansible_local" do |ansible|
    ansible.playbook = "ansible/playbook.yml"
  end

  config.vm.provision :reload

end

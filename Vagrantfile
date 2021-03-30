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
  config.vm.provision "file", source: "ssh/config", destination: "/home/vagrant/.ssh/config"

  # To also include, for example, git access - you can copy the files like so:
  # config.vm.provision "file", source: "ssh/id_github.pub", destination: "/home/vagrant/.ssh/id_github.pub"
  # config.vm.provision "file", source: "ssh/id_github", destination: "/home/vagrant/.ssh/id_github"
  # config.vm.provision "shell", inline: "chmod 600 /home/vagrant/.ssh/id_github"

  # Fix Arch Keyring issues
  config.vm.provision "shell", inline: "sudo rm -R /etc/pacman.d/gnupg && sudo rm -R /root/.gnupg/"
  config.vm.provision "shell", inline: "sudo pacman-key --init && sudo pacman-key --populate archlinux"
  config.vm.provision "shell", inline: "sudo pacman -Syy archlinux-keyring --noconfirm"
  
  # Python required to install Ansible via pip, done by vagrant
  config.vm.provision "shell", inline: "pacman -Syyu --noconfirm"
  config.vm.provision "shell", inline: "pacman -S python python-pip --noconfirm"

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
    vb.customize ["modifyvm", :id, "--accelerate3d", "off"]
  end

  # Enable provisioning with Ansible - install base requirements
  # config.vm.provision "ansible_local" do |ansible|
  #   ansible.playbook = "provisioning/base/playbook.yml"
  # end

  # config.vm.provision :reload

  # Enable provisioning with Ansible - configure base system
  config.vm.provision "ansible_local" do |ansible|
    ansible.playbook = "ansible/playbook-vagrant-arch.yml"
  end

  config.vm.provision :reload

  # Post configuration tasks
  #config.vm.provision "ansible_local" do |ansible|
  #  ansible.playbook = "ansible/playbook-postconfig.yml"
  #end

end

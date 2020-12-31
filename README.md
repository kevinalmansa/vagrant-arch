# vagrant-arch

Create fully functional &amp; configured VM based on Arch for development.

## Requirements

To successfully run this, you must have installed on your host:
- Virtualbox: https://www.virtualbox.org/wiki/Downloads
- Vagrant: https://www.vagrantup.com/docs/installation
- Vagrant Disk Size Plugin
- Vagrant Reload

Ansible will run 'locally; in the VM and thus is not needed on the host.

### Vagrant Disk Size Plugin

To install Vagrant Disk Size Plugin, run:

```sh
$ vagrant plugin install vagrant-disksize
```

### Vagrant Reload Plugin

To install Vagrant Reload Plugin, run:

```sh
$ vagrant plugin install vagrant-reload
```

## Installation

Grab the latest ansible code:

```sh
$ git submodule update --remote
```

Clone the repo and run the following command from within the repo:

```sh
$ vagrant up
```

That's it. Once it's finished provisioning you can SSH into the machine:

```sh
$ vagrant ssh
```

or, start Virtualbox, select the VM, and click "Show" to view the GUI.

## Ansible Submodule

The Ansible code is submoduled to my central ansible repo.
To update it, simply execute the following command:

```sh
$ git submodule update --remote
```

The submodule itself is always tracking the main branch HEAD.
This was done with the following command:

```sh
$ git submodule add -b main https://github.com/kevinalmansa/ansible-provisioning.git ansible
```

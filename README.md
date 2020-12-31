# vagrant-arch

Create fully functional &amp; configured VM based on Arch for development.


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

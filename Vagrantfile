# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"

  config.vm.network :private_network, ip: "10.10.0.10"
  config.ssh.forward_agent = true

  config.vm.provider "virtualbox" do |v|
    v.name = "docker.dev"
    v.memory = "1024"
    v.customize ["modifyvm", :id, "--cpus", "2"]
    v.customize ["modifyvm", :id, "--ioapic", "on"]
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
  end

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "ansible/docker-vagrant.yml"
    ansible.verbose = "vv"
  end
end

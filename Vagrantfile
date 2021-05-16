# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
	config.vm.box = "generic/centos8"
	config.ssh.insert_key = false
    config.vm.hostname = "centos.host.home"
    config.vm.network "private_network", ip: "192.168.7.23"
	config.vm.network "forwarded_port", guest: 8080, host: 8080, auto_correct: true
    config.vm.synced_folder "web", "/web"
    config.vm.provision "shell", path: "provision.sh"
end

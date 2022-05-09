# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "hashicorp/bionic64"
  config.vm.hostname = "tomcat8"
  
  config.vm.provision "shell", path: "provision-tomcat.sh"
    
  config.vm.provider "virtualbox" do |vb|
	vb.name = "TomcatDevServer"
    vb.memory = "1024"
	vb.cpus = 1
#	vb.gui = false
  end
end

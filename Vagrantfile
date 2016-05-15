# -*- mode: ruby -*-
# # vi: set ft=ruby :

Vagrant.require_version ">= 1.6.0"

require 'fileutils'
require File.join(File.dirname(__FILE__), "config.rb")

CLOUD_CONFIG_PATH = File.join(File.dirname(__FILE__), "user-data")

Vagrant.configure("2") do |config|
  config.vm.box = "coreos-%s" % $update_channel
  config.vm.box_url = "https://storage.googleapis.com/%s.release.core-os.net/amd64-usr/%s/coreos_production_vagrant.json" % [$update_channel, $image_version]

  # On VirtualBox, we don't have guest additions or a functional vboxsf in
  # CoreOS, so tell Vagrant that so it can be smarter.
  config.vm.provider :virtualbox do |v|
    v.check_guest_additions = false
    v.functional_vboxsf     = false
  end
  if Vagrant.has_plugin?("vagrant-vbguest") then
    config.vbguest.auto_update = false
  end

  config.vm.provider :virtualbox do |vb|
    vb.gui = $vm_gui
    vb.memory = $vm_memory
    vb.cpus = $vm_cpus

    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.customize ["modifyvm", :id, "--nictype1", "virtio" ]
    vb.customize ["modifyvm", :id, "--nictype2", "virtio" ]
  end

  config.vm.define $instance_name do |config|
    config.vm.hostname = $instance_name
    config.hostsupdater.aliases = ["grafana.#{config.vm.hostname}", "prometheus.#{config.vm.hostname}", "traefik.#{config.vm.hostname}"]

    config.vm.network :private_network, ip: "192.168.33.101"
    config.vm.network :forwarded_port, guest: 22, host: 2101, id: 'ssh'
    config.vm.network :forwarded_port, guest: 80, host: 9119

    config.vm.provision :file, :source => "#{CLOUD_CONFIG_PATH}", :destination => "/tmp/vagrantfile-user-data"
    config.vm.provision :shell, :inline => "mv /tmp/vagrantfile-user-data /var/lib/coreos-vagrant/", :privileged => true
  end
end

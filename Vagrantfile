Vagrant.configure(2) do |config|

  config.vm.provider "virtualbox" do |vb|
    # Customize the amount of memory on the VM:
    vb.memory = "1024"
  end

  config.vm.provision :shell do |shell|
     shell.inline = "puppet module install puppetlabs-stdlib;
                     puppet module install puppetlabs-apt;
                     puppet module install boundary-boundary;
                     exit 0"
  end

  config.vm.define "statsd-demo" do |v|
    v.vm.box = "puppetlabs/ubuntu-14.04-64-puppet"
    v.vm.box_version = "1.0.1"
    v.vm.hostname = "statsd-demo"
    v.vm.network "forwarded_port", guest: 8088, host: 8188
  end

  config.vm.provision "puppet" do |puppet|
    puppet.manifests_path = "manifests"
    puppet.manifest_file  = "site.pp"
    puppet.options = "--verbose --debug"
    puppet.facter = {
      "api_token" => ENV["API_TOKEN"]
    }
  end
end

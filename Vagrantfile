Vagrant.configure("2") do |config|
  config.vm.define "my-mini-kube" do |mini|
    mini.vm.box = "ubuntu/focal64"
    mini.vm.network "forwarded_port", guest:8080, host:8080, host_ip: "127.0.0.1"
    mini.vm.provision "shell", path: "scripts/install.sh"
    mini.vm.provider "vrtualbox" do |v|
      v.memory = 8192
      v.cpus=2
    end
  end

end

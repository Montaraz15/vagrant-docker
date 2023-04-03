Vagrant.configure("2") do |config|
  config.vm.define "docker" do |docker|
    docker.vm.box = "ubuntu/focal64"
    docker.vm.network "forwarded_port", guest:8080, host:8080, host_ip: "127.0.0.1"
    docker.vm.provision "shell", path: "scripts/install.sh"
    docker.vm.provider "vrtualbox" do |v|
      v.memory = 8192
      v.cpus=2
    end
  end

end

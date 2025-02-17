## Deprecated. Need to fix
Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/jammy64"
  config.vm.hostname = "jammy"
  config.vm.hostname = "rootvm"
  config.vm.define "RootVM"
  config.vm.network "forwarded_port", guest: 8081, host: 8081 # pgweb
  config.vm.network "forwarded_port", guest: 20000, host: 20000 # kind
  config.vm.network "forwarded_port", guest: 5000, host: 5000 # service-directory
  config.vm.provision "shell", inline: $provision
  config.vm.provision "docker" do |d|
    d.run "ghcr.io/sosedoff/pgweb",
      name: "pgweb",
      daemonize: true, 
      args: "-p 8081:8081"
  end
  config.vm.synced_folder "~/.docker", "/home/vagrant/.docker"
  config.vm.synced_folder "~/.kube", "/home/vagrant/.kube"
  config.vm.synced_folder "~/.aws", "/home/vagrant/.aws"
  config.vm.provider :virtualbox do |vb|
        vb.name = "RootVM"
        vb.memory =  6144
        vb.cpus = 4
  end
end

$provision = <<-'EOF'
#!/bin/bash

sudo apt-get update

os_arch="x86_64"
([ $(uname -m) = arm64 ] || [ $(uname -m) = aarch64 ]) && os_arch="arm64" 

curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.27.0/kind-linux-${os_arch}
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind

# Kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/${os_arch}/kubectl"
curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/${os_arch}/kubectl.sha256"
echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
rm kubectl*

## Usage
cat << END_OF_CAT
Set the following in .ssh/config

Host RootVM
  HostName 127.0.0.1
  User vagrant
  Port 2222
  UserKnownHostsFile /dev/null
  StrictHostKeyChecking no
  PasswordAuthentication no
  IdentityFile ~/.vagrant/machines/RootVM/virtualbox/private_key
  IdentitiesOnly yes
  LogLevel FATAL

Set your terminal
export DOCKER_HOST=ssh://RootVM
END_OF_CAT

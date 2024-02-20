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

# AWS CLI
sudo apt-get install -y unzip docker-compose-plugin
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
aws --version
rm -r aws*

# Golang
curl -LO "https://go.dev/dl/go1.21.0.linux-amd64.tar.gz"
rm -rf /usr/local/go && tar -C /usr/local -xzf go1.21.0.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin
go version
rm go*tar.gz


# Kind
go install sigs.k8s.io/kind@latest
kind --version

# Kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
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
EOF

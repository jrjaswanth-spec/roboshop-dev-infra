
#!/bin/bash
set -e

# Wait a little for disk to become available
sleep 30

# Expand partition only if free space exists
growpart /dev/nvme0n1 4

# Resize physical volume
pvresize /dev/nvme0n1p4

# Extend logical volume using any available free space
lvextend -l +100%FREE /dev/mapper/RootVG-homeVol || true

# Grow XFS filesystem
xfs_growfs /home || true

# Install Terraform
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
sudo yum install -y terraform


# creating databases

cd /home/ec2-user
git clone https://github.com/jrjaswanth-spec/roboshop-dev-infra.git
chown ec2-user:ec2-user -R roboshop-dev-infra
cd roboshop-dev-infra/40-databases
terraform init
terraform apply -auto-approve
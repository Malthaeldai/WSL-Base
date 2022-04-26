sudo apt update;
sudo apt upgrade -y;
sudo apt install gcc make mc curl wget git gnupg2 apt-transport-https ca-certificates curl zsh python3-pip bindfs sshpass -y;
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
wget -q https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
sudo apt update;
sudo apt install terraform packer powershell -y;
sudo python3 -m pip install ansible;
sudo pip3 install pywinrm;
ansible-galaxy install -r ansible_install_collections.yml;
sudo cp posh-linux-amd64 /usr/local/bin/oh-my-posh;
sudo chmod +x /usr/local/bin/oh-my-posh;
cp zsh.tgz ~;
cd ~;
tar -xf zsh.tgz
rm zsh.tgz
cd -;
mkdir ~/shell;
cp schema.json ~/shell;
cp ubuntu.omp.json ~/shell;
cp debian.omp.json ~/shell;
cp zshrc ~/.zshrc;
sudo usermod --shell /usr/bin/zsh $USER
echo "SSH-Keys connection"
read -p 'Windows-Username: ' uservar
mkdir -p ~/.ssh
echo "sudo bindfs -u $USER -g $USER -p 0600:ug+D /mnt/c/Users/$uservar/.ssh/ .ssh/" >> ~/.zshrc
echo "--------------------------------------------------";
echo "Pls. re-log to Distro";
echo "--------------------------------------------------";

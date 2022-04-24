sudo apt update;
sudo apt upgrade -y;
sudo apt install gcc make mc curl wget git gnupg2 apt-transport-https ca-certificates curl zsh python3-pip bindfs -y;

curl https://apt.releases.hashicorp.com/gpg | gpg --dearmor > hashicorp.gpg
sudo install -o root -g root -m 644 hashicorp.gpg /etc/apt/trusted.gpg.d/
sudo apt-add-repository "deb [arch=$(dpkg --print-architecture)] https://apt.releases.hashicorp.com focal main"
sudo dpkg -i libssl1.1_1.1.1f-1ubuntu2.12_amd64.deb 

echo "deb [arch=amd64,armhf,arm64 signed-by=/usr/share/keyrings/powershell.gpg] \
https://packages.microsoft.com/ubuntu/20.04/prod focal main" | sudo tee /etc/apt/sources.list.d/powershell.list
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo tee /usr/share/keyrings/powershell.gpg >/dev/null

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

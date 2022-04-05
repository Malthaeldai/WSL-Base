sudo apt update;
sudo apt upgrade -y;
sudo apt install gcc make mc curl wget git gnupg2 apt-transport-https ca-certificates curl zsh -y;
sudo apt install python3-pip;
sudo python3 -m pip install ansible;
sudo pip3 install pywinrm;
ansible-galaxy install -r ansible_install_collections.yml;
sudo cp posh-linux-amd64 /usr/local/bin/oh-my-posh;
sudo chmod +x /usr/local/bin/oh-my-posh;
cp zsh.tgz ~;
cd ~;
tar -xf zsh.tgz
rm zsh.tgz
echo "--------------------------------------------------";
echo "Done -- Starting SetUp-Playbook of Ansible";
echo "--------------------------------------------------";
cd -;
mkdir ~/shell;
cp schema.json ~/shell;
cp ubuntu.omp.json ~/shell;
cp debian.omp.json ~/shell;
cp zshrc ~/.zshrc;
sudo usermod --shell /usr/bin/zsh $USER
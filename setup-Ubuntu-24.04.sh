sudo apt update;
sudo apt upgrade -y;
sudo apt install gcc make mc curl wget git gnupg2 apt-transport-https ca-certificates curl zsh python3 python3-pip python3-venv python3-winrm bindfs sshpass zoxide eza bat xsel software-properties-common -y;
sudo dpkg -i libssl1.1_1.1.1f-1ubuntu2.12_amd64.deb 

sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install ansible -y
ansible-galaxy install -r ansible_install_collections.yml;


wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg;
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(grep -oP '(?<=UBUNTU_CODENAME=).*' /etc/os-release || lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list;
sudo apt update && sudo apt install terraform packer -y;

source /etc/os-release;
wget -q https://packages.microsoft.com/config/ubuntu/$VERSION_ID/packages-microsoft-prod.deb;
sudo dpkg -i packages-microsoft-prod.deb;
rm packages-microsoft-prod.deb;
sudo apt-get update;
sudo apt-get install -y powershell;

curl -sS https://starship.rs/install.sh | sh
mkdir -p ~/.config;
cp .config/starship.toml ~/.config/starship.toml;
cp zsh.tgz ~;
cd ~;
tar -xf zsh.tgz
rm zsh.tgz
cd -;
cp zshrc ~/.zshrc;
sudo usermod --shell /usr/bin/zsh $USER
echo "SSH-Keys connection"
read -p 'Windows-Username: ' uservar
mkdir -p ~/.ssh
echo "\nsudo bindfs -u $USER -g $USER -p 0600:ug+D /mnt/c/Users/$uservar/.ssh/ .ssh/" >> ~/.zshrc
echo "--------------------------------------------------";
echo "Pls. re-log to Distro";
echo "--------------------------------------------------";
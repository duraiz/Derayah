•   Install Chocolatey Windows Package Manager using Ansible for Window Only  
•   Configure and enable SSH on standard port so that it starts up on restart of machine  
•   Upload a configurable SSH key (I should be able to set my key so that I can test this process)  
•   Install Git using Chocolatey  

# Requirements

Requirements pior to running ansible playbook

 WinRM listener should be created and activated.

 For that i used a powershell script from public solution to enable winrm

 [https://raw.githubusercontent.com/ansible/ansible/devel/examples/scripts/ConfigureRemotingForAnsible.ps1]


## Run the playbook, like this:

 * ansible-playbook -i hosts playbook.yaml

### How to upload your ssh key
Plase put your ssh key in ssh-keys.yml file and it will uploaded to windows machine

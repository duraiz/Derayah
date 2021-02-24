configure an Azure instance of Windows so that case study can be tested on cloud instance  
Install Chocolatey Windows Package Manager using Ansible for Window Only  
Configure and enable SSH on standard port so that it starts up on restart of machine  
Upload a configurable SSH key (I should be able to set my key so that I can test this process)  
Install Git using Chocolatey  

# Requirements
Azure credentials


## Run the playbook, like this:

* git clione https://github.com/duraiz/Derayah.git
* cd Derayah/Bonus-1
* ansible-playbook  main.yml

### How to upload your ssh key
Plase put your ssh key in roles/enable_ssh/tasks/default.yml file and it will uploaded to windows machine

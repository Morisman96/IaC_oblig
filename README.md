## Terraform Oblig 1 README

### Overview
This terraform project is a part of the IIKG3005 compulsory assagingment 1. The purpose of the project is to create 4 child modules and a root  module that takes information form the child moduals.
Child modules:
* Network Module(network): To provision VNET, Subnet, and Network Security Group.
* Storage Account Module(sa): To create an Azure Storage Account and a storage container.
* Virtual Machine Module(linuxvm): To provision an Azure Linux Virtual Machine.
* Key Vault Module(keyvault): To provision Azure Key Vault and store secrets.

### Prerequisites
The following is needed to be installed:
- [Terraform](https://www.terraform.io/downloads)
- [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)

You also need the an Azure account.

### Project Structer
martmori-oppg1/
├── main.tf
├── variables.tf
├── terraform.tfvars
├── modules/
│   ├── keyvault/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── linuxvm/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── network/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   └── sa/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
│
└── README.md


### Modules
#### Root Module
The root module orchestrates the child modules.

**Variables**
- **`azure_subscription_id`**: The subscription ID for the Azure account  
- **`rg_name`**: Resource group name  
- **`location`**: Location of the resource group  

---

#### Network Module
Sets up a virtual network, a subnet, and a network security group with rules.
*for more info:* https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network

**Variables**
- **`nsg_name`**: Network security group name  
- **`vnet_name`**: Virtual network name  
- **`subnet_name`**: Subnet name  
- **`sec_rule_name`**: Security rule name *(Default: `SSH`)*  
- **`sec_rule_priority`**: Security rule priority *(Default: `1001`)*  
- **`sec_rule_direction`**: Security rule direction *(Default: `Inbound`)*  
- **`sec_rule_access`**: Security rule access *(Default: `Allow`)*  
- **`sec_rule_protocol`**: Security rule protocol *(Default: `Tcp`)*  
- **`sec_rule_source_port_range`**: Security rule source port range *(Default: `*`)*  
- **`sec_rule_destination_port_range`**: Security rule destination port range *(Default: `22`)*  
- **`sec_rule_source_address_prefix`**: Security rule source address prefix  
- **`sec_rule_destination_address_prefix`**: Security rule destination address prefix *(Default: `*`)*  

**Outputs**
- **`subnet_id`**: ID of the subnet 
---

#### Storage Account Module
Sets up a storage account and a storage container.
*for more info:* https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_container 
**Variables**
- **`sa_name`**: Storage account name  
- **`sa_con_name`**: Storage account container name  
- **`sa_tier`**: Storage account tier *(Default: `Standard`)*  
- **`sa_type`**: Storage account replication type *(Default: `LRS`)*  
- **`sa_con_access_type`**: Storage container access type *(Default: `private`)*  

**Outputs**
- **`sa_prim_key`**: Primary access key of the storage account
---

#### Key Vault Module
Sets up a Key Vault with the password and username to the Virtual Maskin and the Storage Account Access Key as secrets.
*for more info:* https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_container
**Variables**
- **`kvault_name`**: Key vault name  
- **`kvault_sku`**: Key vault SKU *(Default: `standard`)*  

**Outputs**
- **`kvault_secret_id`**: Id of the key vault secret  
- **`vm_username_output`**: The username for the VM  
- **`vm_password_output`**: The password for the VM 
- **`sa_key_output`**: The key for the storage account  
---

#### Virtual Machine (VM) Module
Sets up a linux Virtual Maskin with a network interface and public ip.
*for more info:* https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine
**Variables**
- **`vm_username`**: VM username  
- **`vm_userpassw`**: VM password  
- **`vm_name`**: Virtual machine name  
- **`pub_ip_name`**: Public IP name  
- **`pub_ip_sku`**: Public IP SKU *(Default: `Basic`)*  
- **`vm_size`**: Virtual machine size *(Default: `Standard_F2`)*  
- **`nic_name`**: Network interface name  
- **`ssh_pub_key`**: File path to SSH public key for the VM *(Default: `~/.ssh/id_rsa.pub`)*  
- **`img_publ`**: Image publisher *(Default: `Canonical`)*  
- **`img_offer`**: Image offer *(Default: `0001-com-ubuntu-server-jammy`)*  
- **`img_sku`**: Image SKU *(Default: `22_04-lts`)*  
- **`img_ver`**: Image version *(Default: `latest`)*  

**Outputs**
- **`vm_pub_ip_address`**: The public IP address of the VM
---

### Usage
1. Iniztialize the project and terraform modulein bash with:
```console
terraform init
```
2. Customize The terraform.tfvars with the listed variables. varalbes listed with deafult values are does not need to be defined.

3. Plan the terraform project with the command:
```console
terraform plan
```

4. Apply the terraform project with the command:
```console
terraform apply
```

If you want to take down the project use the command:
```console
terraform destroy
```

License
This project is licensed under the MIT License
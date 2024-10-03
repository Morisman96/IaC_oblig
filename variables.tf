variable "azure_subscription_id" {
  description = "The subscription ID for the Azure account"
  type        = string
}

# variables for resource group
variable "rg_name" {
  description = "Resource group name"
  type        = string
}

variable "location" {
  description = "Location of the resource group"
  type        = string
}

# variables for network module
variable "nsg_name" {
  description = "Network securtiy group name"
  type        = string
}

variable "vnet_name" {
  description = "Virtual netvork name"
  type        = string
}

variable "subnet_name" {
  description = "Subnet name"
  type        = string
}

# variables for network security group in network module
variable "sec_rule_name" {
  description = "Security rule name"
  type        = string
  default = "SSH"
}

variable "sec_rule_priority" {
  description = "Security rule priority"
  type        = number
  default = 1001
}

variable "sec_rule_direction" {
  description = "Security rule direction"
  type        = string
  default = "Inbound"
}

variable "sec_rule_access" {
  description = "Security rule access"
  type        = string
  default = "Allow"
}

variable "sec_rule_protocol" {
  description = "Security rule protocol"
  type        = string
  default = "Tcp"
}

variable "sec_rule_source_port_range" {
  description = "Security rule source port range"
  type        = string
  default = "*"
}

variable "sec_rule_destination_port_range" {
  description = "Security rule destination port range"
  type        = string
  default = "22"
} 

variable "sec_rule_source_address_prefix" {
  description = "Security rule source address prefix"
  type        = string
}

variable "sec_rule_destination_address_prefix" {
  description = "Security rule destination address prefix"
  type        = string
  default = "*"
}

# variables for sa module
variable "sa_name" {
  description = "Storage account name"
  type        = string
}

variable "sa_con_name" {
  description = "storage account container name"
  type        = string
}

variable "sa_tier" {
  description = "Storage account tier"
  type        = string
  default     = "Standard"
}

variable "sa_type" {
  description = "Storage account replication type"
  type        = string
  default     = "LRS" 
}

variable "sa_con_access_type" {
  description = "Storage container access type"
  type        = string
  default     = "private"
}

# variables for keyvault module
variable "kvault_name" {
  description = "Key vault name"
  type        = string
}

variable "kvault_sku" {
  description = "Key vault SKU"
  type        = string
  default     = "standard"
}


variable "vm_username" {
  description = "VM username"
  type        = string
 
}

variable "vm_userpassw" {
  description = "VM password"
  type        = string
  sensitive = true
}


# variables for vm module
variable "vm_name" {
  description = "Virtual maskin name"
  type        = string
}

variable "pub_ip_name" {
  description = "Public IP name"
  type        = string
}

variable "pub_ip_sku" {
  description = "Public IP SKU"
  type        = string
  default     = "Basic"
}


variable "vm_size" {
  description = "value of the virtual machine size"
  type        = string
  default     = "Standard_F2"
}

variable "nic_name" {
  description = "The name of the network interface"
  type        = string
}

variable "ssh_pub_key" {
  description = "File path to ssh public key for the VM"
  type        = string
  default = "~/.ssh/id_rsa.pub"
}

# variables for source image reference in vm module
variable "img_publ" {
  description = "The publisher of the image"
  type        = string
  default = "Canonical"
}

variable "img_offer" {
  description = "The offer of the image"
  type        = string
  default = "0001-com-ubuntu-server-jammy"
}

variable "img_sku" {
  description = "The SKU of the image"
  type        = string
  default = "22_04-lts"
}

variable "img_ver" {
  description = "The version of the image"
  type        = string
  default = "latest"
}




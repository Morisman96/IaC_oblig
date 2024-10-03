variable "rg_name" {
  description = "Resource group name"
  type        = string
}

variable "location" {
  description = "Location of the resource group"
  type        = string
}

variable "vm_name" {
  description = "Virtual maskin name"
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet"
  type        = string
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

variable "vm_size" {
  description = "value of the virtual machine size"
  type        = string
}

variable "ssh_pub_key" {
  description = "File path to the ssh public key for the VM "
  type        = string
}

variable "nic_name" {
  description = "The name of the network interface"
  type        = string
}

# source image reference
variable "img_publ" {
  description = "The publisher of the image"
  type        = string
}

variable "img_offer" {
  description = "The offer of the image"
  type        = string
}

variable "img_sku" {
  description = "The SKU of the image"
  type        = string
}

variable "img_ver" {
  description = "The version of the image"
  type        = string
}

# variables for for public ip
variable "pub_ip_name" {
  description = "Public IP name"
  type        = string
}

variable "pub_ip_allocation_method" {
  description = "Public IP allocation method"
  type        = string
  default     = "Dynamic"
}

variable "pub_ip_sku" {
  description = "Public IP SKU"
  type        = string
}

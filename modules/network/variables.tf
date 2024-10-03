variable "rg_name" {
  description = "Resource group name"
  type        = string
}

variable "location" {
  description = "Location of the resource group"
  type        = string
}

variable "nsg_name" {
  description = "Network securtiy group name"
  type        = string
}

variable "subnet_name" {
  description = "Subnet name"
  type        = string
}

variable "vnet_name" {
  description = "Virtual netvork name"
  type        = string
}

# Variables for network security group
variable "sec_rule_name" {
  description = "Security rule name"
  type        = string
}

variable "sec_rule_priority" {
  description = "Security rule priority"
  type        = number
}

variable "sec_rule_direction" {
  description = "Security rule direction"
  type        = string
}

variable "sec_rule_access" {
  description = "Security rule access"
  type        = string
}

variable "sec_rule_protocol" {
  description = "Security rule protocol"
  type        = string
}

variable "sec_rule_source_port_range" {
  description = "Security rule source port range"
  type        = string
}

variable "sec_rule_destination_port_range" {
  description = "Security rule destination port range"
  type        = string
} 

variable "sec_rule_source_address_prefix" {
  description = "Security rule source address prefix"
  type        = string
}

variable "sec_rule_destination_address_prefix" {
  description = "Security rule destination address prefix"
  type        = string
}
variable "rg_name" {
  description = "Resource group name"
  type        = string
}

variable "location" {
  description = "Location of the resource group"
  type        = string
}

variable "kvault_name" {
  description = "Key vault name"
  type        = string
}

variable "kvault_sku" {
  description = "Key vault SKU"
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

variable "sa_prim_key" {
  description = "Primary key for the storage account"
  type        = string
  sensitive = true
}
variable "rg_name" {
  description = "Resource group name"
  type        = string
}
variable "location" {
  description = "Location of the resource group"
  type        = string
}

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
}

variable "sa_type" {
  description = "Storage account replication type"
  type        = string
}

variable "sa_con_access_type" {
  description = "Storage container access type"
  type        = string
}
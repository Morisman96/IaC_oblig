# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.0.1"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  subscription_id = var.azure_subscription_id
  features {
      key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
  }
}

# Create a resource group
resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.location
}

module "network" {
 source = "./modules/network" 
 rg_name = azurerm_resource_group.rg.name
 location = azurerm_resource_group.rg.location
 vnet_name = var.vnet_name
 nsg_name = var.nsg_name
 subnet_name = var.subnet_name

# Security rule variables
  sec_rule_name = var.sec_rule_name
  sec_rule_priority = var.sec_rule_priority
  sec_rule_direction = var.sec_rule_direction
  sec_rule_access = var.sec_rule_access
  sec_rule_protocol = var.sec_rule_protocol
  sec_rule_source_port_range = var.sec_rule_source_port_range
  sec_rule_destination_port_range = var.sec_rule_destination_port_range
  sec_rule_source_address_prefix = var.sec_rule_source_address_prefix
  sec_rule_destination_address_prefix = var.sec_rule_destination_address_prefix
}

module "sa" {
  source = "./modules/sa"
  rg_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
  sa_name = var.sa_name
  sa_tier = var.sa_tier
  sa_type = var.sa_type

  # Storage account container variables
  sa_con_name = var.sa_con_name
  sa_con_access_type = var.sa_con_access_type
}



module "keyvault" {
  source = "./modules/keyvault"
  rg_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
  sa_prim_key = module.sa.sa_prim_key
  kvault_sku = var.kvault_sku
  kvault_name = var.kvault_name
  vm_username = var.vm_username
  vm_userpassw = var.vm_userpassw
}

module "linuxvm" {
  source = "./modules/linuxvm"
  rg_name = azurerm_resource_group.rg.name
  location =  azurerm_resource_group.rg.location
  vm_name = var.vm_name
  vm_size = var.vm_size
  vm_username = module.keyvault.vm_username_output
  vm_userpassw = module.keyvault.vm_password_output
  ssh_pub_key = var.ssh_pub_key


  # Image variables
  img_offer = var.img_offer
  img_publ = var.img_publ
  img_sku = var.img_sku
  img_ver = var.img_ver

  # Network Interface variables
  subnet_id = module.network.subnet_id
  nic_name = var.nic_name
  pub_ip_name = var.pub_ip_name
  pub_ip_sku = var.pub_ip_sku
}

  
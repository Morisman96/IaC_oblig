

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = var.rg_name
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_network_security_group" "nsgroup" {
  name                = var.nsg_name
  location            = var.location
  resource_group_name = var.rg_name
  security_rule {
    name                       = var.sec_rule_name
    priority                   = var.sec_rule_priority
    direction                  = var.sec_rule_direction
    access                     = var.sec_rule_access
    protocol                   = var.sec_rule_protocol
    source_port_range          = var.sec_rule_source_port_range
    destination_port_range     = var.sec_rule_destination_port_range
    source_address_prefix      = var.sec_rule_source_address_prefix
    destination_address_prefix = var.sec_rule_destination_port_range
  }

}

resource "azurerm_subnet_network_security_group_association" "subnetnsg" {
  subnet_id                 = azurerm_subnet.subnet.id
  network_security_group_id = azurerm_network_security_group.nsgroup.id
}





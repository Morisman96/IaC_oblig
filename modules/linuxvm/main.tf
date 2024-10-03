resource "azurerm_public_ip" "pub_ip" {
  name                = var.pub_ip_name
  location            = var.location
  resource_group_name = var.rg_name
  allocation_method   = "Dynamic" 
  sku = var.pub_ip_sku
}

resource "azurerm_network_interface" "nic" {
  name                = var.nic_name
  location            = var.location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.pub_ip.id
  }
}

resource "azurerm_linux_virtual_machine" "vm" {
  name                = var.vm_name
  resource_group_name = var.rg_name
  location            = var.location
  size                = var.vm_size
  admin_username      = var.vm_username
  admin_password = var.vm_userpassw
  network_interface_ids = [
    azurerm_network_interface.nic.id,
  ]

  admin_ssh_key {
    username   = var.vm_username
    public_key = file(var.ssh_pub_key)
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = var.img_publ
    offer     = var.img_offer
    sku       = var.img_sku
    version   = var.img_ver
  }
}
data "azurerm_client_config" "current" {}


resource "azurerm_key_vault" "kvault" {
  name                        = var.kvault_name
  location                    = var.location
  resource_group_name         = var.rg_name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = var.kvault_sku


  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Create",
      "Get",
    ]

    secret_permissions = [
      "Set",
      "Get",
      "Delete",
      "Purge",
      "Recover"
    ]
  }
}


resource "azurerm_key_vault_secret" "vmuser" {
  name         = "vm-username"
  value        = var.vm_username
  key_vault_id = azurerm_key_vault.kvault.id
}

resource "azurerm_key_vault_secret" "vmpassw" {
  name         = "vm-password"
  value        = var.vm_userpassw
  key_vault_id = azurerm_key_vault.kvault.id
}

resource "azurerm_key_vault_secret" "sakey" {
  name         = "sa-primary-key"
  value        = var.sa_prim_key
  key_vault_id = azurerm_key_vault.kvault.id
}

resource "azurerm_storage_account" "sa" {
  name                     = var.sa_name
  resource_group_name      = var.rg_name
  location                 = var.location
  account_tier             = var.sa_tier
  account_replication_type = var.sa_type
}

resource "azurerm_storage_container" "sa_con" {
  name                 = var.sa_con_name
  storage_account_name = azurerm_storage_account.sa.name
  container_access_type = var.sa_con_access_type
}
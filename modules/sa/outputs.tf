output "sa_prim_key" {
  value = azurerm_storage_account.sa.primary_access_key
 description = "Primary access key of the storage account"
sensitive = true
}
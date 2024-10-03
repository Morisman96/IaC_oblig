output "kvault_secret_id" {
  value = azurerm_key_vault.kvault.id
  description = "Id of the key vault secret"
}

output "vm_username_output" {
  value     = azurerm_key_vault_secret.vmuser.value
}

output "vm_password_output" {
  value     = azurerm_key_vault_secret.vmpassw.value
  sensitive = true
}

output "sa_key_output" {
  value     = azurerm_key_vault_secret.sakey.value
  sensitive = true
}
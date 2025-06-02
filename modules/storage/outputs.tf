# Outputs for the Azure Storage Account module
output "storage_account_id" {
  value = azurerm_storage_account.storage.id
}

output "storage_account_primary_web_endpoint" {
  value = azurerm_storage_account.storage.primary_web_endpoint
}
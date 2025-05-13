output "storage_account_name" {
  value = azurerm_storage_account.storage.name
}

output "raw_container_url" {
  value = "https://${azurerm_storage_account.storage.name}.blob.core.windows.net/raw-data"
}

output "clean_container_url" {
  value = "https://${azurerm_storage_account.storage.name}.blob.core.windows.net/clean-data"
}

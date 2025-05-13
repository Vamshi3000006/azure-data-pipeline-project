
provider "azurerm" {
  features {}

  subscription_id = "5cde2445-ca29-45d3-bdec-362a70b17764"
  tenant_id       = "08d74c68-14fa-4041-815d-3ec54522741c"
}
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_storage_account" "storage" {
  name                     = var.storage_account_id
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "raw" {
  name                  = "raw-data"
  storage_account_id  = azurerm_storage_account.storage.id
  container_access_type = "private"
}

resource "azurerm_storage_container" "clean" {
  name                  = "clean-data"
  storage_account_id  = azurerm_storage_account.storage.id
  container_access_type = "private"
}

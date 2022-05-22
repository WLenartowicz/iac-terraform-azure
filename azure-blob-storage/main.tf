resource "azurerm_resource_group" "blob" {
  name     = var.resource_group_name
  location = var.resource_group_location
}

resource "azurerm_storage_account" "blob" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.blob.name
  location                 = azurerm_resource_group.blob.location
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_rep_type

  tags = var.storage_account_tags
}

resource "azurerm_storage_container" "blob" {
  name                  = var.storage_container_name
  storage_account_name  = azurerm_storage_account.blob.name
  container_access_type = var.storage_container_access_type
}

resource "azurerm_storage_blob" "blob" {
  name                   = var.storage_blob_name
  storage_account_name   = azurerm_storage_account.blob.name
  storage_container_name = azurerm_storage_container.blob.name
  type                   = var.storage_blob_type
  source                 = var.storage_blob_source
}
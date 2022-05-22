resource "azurerm_resource_group" "appsvc" {
  name     = var.resource_group_name
  location = var.resource_group_location
}

resource "azurerm_app_service_plan" "appsvc" {
  name                = var.app_service_plan_name
  location            = azurerm_resource_group.appsvc.location
  resource_group_name = azurerm_resource_group.appsvc.name

  sku {
    tier = var.app_service_plan_sku_tier
    size = var.app_service_plan_sku_size
  }
}

resource "azurerm_app_service" "appsvc" {
  name                = var.app_service_name
  location            = azurerm_resource_group.appsvc.location
  resource_group_name = azurerm_resource_group.appsvc.name
  app_service_plan_id = azurerm_app_service_plan.appsvc.id

  site_config {
    python_version = var.app_service_python_version
  }

}
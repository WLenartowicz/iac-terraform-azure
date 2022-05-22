resource "azurerm_resource_group" "functions" {
  name     = var.resource_group_name
  location = var.resource_group_location
}

resource "azurerm_storage_account" "functions" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.functions.name
  location                 = azurerm_resource_group.functions.location
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_rep_type

  tags = var.storage_account_tags
}

resource "azurerm_app_service_plan" "functions" {
  name                = var.app_service_plan_name
  location            = azurerm_resource_group.functions.location
  resource_group_name = azurerm_resource_group.functions.name

  sku {
    tier = var.app_service_plan_sku_tier
    size = var.app_service_plan_sku_size
  }
}

resource "azurerm_linux_function_app" "functions" {
  name                = var.linux_function_app_name
  resource_group_name = azurerm_resource_group.functions.name
  location            = azurerm_resource_group.functions.location

  storage_account_name = azurerm_storage_account.functions.name
  service_plan_id      = azurerm_app_service_plan.functions.id

  site_config {}
}

resource "azurerm_function_app_function" "functions" {
  name            = var.function_app_name
  function_app_id = azurerm_linux_function_app.functions.id
  language        = var.function_app_language
  test_data = jsonencode({
    "name" = "Azure"
  })
  config_json = jsonencode({
    "bindings" = [
      {
        "authLevel" = "function"
        "direction" = "in"
        "methods" = [
          "get",
          "post",
        ]
        "name" = "req"
        "type" = "httpTrigger"
      },
      {
        "direction" = "out"
        "name"      = "$return"
        "type"      = "http"
      },
    ]
  })
}

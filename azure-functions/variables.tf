variable "resource_group_name" {
    type = string
    default = "PiAA_Functions_group"
}

variable "resource_group_location" {
    type = string
    default = "West Europe"
}

variable "storage_account_name" {
    type = string
    default = "accpiaafunctions"
}

variable "storage_account_tier" {
    type = string
    default = "Standard"
}

variable "storage_account_rep_type" {
    type = string
    default = "GRS"
}

variable "storage_account_tags" {
    default = {
        Environment = "PiAA_Functions"
    }
}

variable "app_service_plan_name" {
    type = string
    default = "api-appserviceplan-PiAA-Functions"
}

variable "app_service_plan_sku_tier" {
    type = string
    default = "Standard"
}

variable "app_service_plan_sku_size" {
    type = string
    default = "S1"
}

variable "linux_function_app_name" {
    type = string
    default = "linux-function-app-PiAA"
}

variable "function_app_name" {
    type = string
    default = "function-app-PiAA"
}

variable "function_app_language" {
    type = string
    default = "Python"
}
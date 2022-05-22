variable "resource_group_name" {
    type = string
    default = "PiAA_app_svc_group"
}

variable "resource_group_location" {
    type = string
    default = "West Europe"
}

variable "app_service_plan_name" {
    type = string
    default = "api-appserviceplan-PiAA-app-scv"
}

variable "app_service_plan_sku_tier" {
    type = string
    default = "Standard"
}

variable "app_service_plan_sku_size" {
    type = string
    default = "S1"
}

variable "app_service_name" {
    type = string
    default = "piaa-app"
}

variable "app_service_python_version" {
    default = 3.4
}
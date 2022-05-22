variable "resource_group_name" {
    type = string
    default = "PiAA_blob_group"
}

variable "resource_group_location" {
    type = string
    default = "West Europe"
}

variable "storage_account_name" {
    type = string
    default = "accpiaablob"
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
        Environment = "PiAA_blob"
    }
}

variable "storage_container_name" {
    type = string
    default = "vhds-piaa-blob"
}

variable "storage_container_access_type" {
    type = string
    default = "private"
}

variable "storage_blob_name" {
    type = string
    default = "PiAA-blob.zip"
}

variable "storage_blob_type" {
    type = string
    default = "Block"
}

variable "storage_blob_source" {
    type = string
    default = "./plik.txt"
}

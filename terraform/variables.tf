variable "dns_zone" {
  type      = string
  default = "anshlyapnikov.ru"
}

variable "service_account_id" {
  type      = string
}

variable "meta_data" {
  type      = string
  default   = "./meta.txt"
}

variable "domain" {
  type      = string
}

variable "token" {
  type      = string
  sensitive = true
}

variable "cloud_id" {
  type      = string
  sensitive = true
}

variable "folder_id" {
  type      = string
  sensitive = true
}

variable "db_user" {
  type      = string
  sensitive = true
}

variable "db_password" {
  type      = string
  sensitive = true
}

variable "db_port" {
  type      = number
  sensitive = true
}

variable "db_name" {
  type      = string
  sensitive = true
}

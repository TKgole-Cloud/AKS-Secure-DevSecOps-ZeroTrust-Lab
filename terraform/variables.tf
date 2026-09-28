variable "location" {
  description = "Azure region"
  type        = string
  default     = "South Africa North"
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
  default     = "rg-aks-zero-trust-lab"
}

variable "vnet_name" {
  description = "Virtual network name"
  type        = string
  default     = "vnet-aks-zero-trust"
}

variable "acr_name" {
  description = "Globally unique Azure Container Registry name"
  type        = string
}
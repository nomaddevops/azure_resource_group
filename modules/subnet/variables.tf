variable "enforce_private_link_endpoint_network_policies" {
  type    = bool
  default = true
}

variable "address_space" {
  type        = string
  description = "CIDR block to use in the virtual network, eg. 10.0.0.0/16"
}

variable "resource_group_name" {
  type = string
}

variable "resource_group_location" {
  type = string
}

variable "virtual_network_name" {
  type = string
}

variable "subnet_type" {
  type = string
  validation {
    condition     = can(regex("^(public|private|vpn)$", var.subnet_type))
    error_message = "Subnet type must be one of this public, private, vpn."
  }
}
variable "is_multi_az" {
  type    = bool
  default = false
}
variable "resource_group_name" {
  type = string
}

variable "current_virtual_network" {
  type = any
}
variable "targeted_resource_group_name" {

}
variable "targeted_virtual_network_name" {

}
variable "from_allow_virtual_network_access" {
  type    = bool
  default = true
}
variable "from_allow_forwarded_traffic" {
  type    = bool
  default = true
}
variable "from_allow_gateway_transit" {
  type    = bool
  default = false
}
variable "from_use_remote_gateways" {
  type    = bool
  default = false
}

variable "to_allow_virtual_network_access" {
  type    = bool
  default = true
}
variable "to_allow_forwarded_traffic" {
  type    = bool
  default = true
}
variable "to_allow_gateway_transit" {
  type    = bool
  default = false
}
variable "to_use_remote_gateways" {
  type    = bool
  default = false
}
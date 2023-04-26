variable "name" {
  type        = string
  default     = null
  description = "Generic name of the resource group"
}

variable "location" {
  type        = string
  default     = "francecentral"
  description = "Common name for the region to deploy, allowed location are France Central or France South"
}

variable "address_space" {
  type        = string
  default     = "10.16.0.0/16"
  description = "Full CIDR notation for the resource group, this must match the convention x.x.x.x/x"
}

variable "vnet_peerings" {
  type = map(object({
    rg                                = string
    from_allow_virtual_network_access = optional(bool)
    from_allow_forwarded_traffic      = optional(bool)
    from_allow_gateway_transit        = optional(bool)
    from_use_remote_gateways          = optional(bool)

    to_allow_virtual_network_access = optional(bool)
    to_allow_forwarded_traffic      = optional(bool)
    to_allow_gateway_transit        = optional(bool)
    to_use_remote_gateways          = optional(bool)
  }))
  default     = {}
  description = "Configuration of virtual network peering"
}

variable "rg_policy_type" {
  type        = string
  description = "Type of policy to use"
  default     = "Custom"
}
variable "rg_policy_mode" {
  type        = string
  description = "Apply policy on resource type, All by default"
  default     = "All"
}

variable "rg_policy_description" {
  type        = string
  description = "Description of the resource group policy"
  default     = ""
}

variable "rg_policy_rule" {
  type        = string
  description = "Custom policy to override default one"
  default     = null
}

variable "rg_policy_parameters" {
  type        = string
  description = "Custom policy parameters to override the default one"
  default     = null
}

variable "subnet_config" {
  type = map(object({
    is_multi_az = optional(bool)
  }))
  description = "Map of object, where key is the subnet type to deploy(public, private, vpn) and it's multi-az configuration "
  default = {
    public  = {}
    private = {}
    vpn     = {}
  }
}

variable "dns_zone" {
  type    = map(object({}))
  default = {}
}
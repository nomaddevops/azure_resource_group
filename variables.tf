variable "location" {
  type        = string
  default     = "francecentral"
  description = "Azure Region Name (See https://azuretracks.com/2021/04/current-azure-region-names-reference/ for more infos)"
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
  default     = {
    public = {}
    private = {}
    vpn = {}
  }
}



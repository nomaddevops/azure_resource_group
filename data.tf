locals {
  today = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
  tags = {
    "Environment"  = terraform.workspace
    "Last_Updated" = local.today
  }
  zones = toset(["1", "2", "3"])

  /*vnet_peerings = defaults(var.vnet_peerings, {
    from_allow_virtual_network_access = true
    from_allow_forwarded_traffic      = true
    from_allow_gateway_transit        = false
    from_use_remote_gateways          = false

    to_allow_virtual_network_access = true
    to_allow_forwarded_traffic      = true
    to_allow_gateway_transit        = false
    to_use_remote_gateways          = false
  })*/

  /*subnets = defaults(var.subnets, {
    nsg_security_rule = {}
  })*/
}
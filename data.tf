locals {
  today = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
  tags = {
    "Environment"  = terraform.workspace
    "Last_Updated" = local.today
  }
  zones = toset(["1", "2", "3"])
}
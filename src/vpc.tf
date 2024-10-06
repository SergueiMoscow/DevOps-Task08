data "yandex_vpc_network" "my_vpc" {
  name = "default"
}

locals {
  subnet_ids = data.yandex_vpc_network.my_vpc.subnet_ids
}
# For terraform console:
# [for idx, id in tolist(local.subnet_ids) : id if idx != 2]

data "yandex_vpc_network" "my_vpc" {
  name = "default"
}

data "yandex_vpc_subnet" "all_subnets" {
  for_each = toset(data.yandex_vpc_network.my_vpc.subnet_ids)
  subnet_id = each.key
}

locals {
  subnet_ids = data.yandex_vpc_network.my_vpc.subnet_ids

  # Собираем список зон из всех подсетей
  subnet_zones = [for s in data.yandex_vpc_subnet.all_subnets : s.zone]

  # Структура из задачи
  vpc = {
    network_id  = data.yandex_vpc_network.my_vpc.id
    subnet_ids  = data.yandex_vpc_network.my_vpc.subnet_ids
    subnet_zones = local.subnet_zones
  }
}
# For terraform console:
# [for idx, id in tolist(local.subnet_ids) : id if idx != 2]
# {
#   network_id = local.vpc.network_id
#   subnet_ids = [for idx, id in tolist(local.subnet_ids) : id if idx != 2]
#   subnet_zones = [for idx, id in tolist(local.vpc.subnet_zones) : id if idx != 2]
# }

# В одну строку для консоли:
# {network_id = local.vpc.network_id,subnet_ids = [for idx, id in tolist(local.subnet_ids) : id if idx != 2],subnet_zones = [for idx, id in tolist(local.vpc.subnet_zones) : id if idx != 2]}

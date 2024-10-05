resource "yandex_compute_instance" "db" {
  for_each = { for vm in local.each_vm : vm.vm_name => vm }

  name = each.value.vm_name
  hostname = each.value.vm_name

  resources {
    cores  = each.value.cpu
    memory = each.value.ram
  }

  boot_disk {
    initialize_params {
      size     = each.value.disk_volume
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

  scheduling_policy {
    preemptible = false
  }

  metadata = local.vm_metadata
}

locals {
  each_vm = [
    {
      vm_name     = "main"
      cpu         = 4
      ram         = 8
      disk_volume = 5
    },
    {
      vm_name     = "replica"
      cpu         = 2
      ram         = 4
      disk_volume = 5
    }
  ]
}

variable "each_vm" {
  type = list(object({
    vm_name     = string
    cpu         = number
    ram         = number
    disk_volume = number
  }))

  default = [
    {
      vm_name     = "default"
      cpu         = 1
      ram         = 1
      disk_volume = 1
    }
  ]
}

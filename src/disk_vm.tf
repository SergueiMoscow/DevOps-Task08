resource "yandex_compute_disk" "extra_disk" {
  count = 3

  name = "extra-disk-${count.index + 1}"
  size = var.disk_properties.size
  type = var.disk_properties.type
}

resource "yandex_compute_instance" "storage" {
  name     = "storage"
  hostname = "storage"

  resources {
    cores         = var.vm_web_resources.cores
    memory        = var.vm_web_resources.memory
    core_fraction = var.vm_web_resources.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = var.vm_storage_params.nat
  }

  scheduling_policy {
    preemptible = var.vm_storage_params.preemptible
  }

  dynamic "secondary_disk" {
    for_each = yandex_compute_disk.extra_disk
    content {
      disk_id = secondary_disk.value.id
    }
  }

  metadata = local.vm_metadata
}

variable "disk_properties" {
  type = object({
    type = string,
    size = number
  })
  default = {
    type = "network-hdd"
    size = 1
  }
}

variable "vm_storage_params" {
  type = object({
    preemptible = bool
    nat         = bool
  })

  default = {
    preemptible = true
    nat         = true
  }
}
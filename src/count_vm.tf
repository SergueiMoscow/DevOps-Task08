resource "yandex_compute_instance" "web" {
  count      = var.count_web_vm
  depends_on = [yandex_compute_instance.db]

  name     = "web-${count.index + 1}"
  hostname = "web-${count.index + 1}"

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
    subnet_id          = yandex_vpc_subnet.develop.id
    nat                = var.vm_web_params.nat
    security_group_ids = [yandex_vpc_security_group.example.id]
  }

  scheduling_policy {
    preemptible = var.vm_web_params.preemptible
  }

  metadata = local.vm_metadata
}


variable "count_web_vm" {
  type        = number
  default     = 2
  description = "Count vm instances for web"
}

variable "vm_web_resources" {
  type = object({
    cores         = number
    memory        = number
    core_fraction = number
    hdd_size      = number
    hdd_type      = string
  })

  default = {
    cores         = 2
    memory        = 1
    core_fraction = 5
    hdd_size      = 5
    hdd_type      = "network-hdd"
  }
}

variable "vm_web_params" {
  type = object({
    preemptible = bool
    nat         = bool
  })

  default = {
    preemptible = true
    nat         = true
  }
}

locals {
  vm_metadata = {
    serial-port-enable = 1
    ssh-keys           = "${var.vms_ssh_user}:${file("~/.ssh/id_ed25519.pub")}"
  }

  # Для файла for_each-vm.tf
  each_vm = [
    {
      vm_name     = "main"
      cpu         = 4
      ram         = 8
      disk_volume = 100
    },
    {
      vm_name     = "replica"
      cpu         = 2
      ram         = 4
      disk_volume = 50
    }
  ]
}

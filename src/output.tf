output "vm_list" {
  value = flatten([
    [for instance in yandex_compute_instance.web : {
      name = instance.name
      id   = instance.id
      fqdn = instance.fqdn
    }],

    [for instance in yandex_compute_instance.db : {
      name = instance.name
      id   = instance.id
      fqdn = instance.fqdn
    }],

    [{
      name = yandex_compute_instance.storage.name
      id   = yandex_compute_instance.storage.id
      fqdn = yandex_compute_instance.storage.fqdn
    }]
  ])
}
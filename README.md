[Задание](https://github.com/netology-code/ter-homeworks/blob/main/03/hw-03.md)

## [Задание 1](tasks/task1.md)
[Source](src1/) (из копии https://github.com/netology-code/ter-homeworks/tree/main/03/src)

Меняем в providers настройки на доступ по ключу вместо токена:  
![provider](images/image01.png)

Инициализируем `terraform init`  
Выполняем `terraform apply`

Доступ к группам безопасности есть:  
![security groups](images/image02.png)

Входящие правила:
![incoming rules](images/image03.png)

## [Задание 2](tasks/task2.md)
[Source](src2/)

Создаём файл [count_vm.tf](https://terraform-provider.yandexcloud.net/Resources/compute_instance) по `yandex_compute_instance`

Добавляем переменные в [variables.tf](src/variables.tf)

Создаём файл [data.tf](src/data.tf) с образом для создаваемых машин

Добавляем группы безопасности  
![add security groups](images/image04.png)

Создаём файл [for_each-vm.tf](src/for_each-vm.tf)

Добавляем локальную переменную для for_each файла:  
![local variable](images/image06.png)

Виртуальные машины создались:  
![vms created](images/image05.png)

## [Задание 3](tasks/task3.md)

Создаём файл [disk_vm.tf](src/disk_vm.tf)

Запускаем, проверяем:  
![vms created](images/image07.png)

[Commit](https://github.com/SergueiMoscow/DevOps-Terraform-03/commit/44cea5541b9a5ea7e37a81cd2f84550d463795ca)

## [Задание 4](tasks/task4.md)


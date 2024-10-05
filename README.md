[Задание](https://github.com/netology-code/ter-homeworks/blob/main/03/hw-03.md)

## [Задание 1](src/task.md)
[Source](src1/) (из копии https://github.com/netology-code/ter-homeworks/tree/main/03/src)

Меняем в providers настройки на доступ по ключу вместо токена:  
![provider](images/image01.png)

Инициализируем `terraform init`  
Выполняем `terraform apply`

Доступ к группам безопасности есть:  
![security groups](images/image02.png)

Входящие правила:
![incoming rules](images/image03.png)

## [Задание 2](src2/task.md)
[Source](src2/)

Создаём файл [count_vm.tf](https://terraform-provider.yandexcloud.net/Resources/compute_instance) по `yandex_compute_instance`

Добавляем переменные в [variables.tf](src/variables.tf)

Создаём файл [data.tf](src/data.tf) с образом для создаваемых машин

Добавляем группы безопасности  
![add security groups](images/image04.png)


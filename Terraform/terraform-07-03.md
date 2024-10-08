# Домашнее задание к занятию «Подъём инфраструктуры в Yandex Cloud»

### Задание 1

**Выполните действия, приложите скриншот скриптов, скриншот выполненного проекта.**

От заказчика получено задание: при помощи Terraform и Ansible собрать виртуальную инфраструктуру и развернуть на ней веб-ресурс.

В инфраструктуре нужна одна машина с ПО ОС Linux, двумя ядрами и двумя гигабайтами оперативной памяти.

Требуется установить nginx, залить при помощи Ansible конфигурационные файлы nginx и веб-ресурса.

Секретный токен от yandex cloud должен вводится в консоли при каждом запуске terraform.

Для выполнения этого задания нужно сгенирировать SSH-ключ командой ssh-keygen. Добавить в конфигурацию Terraform ключ в поле:

```
 metadata = {
    user-data = "${file("./meta.txt")}"
  }
```

В файле meta прописать:

```

 users:
  - name: user
    groups: sudo
    shell: /bin/bash
    sudo: ['ALL=(ALL) NOPASSWD:ALL']
    ssh-authorized-keys:
      - ssh-rsa  xxx
```

Где xxx — это ключ из файла /home/"name user"/.ssh/id_rsa.pub. Примерная конфигурация Terraform:

В конфигурации Ansible указать:

* внешний IP-адрес машины, полученный из output external_ip_ address_vm_1, в файле hosts;
* доступ в файле plabook *yml поля hosts.

![Запуск вм](https://github.com/bosozu/homeworks/blob/main/Terraform/images/task1-1.png)
![Тестовая страница](https://github.com/bosozu/homeworks/blob/main/Terraform/images/task1-2.png)
[Плейбук](https://github.com/bosozu/homeworks/blob/main/Terraform/playbook-test/0703play.yml)

---

## Дополнительные задания* (со звёздочкой)

Их выполнение необязательное и не влияет на получение зачёта по домашнему заданию. Можете их решить, если хотите лучше разобраться в материале.лнить, если хотите глубже и/или шире разобраться в материале.

### Задание 2*

**Выполните действия, приложите скриншот скриптов, скриншот выполненного проекта.**

1. Перестроить инфраструктуру и добавить в неё вторую виртуальную машину.
2. Установить на вторую виртуальную машину базу данных.
3. Выполнить проверку состояния запущенных служб через Ansible.

![вм1](https://github.com/bosozu/homeworks/blob/main/Terraform/images/task2-1.png)
![вм2](https://github.com/bosozu/homeworks/blob/main/Terraform/images/task2-2.png)

### Задание 3*

Изучите [инструкцию](https://cloud.yandex.ru/docs/tutorials/infrastructure-management/terraform-quickstart) yandex для terraform.
Добейтесь работы паплайна с безопасной передачей токена от облака в terraform через переменные окружения. Для этого:

1. Настройте профиль для yc tools по инструкции.
2. Удалите из кода строчку "token = var.yandex_cloud_token". Terraform будет считывать значение ENV переменной YC_TOKEN.
3. Выполните команду export YC_TOKEN=$(yc iam create-token) и в том же shell запустите terraform.
4. Для того чтобы вам не нужно было каждый раз выполнять export - добавьте данную команду в самый конец файла ~/.bashrc

_Это задание я выполнил, т.к. сразу сделал по гайду яндекса добавление токена и файле main.tf уже отсутствует переменная с токеном_

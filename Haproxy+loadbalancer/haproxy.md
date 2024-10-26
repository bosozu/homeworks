# Домашнее задание к занятию 2 «Кластеризация и балансировка нагрузки»

### Цель задания

В результате выполнения этого задания вы научитесь:

1. Настраивать балансировку с помощью HAProxy
2. Настраивать связку HAProxy + Nginx

---

### Задание 1

- Запустите два simple python сервера на своей виртуальной машине на разных портах
- Установите и настройте HAProxy, воспользуйтесь материалами к лекции по [ссылке](2/)
- Настройте балансировку Round-robin на 4 уровне.
- На проверку направьте конфигурационный файл haproxy, скриншоты, где видно перенаправление запросов на разные серверы при обращении к HAProxy.

[haproxy.cfg](https://github.com/bosozu/homeworks/blob/main/Haproxy+loadbalancer/cfg/haproxy-t1.cfg)
![screen haproxy](https://github.com/bosozu/homeworks/blob/main/Haproxy+loadbalancer/images/task1.png)
![screen loadbalance l4](https://github.com/bosozu/homeworks/blob/main/Haproxy+loadbalancer/images/task1-1.png)

### Задание 2

- Запустите три simple python сервера на своей виртуальной машине на разных портах
- Настройте балансировку Weighted Round Robin на 7 уровне, чтобы первый сервер имел вес 2, второй - 3, а третий - 4
- HAproxy должен балансировать только тот http-трафик, который адресован домену example.local
- На проверку направьте конфигурационный файл haproxy, скриншоты, где видно перенаправление запросов на разные серверы при обращении к HAProxy c использованием домена example.local и без него.

[haproxy.cfg](https://github.com/bosozu/homeworks/blob/main/Haproxy+loadbalancer/cfg/haproxy-t2.cfg)
![balancer](https://github.com/bosozu/homeworks/blob/main/Haproxy+loadbalancer/images/task2.png)
![balancer2](https://github.com/bosozu/homeworks/blob/main/Haproxy+loadbalancer/images/task2-2.png)

---

## Задания со звёздочкой*

Эти задания дополнительные. Их можно не выполнять. На зачёт это не повлияет. Вы можете их выполнить, если хотите глубже разобраться в материале.

---

### Задание 3*

- Настройте связку HAProxy + Nginx как было показано на лекции.
- Настройте Nginx так, чтобы файлы .jpg выдавались самим Nginx (предварительно разместите несколько тестовых картинок в директории /var/www/), а остальные запросы переадресовывались на HAProxy, который в свою очередь переадресовывал их на два Simple Python server.
- На проверку направьте конфигурационные файлы nginx, HAProxy, скриншоты с запросами jpg картинок и других файлов на Simple Python Server, демонстрирующие корректную настройку.

[nginx конфиг, измененный default файл](https://github.com/bosozu/homeworks/blob/main/Haproxy+loadbalancer/cfg/nginx-ts3)
[haproxy.cfg](https://github.com/bosozu/homeworks/blob/main/Haproxy+loadbalancer/cfg/haproxy-t1.cfg)
![img](https://github.com/bosozu/homeworks/blob/main/Haproxy+loadbalancer/images/task3-1.png)
![balancer1](https://github.com/bosozu/homeworks/blob/main/Haproxy+loadbalancer/images/task3-2.png)
![balancer2](https://github.com/bosozu/homeworks/blob/main/Haproxy+loadbalancer/images/task3-2.png)

---

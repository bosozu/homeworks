# Домашнее задание к занятию «Ansible. Часть 1»

#### Задание 1

**Ответьте на вопрос в свободной форме.**

Какие преимущества даёт подход IAC?

_Есть неколько важных пунктов, которые дает IaC подход:_
_1. Быстрое и надежное развертывание инфраструктуры. Код позволяет автоматизировать процесс создания и настройки._
_2. Масштабируемость. С помощью кода можно легко изменять масштаб инфраструктуры._
_3. Воспроизводимость. Инфраструктура всегда идентична_

---

### Задание 2 

**Выполните действия и приложите скриншоты действий.**

1. ![Установка Ansible](https://github.com/bosozu/homeworks/blob/main/Ansible_Part1-Sherbakov_A/images/task2-1.png)
2. ![Настройка ВМ](https://github.com/bosozu/homeworks/blob/main/Ansible_Part1-Sherbakov_A/images/task2-2.png)
3. [inventory.yml](https://github.com/bosozu/homeworks/blob/main/Ansible_Part1-Sherbakov_A/images/task2-3.png)
4. ![Модуль Ping](https://github.com/bosozu/homeworks/blob/main/Ansible_Part1-Sherbakov_A/images/task2-4.png)
 
---

### Задание 3 

**Ответьте на вопрос в свободной форме.**

Какая разница между параметрами forks и serial? 

_Параметр forks настраивается в файле ansible.cfg и управляет количеством задач, которое можно выполнить с управляющего хоста._
_Параметр serial используется в плейбуке и задает количество хостов, которое выполнит задачу одновременно.т.е если например будет_
_6 хостов а значение serial будет 3, то ansible выполнит задачу сначала на 3 хостах потом еще раз на 3 других_
---

### Задание 4 

В этом задании вы будете работать с Ad-hoc коммандами.

**Выполните действия и приложите скриншоты запуска команд.**

1. ![Установка пакета](https://github.com/bosozu/homeworks/blob/main/Ansible_Part1-Sherbakov_A/images/task4-1.png)
2. ![Проверка сервиса](https://github.com/bosozu/homeworks/blob/main/Ansible_Part1-Sherbakov_A/images/task4-2.png) 
3. ![Создание файла](https://github.com/bosozu/homeworks/blob/main/Ansible_Part1-Sherbakov_A/images/task4-31.png)
   ![](https://github.com/bosozu/homeworks/blob/main/Ansible_Part1-Sherbakov_A/images/task4-32.png) 

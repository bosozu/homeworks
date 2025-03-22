# Домашнее задание к занятию 4 «Оркестрация группой Docker контейнеров на примере Docker Compose».Щербаков Артем

## Задача 1

Порядок команд в bash

```bash
vim index.html
docker pull nginx:1.21.1
vim Dockerfile
docker build -t custom_nginx .
docker run -d -p 80:80 -v $(pwd)/index.html:/usr/share/nginx/html/index.html --name my-nginx custom-nginx
```

```html
<html>
<head>
Hey, Netology
</head>
<body>
<h1>I will be DevOps Engineer!</h1>
</body>
</html>
```

```docker
FROM nginx:1.21.1

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
```

Результат:
![task1](https://github.com/bosozu/homeworks/blob/main/docker/images/task1.png)

## Задача 2

Результат:
![task2](https://github.com/bosozu/homeworks/blob/main/docker/images/task2.png)

## Задача 3

Для подключения к потоку ввода/вывода ошибок контенейра можно использовать docker attach <name_container>.При выходе из docker attach контейнер остановился из за того что что мы подключаемся к процессу контейнера и при выходе через ctrl+C посылается сигнал SIGINT который прерывает процесс
возникла проблема с портами и nginx перестал быть виден, т.к. мы прокинули порт 8080 на 80 порт в контейнере. а у nginx стандартный порт изменили на 81 и поэтому nginx стал недоступен

![3-1](https://github.com/bosozu/homeworks/blob/main/docker/images/task3-1.png)
![3-2](https://github.com/bosozu/homeworks/blob/main/docker/images/task3-2.png)
![3-3](https://github.com/bosozu/homeworks/blob/main/docker/images/task3-3.png)
![3-4](https://github.com/bosozu/homeworks/blob/main/docker/images/task3-4.png)
![3-5](https://github.com/bosozu/homeworks/blob/main/docker/images/task3-5.png)

## Задача 4

![4](https://github.com/bosozu/homeworks/blob/main/docker/images/task4.png)

## Задача 5

1. Был запущен файл compose.yaml потому что для docker compose в последней версии это название файла является дефолтным и при запуске docker compose он будет выполнять инструкции из этого файла

2. Содержимое файла compose.yaml стало таким:

```docker
version: "3"
include:
  - docker-compose.yaml
services:
  portainer:
    network_mode: host
    image: portainer/portainer-ce:latest
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
    depends_on:
      - registry

```

3. ![5-1](https://github.com/bosozu/homeworks/blob/main/docker/images/task5-1.png)
6. ![5-2](https://github.com/bosozu/homeworks/blob/main/docker/images/task5-2.png)
7. ![5-3](https://github.com/bosozu/homeworks/blob/main/docker/images/task5-3.png)

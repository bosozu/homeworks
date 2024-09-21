# Домашнее задание к занятию «GitLab»

---

### Задание 1

**Что нужно сделать:**

1. Разверните GitLab локально, используя Vagrantfile и инструкцию, описанные в [этом репозитории](https://github.com/netology-code/sdvps-materials/tree/main/gitlab).
2. Создайте новый проект и пустой репозиторий в нём.
3. Зарегистрируйте gitlab-runner для этого проекта и запустите его в режиме Docker. Раннер можно регистрировать и запускать на той же виртуальной машине, на которой запущен GitLab.

В качестве ответа в репозиторий шаблона с решением добавьте скриншоты с настройками раннера в проекте.

![Runner](https://github.com/bosozu/homeworks/blob/main/Gitlab/images/task1-1.png)

---

### Задание 2

**Что нужно сделать:**

1. Запушьте [репозиторий](https://github.com/netology-code/sdvps-materials/tree/main/gitlab) на GitLab, изменив origin. Это изучалось на занятии по Git.
2. Создайте .gitlab-ci.yml, описав в нём все необходимые, на ваш взгляд, этапы.

В качестве ответа в шаблон с решением добавьте:

* файл gitlab-ci.yml для своего проекта или вставьте код в соответствующее поле в шаблоне;
* скриншоты с успешно собранными сборками.

```Gitlab
stages:
  - test
  - build

test:
  stage: test
  image: golang:1.17
  script: 
   - go test .

build:
  stage: build
  image: docker:latest
  script:
   - docker build .
```

![Run job](https://github.com/bosozu/homeworks/blob/main/Gitlab/images/task2-1.png)

---

## Дополнительные задания* (со звёздочкой)

Их выполнение необязательное и не влияет на получение зачёта по домашнему заданию. Можете их решить, если хотите лучше разобраться в материале.

---

### Задание 3*

Измените CI так, чтобы:

* этап сборки запускался сразу, не дожидаясь результатов тестов;
* тесты запускались только при изменении файлов с расширением *.go.

В качестве ответа добавьте в шаблон с решением файл gitlab-ci.yml своего проекта или вставьте код в соответсвующее поле в шаблоне.

```gitlab-ci.yml
stages:
  - test
  - build

test:
  stage: test
  image: golang:1.16
  script: 
   - go test .
  only:
    changes:
      - "*.go"

sonarqube-check:
 stage: test
 image:
  name: sonarsource/sonar-scanner-cli
  entrypoint: [""]
 variables:
 script:
  - sonar-scanner -Dsonar.projectKey=test_pr -Dsonar.sources=. -Dsonar.host.url=http://192.168.0.112:9000 -Dsonar.login=sqp_c3b9b823a74d0986a549418a98ffa8fe38c5ed78

build:
  stage: build
  image: docker:latest
  only:
    - master
  script:
   - docker build .
  when: always

build:
  stage: build
  image: docker:latest
  when: manual
  except:
    - master
  script:
   - docker build .
```

![Run jobs](https://github.com/bosozu/homeworks/blob/main/Gitlab/images/task3-1.png)

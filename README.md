# ITG_GraalVM

Минималистичные образы GraalVM Community Edition для различных версий Java (21, 24, 25), предназначенные для компактного и быстрого запуска Java-приложений, а также сборки нативных образов с помощью GraalVM Native Image.

## Содержание

- [Описание](#описание)
- [Структура репозитория](#структура-репозитория)
- [Dockerfile'ы](#dockerfileы)
- [Инструкция по сборке](#инструкция-по-сборке)
- [Публикация образов](#публикация-образов)
- [Использование](#использование)
- [Сборка нативных образов](#сборка-нативных-образов)
- [Контакты](#контакты)

## Описание

Этот репозиторий содержит Dockerfile'ы и вспомогательные скрипты для создания минимальных образов GraalVM CE, а также инструменты для сборки нативных приложений с использованием musl и UPX. Основная цель — предоставить легковесные и быстрые образы для запуска и сборки Java-приложений.

## Структура репозитория

- `Dockerfile` — основной Dockerfile для самой свежей версии GraalVM (Labs OpenJDK 25).
- `Dockerfile.graalvm-21` — Dockerfile для GraalVM CE на базе OpenJDK 21.
- `Dockerfile.graalvm-24` — Dockerfile для GraalVM CE на базе OpenJDK 24.
- `NativeBuild` — Dockerfile для сборки нативных образов с musl и UPX.
- `ce` — конфигурационный файл для сборки GraalVM CE.
- `build.sh` — bash-скрипт для сборки и публикации Docker-образов.
- `build.bat` — Windows-скрипт для сборки и публикации Docker-образов.
- `README.md` — этот файл.

## Dockerfile'ы

- **Dockerfile** — собирает минимальный образ GraalVM CE на базе OpenJDK 25.
- **Dockerfile.graalvm-21** — собирает минимальный образ GraalVM CE на базе OpenJDK 21.
- **Dockerfile.graalvm-24** — собирает минимальный образ GraalVM CE на базе OpenJDK 24.
- **NativeBuild** — многоступенчатый Dockerfile для сборки нативных приложений с помощью GraalVM Native Image, musl и UPX.

## Инструкция по сборке

Для сборки всех образов выполните:

```bash
./build.sh
```

или на Windows:

```bat
build.bat
```

Скрипты создадут и опубликуют образы:

- `docker.io/ivantopgaming/mini_graalvm:21`
- `docker.io/ivantopgaming/mini_graalvm:24`
- `docker.io/ivantopgaming/mini_graalvm:latest` (OpenJDK 25)

## Публикация образов

Скрипты автоматически пушат образы в Docker Hub. Для ручной публикации используйте:

```bash
docker push docker.io/ivantopgaming/mini_graalvm:21
docker push docker.io/ivantopgaming/mini_graalvm:24
docker push docker.io/ivantopgaming/mini_graalvm:latest
```

## Использование

Пример запуска контейнера с GraalVM:

```bash
docker run --rm -it docker.io/ivantopgaming/mini_graalvm:21 java -version
```

Для запуска вашего приложения:

```bash
docker run --rm -v $(pwd):/app -w /app docker.io/ivantopgaming/mini_graalvm:24 java -jar your_app.jar
```

## Сборка нативных образов

Для сборки нативного приложения используйте Dockerfile `NativeBuild`. Пример:

1. Поместите ваш JAR-файл в каталог репозитория под именем `your_app.jar`.
2. Соберите образ:

    ```bash
    docker build -f NativeBuild -t your_native_app .
    ```

3. Получите нативный бинарник из контейнера:

    ```bash
    docker cp $(docker create your_native_app):/app/your_app ./your_app
    ```

## Контакты

Автор: [ivantopgaming](https://github.com/ivantopgaming)

Вопросы и предложения — через Issues или Pull Requests.

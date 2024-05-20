# Инструкция по управлению кластером

## Определение лидера кластера

1. Определим лидера кластера, выполнив следующую команду:

    ```bash
    docker exec -it demo-patroni1 patronictl list
    ```
#### ex:
| Member   | Host       | Role    | State     | TL | Lag in MB |
|----------|------------|---------|-----------|----|-----------|
| patroni1 | 172.23.0.5 | Replica | streaming |  1 |         0 |
| patroni2 | 172.23.0.2 | Leader  | running   |  1 |           |
| patroni3 | 172.23.0.8 | Replica | streaming |  1 |         0 |

> demo-patroni2 лидер, далее demo-patroni-leader
 


## Создание пользователей и базы данных

1. Создаём роль "user" с паролем "password":

    ```bash
    docker exec -it demo-patroni-leader psql -U postgres -c "CREATE ROLE \"user\" WITH LOGIN PASSWORD 'password';"
    ```

2. Создаём базу данных с владельцем "user":

    ```bash
    docker exec -it demo-patroni-leader psql -U postgres -c "CREATE DATABASE patroni OWNER \"user\";"
    ```

3. Создаём роли "reader", "writer" и "no_login_group":

    ```bash
    docker exec -it demo-patroni-leader psql -U postgres -c "CREATE ROLE reader;"
    docker exec -it demo-patroni-leader psql -U postgres -c "CREATE ROLE writer;"
    docker exec -it demo-patroni-leader psql -U postgres -c "CREATE ROLE no_login_group;"
    ```
> тут роли создаются согласно логике моей основной бд


## Восстановление резервной копии

1. Копируем файл с бэкапом с основной бд локально:
    ```bash
    docker cp db:/tmp/twich_backup.dump ./twich_backup.dump                
    ```
2. Копируем файл резервной копии из локальной машины в контейнер "demo-patroni-leader":

    ```bash
    docker cp ./twich_backup.dump demo-patroni-leader:/tmp/twich_backup.dump
    ```

3. Восстановливаем данные из резервной копии:

    ```bash
    docker exec -i demo-patroni-leader pg_restore -U user -d patroni /tmp/twich_backup.dump
    ```

## Проверка

1. Выполняем следующую команду, чтобы проверить таблицы в реплике:

    ```bash
    docker exec -it demo-patroni-leader psql -U postgres -d patroni -c "SELECT table_name FROM information_schema.tables WHERE table_schema = 'public' AND table_type = 'BASE TABLE';"
    ```

## <p align="center">готово👋 👍</p>

## Пример реализации html (CRUD), json, api и токен авторизации.
### Использование

Установка и настройка бд.

```sh
$ rails db:migrate
$ rails db:seed
```

### Линки

Для доступа по html

| описание | ссылка |
| ------ | ------ |
| выдача списка товаров с суммой за период | /html_sales |
| список товаров. стандартный CRUD  | /goods |
| выводит список дней для определенного товара | /goods/:id/days |
| выдача по товара по json | /sales?from=2017-03-01&to=2017-03-02 |

Для доступа к api после авторизации

    1. создать пользователя с уникальным email
     > POST /users
          {
            "user": 
              {
                "email": "", 
                "password": "",
                "password_confirmation": ""
              }
          }
    2. Получить токен
        > POST /user_token 
            {
                "auth": 
                  {
                    "email": "", 
                    "password": "",
                    "password_confirmation": ""
                  }
            }
    3. Проверить статус авторизации
        > GET /users
    4. После авторизации получаете доступ к API с реализацией CRUD c ответом json
        > /api_goods


## Пример реализации html (CRUD), json, api и токен авторизации.
### Использование

Установка и настройка бд.

```sh
$ rails db:migrate
$ rails db:seed
```

##### Линки

Для доступа по html

| html | link |
| ------ | ------ |
| выдача списка товаров с суммой за период | [/html_sales][PlDb] |
| список товаров. стандартный CRUD  | [/goods][PlGh] |
| выводит список дней для определенного товара | [/goods/:id/days][PlGd] |
| выдача по товара по json | [/sales?from=2017-03-01&to=2017-03-02][PlGd] |

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
    4. После авторизации получаете доступ к API с реализацией CRUD
        > /api_goods


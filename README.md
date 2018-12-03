Пример реализации html (CRUD), json и токен авторизации.
После загрузки репозитория нужно сделать.
'''sh
$  rails db:migrate
$  rails db:seed

Использование
html:
  /html_sales - выдача списка товаров с суммой за период
  /goods - список товаров. стандартный CRUD 
  /goods/:id/days - выводит список дней для определенного товара 
json:
  /sales?from=2017-03-01&to=2017-03-02  - выдаёт товары с суммой за период в json

Авторизация по API (рекомендую Postman):
1. создание пользователя

POST /users .. ввидится email и пароль в формате
  {
    "user": 
      {
        "email": "", 
        "password": "",
        "password_confirmation": ""
      }
  }
если email уникальный и пользователь создан успешно, то будет ответ в формате json
2. Получить токен
POST /user_token
{
    "auth": 
      {
        "email": "", 
        "password": "",
        "password_confirmation": ""
      }
  }
3. Проверить статус авторизации вставив токен куда надо :)
GET /users

4. После авторизации получаете доступ к
/api_goods - ответы в формате json
1

# RoR juniors pseudo application

Чтобы запустить приложение, необходимо установить **redis-server**:
```
sudo -i
```
```
apt-get update
```
```
apt-get upgrade
```
```
apt-get install redis-server
```
и гем [mailcatcher](http://mailcatcher.me):
```
gem install mailcatcher
```
**Ни в коем случае не пишите `gem 'mailcatcher` в `Gemfile`!**

Затем регистрируемся на [GitHub](https://github.com), форкаем себе этот репозиторий и клонируем. Здесь приведен код для **этого** репозитория, у вас будет другой.
```
git clone git@github.com:Vassiliy/ror_app.git
```
Затем
```
cd config
nano database.yml
```
и вставляем туда
```
# SQLite version 3.x
#   gem install sqlite3
#
#   Ensure the SQLite 3 gem is defined in your Gemfile
#   gem 'sqlite3'
development:
  adapter: sqlite3
  database: db/development.sqlite3
  pool: 5
  timeout: 5000

# Warning: The database defined as "test" will be erased and
# re-generated from your development database when you run "rake".
# Do not set this db to the same as development or production.
test:
  adapter: sqlite3
  database: db/test.sqlite3
  pool: 5
  timeout: 5000

production:
  adapter: sqlite3
  database: db/production.sqlite3
  pool: 5
  timeout: 5000
```
Далее собираем наше приложение:
```
bundle
```
```
rake db:create
```
```
rake db:migrate
```
и готовим его к запуску в полном обвесе — запускаем `mailcatcher` (в консоли с `sudo -i`, конечно):
```
mailcatcher
```
Потом там же можно будет запустить `rails c` и быстро создать набор данных для нашего приложения:
```ruby
User.create_user(3)
```
```ruby
Post.create_post(10)
```
Числа могут быть произвольные, это количества создаваемых сущностей.

Затем открываем в терминале еще одну вкладку с `sudo -i` и запускаем там
```
rails s
```
Затем еще одну такую же вкладку и запускаем там `resque`:
```
rake resque:work QUEUE=*
```
В браузере открываем
```
localhost:3000
```
```
localhost:1080
```
и
```
localhost:3000/resque
```
Убеждаемся, что все работает.

## =))

Чтобы иметь возможность работать с репозиторием на GitHub, нужно будет выполнить все необходимые действия из [гайда по SSH-ключам](https://help.github.com/articles/generating-ssh-keys).

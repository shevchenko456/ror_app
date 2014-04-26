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

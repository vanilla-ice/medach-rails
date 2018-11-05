# medach_new

## Setup

1. Clone repo
    ```
    $ git clone https://github.com/vanilla-ice/medach-rails.git
    ```
2. Install ruby v2.4.1, postgres v9.6+, yarn v1.0+
3. Copy and edit database config 
    ```
    $ cp config/database.sample.yml config/database.yml
    ```
4. Install project gems
    ```
    $ bundle install
    ```
5. Prepare database
    - create databases
      ```
      $ rails db:create:all
      ```
    - [optional] restore from [dump](http://rgho.st/8qB5rLlHl)
      ```
      $ psql -U myuser -h localhost medach_development < /path/to/dump.sql 
      ```
    - run migrations & seeds
      ```
      $ rails db:migrate db:seed
      ```
    
6. Build client side
    ```
    $ yarn
    ```

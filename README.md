# medach_new

## Setup

1. Install ruby v2.4.1, postgres v9.6+, yarn v1.0+
2. Copy and edit database config 
    ```
    $ cp config/database.sample.yml config/database.yml
    ```
3. Install project gems
    ```
    $ bundle install
    ```
4. Prepare database
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
    
5. Build client side
    ```
    $ yarn
    ```

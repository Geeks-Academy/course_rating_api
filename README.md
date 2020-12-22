## Quick startup


### Commitlint configuration:

Install Node.js on your machine [Node via package manager](https://nodejs.org/en/download/package-manager/)

After that in root directory run command in terminal ```npm install``` to install dependencies.

Your commit message should contain PREFIX: FRDQ, ID as a number, and SUBJECT.
Example: ```"RAGC-21 - Your commit message"```



### For docker (linux)

Allows you to quick setup development environment

- Setup host configuration
    - First, you have to create `.env` file from `.env.example`
    - Configure `.env` variables
        ```
        ###> docker/app ###
        # Set a dev env to start the server in development mode
        APP_ENV=dev

        # Set your host user id (Linux/MacOS)
        USER_ID=1000
        ###< docker/app ###
      
        ###> docker/mysql ###
        # Set the database user name
        MYSQL_USER=user

        # Set the database name
        MYSQL_DATABASE=database

        # Set the database user password
        MYSQL_PASSWORD=pass

        # Set the database password for the CLI usage
        MYSQL_ROOT_PASSWORD=pass

        # It should be untouched if its running in docker
        MYSQL_HOST=database:3306
        ###< docker/mysql ###
      
        ###> docker/dev ###
        # Set a port where the app should be served on your localhost
        APP_PORT=8080

        # Set a port where the database should be served on your localhost
        DB_PORT=3310
        ###< docker/dev ###
        ```

- Build images using
    ```
    ./scripts/build.sh --env dev [--skip-migrations] [--skip-composer] [container]
    ```
  
- Start development server
    ```
    ./scripts/start.sh --env dev [container]
    ```
    > Website will be available on `localhost:APP_PORT` (host).

- Access container environment
    - If it's running
      ```
      ./scripts/shell.sh api
      ```

    - If it's not running (without database access)
      ```
      ./scripts/shell.sh --boot [--env value] api
      ```

    > If you want to stop the server, type
      `docker-compose stop` on your host machine.


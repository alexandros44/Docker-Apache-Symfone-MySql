# Docker Apache Symfony MySql

This repository is a guide on how to initialize a **Symfony**, **MySql** project inside a **Docker** container
using **APACHE server**.

## Table Of Content

- [Description](description)
- [Start Project](start-project)
    - [Run Symfony](run-symfony)
    - [Add Symfony Libraries](add-symfony-libraries)
    - [Add Database](add-database)
- [Understand Project]()
    - [Create Dockerfile](create-dockerfile)
    - [Create Docker-Compose](create-docker-compose)
    - [Understand vhost.conf](understand-vhost.conf)
    - [Create Symfony App](create-symfony-app)
    - [Vendor Volumes](vendor-volumes)
    - [Add Database](add-database)
- [Conclusion](conclusion)

## Description

In the markdown file you will find out how to install all of the technologies mentioned above. Also you will find out how to run everything with just `3 commands` and you will hopefully understand how everything works. From the Apache server to the Docker container.

## Start Project

#### Run Symfony

First of all you need to clone the `repository`,
```bash
clone https://github.com/alexandros44/Docker-Apache-Symfone-MySql.git
```
After cloning the repository you need to check if you have docker hub install on your computer. Run this command to make sure you have docker installed,

```bash
docker -v
```

The last step is to navigate into the project director and execute the following command,
```bash
docker-compose up -d --build
```

Everything is now running! Go to `http://localhost:8080` and check it out.

#### Add Symfony Libraries

If you want to add more libraries you just need to connect to the running container and use composer to install them. In order to connect to the container you need to execute this command,
```bash
docker exec -it php-container /bin/bash
```

You are in the container! Now you can install all your packages using **composer**.

#### Add Database

If you want to add your own database you just need to modify the `db_name` in the `.env` file. (Line 26)

You can look at [symfony doctrine](https://symfony.com/doc/current/doctrine.html) in order to set up your database correctly.

## Understand Project

If you want to understand the Project we need to start from scratch. Lets assume that we dont have anything, we start from an empty folder.

#### Create Dockerfile

1. Inside the **Dockerfile** we start by specifying the image that we are going to use. 
2. After that we will need to download **composer**.
3. Last step is to copy everything inside the **container**.

##### Optional

4. Change the working dir to **/var/www/html/app**.
5. Download all the necessary libraries.

#### Create Docker-Compose

The docker-composer as we can see has three services.

1. `PHP service`, main Symfony applicaiton.
2. `SQL service`, database.
3. `Adminer`, fancy way of database.

You can also add more containers like a `NodeJs` container for making the frontend.

Every container is connected to the same virtual network, that is why we can create the connection to the database with just calling the service container name. For more information about docker networking you look
here: https://docs.docker.com/network/

#### Understand vhost.conf

Inside the `vhost.conf` we simply specify the container where to look for the index.php file. The defult path is `/var/www/html`.

We just change the path to `{APACHE_DOCUMENT_ROOT}` which is an environmental variable. We can find the value of that variable inside the docker-compose file. (hint=`/var/www/html/app/public`)

#### Create Symfony App

To create the Symfony app first we need to connect to the php-service container. We can do with this command:
```bash
docker exec -it php-service /bin/bash
```

After we connect run `composer --help` to find out if everything is install correctly. If everything is set up run inside the container:
```bash
container create-project symfony/skeleton app
```

When the command finishes you will see the basic skeleton of a `symfony` application.

#### Vendor Volumes

In the php-service we have a volume called vendor.

#### Add Database

In order to set the database you can follow this [guide](https://symfony.com/doc/current/doctrine.html). 

Tip: Instead of using the loopback `127.0.0.1` use the name of the `SQL service`.

## Conclusion

Creating this repository helped me with `Docker`, `Symfony`, `Sql`. There are a lot of things that I still need to understand, but I think that this is a great start.

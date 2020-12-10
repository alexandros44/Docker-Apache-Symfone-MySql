# Docker Apache Symfony MySql

This repository is a guide on how to initialize a **Symfony**, **MySql** project inside a **Docker** container
using **APACHE server**.

## Table Of Content

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

#### Create Docker-Compose

#### Understand vhost.conf

#### Create Symfony App

#### Vendor Volumes


## Conclusion


PHP Database
============

You can see the images generated at [Docker hub](https://hub.docker.com/repository/docker/3lever/php)

**What is missing?**
- [ ] it's missing to create GitHub actions to publish docker images on GitHub actions
- [ ] create someway to chose which database will be built (postgres, mysql, sql server ....)

**What there is in the image**
- PHP
- Composer
- Postgresql extensions
- Zip
- Intl

**Command  to build the image.**

```shell
docker build --build-arg PHP_VERSION=8.1-fpm --tag 3lever/php:8.1-fpm-postgresql .
```
PHP Docker image
============

[![Check new releases](https://github.com/3lever/php/actions/workflows/check_docker_hub_releases.yml/badge.svg)](https://github.com/3lever/php/actions/workflows/check_docker_hub_releases.yml)
[![Publish image on docker hub](https://github.com/3lever/php/actions/workflows/publish_docker_hub.yml/badge.svg)](https://github.com/3lever/php/actions/workflows/publish_docker_hub.yml)

You can see the images generated at [Docker hub](https://hub.docker.com/r/shieldwalll/php)

**What is there in default images**
- PHP
- Composer
- Postgresql extensions (check the postgresql tags)
- mysql extensions (check the mysql tags)
- Zip
- Intl

**What is there in dev images**
 - All from default images
 - xdebug
 - git
 - wget
 - docker
 - heroku cli
 - Node, yarn ( it'll help fullstack projects.)
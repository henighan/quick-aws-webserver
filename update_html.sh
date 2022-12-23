#!/usr/bin/env bash

echo 'put ./index.html /var/www/html/index.nginx-debian.html' | sftp -i mykey "ubuntu@$(terraform output --raw domain_name)"
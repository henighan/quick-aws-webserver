#!/usr/bin/env bash

if [ ! -f "mykey" ]; then
    echo "RSA key not found. Generating..."
    ssh-keygen -t rsa -f mykey -N ""
fi

echo "Running terraform init"
terraform init
echo "Running terraform apply"
terraform apply
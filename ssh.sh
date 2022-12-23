#!/usr/bin/env bash
ssh -i mykey "ubuntu@$(terraform output --raw domain_name)"
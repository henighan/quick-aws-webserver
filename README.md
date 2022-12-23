# Quick AWS Webserver

This is my go-to procedure when I want a quick, simple webserver. It uses terraform to spin up a single aws ec2 instance (ie a virtual server), and nginx to serve content from that instance.

Note this only supports http, not https.

## Prerequisites
You will need:

a. An aws account

b. Terraform installed with admin priviliges on your aws account (including the ability to create iam roles and policies).

## Commands
### Create Webserver
```console
$ ./create_webserver.sh # type 'yes' when prompted
```
The domain name will be printed at the end of this command.
This will also create an rsa keypair, used for ssh, if it doesn't already exist.


### Ssh into Webserver
```console
$ ./ssh.sh
```

### Update html File
```console
$ ./update_html.sh
```

### Destroy Webserver
```console
$ ./destroy_webserver.sh
```

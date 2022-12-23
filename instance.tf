resource "aws_key_pair" "mykey" {
  key_name   = "mykey"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}

resource "aws_instance" "example" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"
  key_name      = aws_key_pair.mykey.key_name

  provisioner "file" {
    source      = "remote_script.sh"
    destination = "/tmp/remote_script.sh"
  }
  provisioner "file" {
    source      = "index.html"
    destination = "~/index.html"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/remote_script.sh",
      "sudo sed -i -e 's/\r$//' /tmp/remote_script.sh",  # Remove the spurious CR characters.
      "sudo /tmp/remote_script.sh",
    ]
  }
  connection {
    host        = coalesce(self.public_ip, self.private_ip)
    type        = "ssh"
    user        = var.INSTANCE_USERNAME
    private_key = file(var.PATH_TO_PRIVATE_KEY)
  }

  # the security group
  vpc_security_group_ids = [aws_security_group.allow-ssh-http.id]
}

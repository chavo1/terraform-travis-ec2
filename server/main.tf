resource "aws_instance" "web" {
  ami           = "ami-04169656fea786776"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.chavo_key.id

  connection {
    user        = "ubuntu"
    private_key = file("id_rsa")
    host        = self.public_ip
  }

  provisioner "file" {
    source      = "asset"
    destination = "/tmp"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/asset/setup-web.sh",
      "sudo /tmp/asset/setup-web.sh",
    ]
  }
}

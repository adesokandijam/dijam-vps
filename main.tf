resource "aws_instance" "dijam-vps" {
  tags = {
      Name = "dijam-vps"
  }
  ami = "ami-0015a39e4b7c0966f"
  instance_type = "t2.medium"
  root_block_device {
    volume_size = 30
  }
  key_name = aws_key_pair.server_pub_key.id
}

resource "aws_key_pair" "server_pub_key" {
  key_name = "id_rsa"
  public_key = file("/Users/abdulmajidadesokan/.ssh/id_rsa.pub")
}

resource "aws_eip" "lb" {
  instance = aws_instance.dijam-vps.id
  vpc      = true
}
resource "aws_instance" "bastion_host" {
  ami           = "ami-0341d95f75f311023" # Amazon Linux 2023 (us-east-1)
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_subnet.id
  associate_public_ip_address = true

  tags = {
    Name = "BastionHost"
  }
}

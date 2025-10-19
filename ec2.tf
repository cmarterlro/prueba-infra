# Genera una clave privada RSA
resource "tls_private_key" "bastion_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Crea el par de claves en EC2 usando la clave pública
resource "aws_key_pair" "bastion_key_pair" {
  key_name   = "bastion-key"
  public_key = tls_private_key.bastion_key.public_key_openssh
}

# Guarda la clave privada en Parameter Store como SecureString
resource "aws_ssm_parameter" "bastion_private_key" {
  name        = "/bastion/private_key"
  description = "Private key for Bastion Host"
  type        = "SecureString"
  value       = tls_private_key.bastion_key.private_key_pem
}

# Crea la instancia EC2 usando el par de claves generado
resource "aws_instance" "bastion_host" {
  ami                         = "ami-0341d95f75f311023" # Amazon Linux 2023 (us-east-1)
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public_subnet.id
  associate_public_ip_address = true
  key_name                    = aws_key_pair.bastion_key_pair.key_name

  tags = {
    Name = "BastionHost"
  }
}

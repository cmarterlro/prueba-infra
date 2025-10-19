provider "aws" {
  region = "us-east-1" # region
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "mi-bucket-desde-terraform-github" # Debe ser único a nivel global
  acl    = "private"

  tags = {
    Name        = "MiBucket"
    Environment = "Dev"
  }
}

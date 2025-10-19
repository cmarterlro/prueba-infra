provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-bucket-prueba-de-infra54638"

  tags = {
    Name        = "MiBucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-bucket-prueba-infra-${random_id.suffix.hex}"

  tags = {
    Name        = "MiBucket"
    Environment = "Dev"
  }
}

resource "random_id" "suffix" {
  byte_length = 4
}

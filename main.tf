terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "mi-bucket-de-estado"         # ← reemplaza con tu bucket real
    key            = "infra/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock"              # ← reemplaza con tu tabla DynamoDB real
    encrypt        = true
  }
}

provider "aws" {
  region = "us-east-1"
}

# Elimina random_id para evitar cambios en cada ejecución
resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-bucket-prueba-infra"  # ← nombre fijo para evitar recreación

  tags = {
    Name        = "MiBucket"
    Environment = "Dev"
  }
}

provider "aws" {
  access_key = var.ACCESS_KEY
  secret_key = var.SECRET_KEY
  region     = var.aws_region
}

terraform {
 backend "s3" {
 bucket = "ecomap.tfstate"
 key = "terraform.tfstate"
 region = "eu-central-1"
 }
}

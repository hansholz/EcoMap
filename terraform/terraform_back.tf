terraform {
 backend "s3" {
 bucket = "ecomap.tfstate"
 key = "terraform.tfstate"
 region = "eu-central-1"
 }
}

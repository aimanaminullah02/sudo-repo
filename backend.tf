terraform {
  backend "s3" {
    bucket         = "aiman-terraform-backend-bucket-123"
    key            = "envs/dev/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}

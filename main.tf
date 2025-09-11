provider "aws" {
  region = var.aws_region
}

module "app_bucket" {
  source        = "./modules/s3"
  bucket_name   = "aiman-terraform-app-bucket-${var.environment}"
  force_destroy = true
  tags = {
    Environment = var.environment
    Project     = "Terraform-Demo"
  }
}

module "web" {
  source        = "./modules/ec2"
  instance_type = "t2.micro"
  key_name      = var.key_name
  environment   = var.environment
  tags = {
    Environment = var.environment
    Project     = "Terraform-Demo"
  }
}

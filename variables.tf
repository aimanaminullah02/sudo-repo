variable "aws_region" {
  type    = string
  default = "ap-south-1"
}

variable "key_name" {
  type    = string
  default = null # Replace with your SSH key if you want to connect
}

variable "environment" {
  type    = string
  default = "dev"
}

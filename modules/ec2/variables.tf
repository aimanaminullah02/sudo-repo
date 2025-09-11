variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "key_name" {
  type    = string
  default = null
}

variable "environment" {
  type = string
}

variable "tags" {
  type    = map(string)
  default = {}
}

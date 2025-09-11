# Get default VPC
data "aws_vpc" "default" {
  default = true
}

# Get subnets in default VPC
data "aws_subnets" "default_vpc" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

# Security Group
resource "aws_security_group" "web_sg" {
  name        = "web-sg"
  description = "Allow SSH and HTTP"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(var.tags, { Name = "web-sg" })
}

# EC2 Instance
resource "aws_instance" "web" {
  ami           = "ami-002f6e91abff6eb96"
  instance_type = "t3.micro"

  # Pick the first subnet dynamically from default VPC
  subnet_id = element(data.aws_subnets.default_vpc.ids, 0)

  tags = {
    Name        = "web-instance-dev"
    Project     = "Terraform-Demo"
    Environment = "dev"
  }
}



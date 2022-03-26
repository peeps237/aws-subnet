# Set terraform and provider version
terraform {
  required_version = ">= 1.0.11"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.1.0"
    }
  }
}

locals {
  subnet_name = format("vpc-etrz-%s-%s-%s", var.m_environment_tag, var.m_app_name, random_id.subnet.id)
}

resource "random_id" "subnet" {
  byte_length = 3
}

resource "aws_subnet" "main" {
  vpc_id                  = var.m_vpc_id
  cidr_block              = var.m_cidr_block
  availability_zone       = var.m_availability_zone
  map_public_ip_on_launch = var.m_map_public_ip_on_launch

  tags = { Name = local.subnet_name }
}

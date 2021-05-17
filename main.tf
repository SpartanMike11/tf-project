provider "aws" {}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}


resource "aws_vpc" "primary" {
    cidr_block = "192.168.0.0/16"
    tags = {
      Name = "primary"
    }
}

resource "aws_subnet" "main" {
  vpc_id = aws_vpc.primary.id
  cidr_block = "192.168.0.0/24"
  tags = {
    Name = "Main"
  }

}
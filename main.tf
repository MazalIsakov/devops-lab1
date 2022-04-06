terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-west-2"
}

# Create a VPC
resource "aws_vpc" "Mazal" {
  cidr_block = "192.168.7.0/24"
}

########sebnet_web########
resource "aws_subnet" "subnet_web" {
  vpc_id     = aws_vpc.Mazal.id
  cidr_block = "192.168.7.0/27"
}

########subnet_app########
resource "aws_subnet" "subnet_app" {
  vpc_id     = aws_vpc.Mazal.id
  cidr_block = "192.168.7.32/27"
}

########subnet_db########
resource "aws_subnet" "subnet_db" {
  vpc_id     = aws_vpc.Mazal.id
  cidr_block = "192.168.7.64/28"
}

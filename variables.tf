variable "vpc_cidr" {
  default     = "10.0.0.0/16"
  description = "The CIDR block for the VPC"
}

variable "public_subnet_cidr1" {
  default     = "10.0.1.0/24"
  description = "CIDR block for public subnet 1"
}

variable "public_subnet_cidr2" {
  default     = "10.0.2.0/24"
  description = "CIDR block for public subnet 2"
}

variable "private_subnet_cidr1" {
  default     = "10.0.3.0/24"
  description = "CIDR block for private subnet 1"
}

variable "private_subnet_cidr2" {
  default     = "10.0.4.0/24"
  description = "CIDR block for private subnet 2"
}

variable "region" {
  default = "eu-west-1"
}

variable "instance_count" {
  default = 1
}

variable "image_id" {
  default = "ami-0ea0f26a6d50850c5"
}

variable "ssh_key_pair" {
  default = "firstEC2instancekeypair"
}

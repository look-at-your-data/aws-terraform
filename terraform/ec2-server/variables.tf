variable "aws_region" {
  default     = "ap-southeast-2"
  description = "AWS Region"
}

variable "provision_role_arn" {
  default     = "arn:aws:iam::NNNNN:role/RoleName"
  description = "Provision Role ARN for sts assume role"
}

variable "default_vpc" {
  default     = "vpc-nnnn"
  description = "Default VPC to provision infra in"
}

variable "vpc_cidr_blocks" {
  default     = ["10.0.0.0/23"]
  description = "VPC CIDR Blocks."
}

variable "vpc_subnet_list" {
  default     = ["subnet-nnn1", "subnet-nnn2", "subnet-nnn3"]
  description = "List of subnets in default VPC."
}

variable "tag_owner" {
  default     = "TW Data University"
  description = "AWS Resource Tag for Owner"
}

variable "tag_identifier" {
  default     = "TWDU"
  description = "AWS Resource Tag for Identifier"
}

variable "twdu_server_instance_profile" {
  default     = "arn:aws:iam::NNNN:instance-profile/TWDUServerInstanceProfile"
  description = "EC2 Instance Profile ARN for that will be applied to TWDU server"
}

variable "twdu_server_default_ec2_key_name" {
  default     = "NNN"
  description = "Default EC2 Key Pair Name for TWDU server"
}

variable "twdu_server_default_security_group" {
  default     = "NNNN"
  description = "Default Security Group for TWDU server"
}

variable "twdu_server_instance_type" {
  default     = "t2.micro"
  description = "EC2 Instance Type for TWDU server"
}

variable "twdu_server_userdata_file" {
  default     = "NNNN"
  description = "Userdata file for TWDU Server Instance"
}

variable "ec2_key_pair" {
  default     = "NNNN"
  description = "Ec2 Key Pair TWDU Server Instance"
}


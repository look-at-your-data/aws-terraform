variable "aws_region" {
  default     = "ap-southeast-2"
  description = "AWS Region"
}

variable "provision_role_arn" {
  #default     = "arn:aws:iam::NNNN:role/NNNN"
  description = "Provision Role ARN for sts assume role"
}

variable "vpc_cidr_blocks" {
  default     = ["10.0.0.0/8"]
  description = "VPC CIDR Blocks."
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
  #default     = "arn:aws:iam::NNNN:policy/NNNNN"
  description = "EC2 Instance Profile ARN for that will be applied to TWDU server"
}

variable "twdu_server_default_ec2_key_name" {
  default     = "tw-dataeng-melbourne-fall-2020"
  description = "Default EC2 Key Pair Name for TWDU server"
}

variable "twdu_server_instance_type" {
  default     = "t2.micro"
  description = "EC2 Instance Type for TWDU server"
}

variable "twdu_server_userdata_file" {
  default     = "user_data.sh"
  description = "Userdata file for TWDU Server Instance"
}

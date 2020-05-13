provider "aws" {
  region = "${var.aws_region}"
  assume_role {
    role_arn     = "${var.provision_role_arn}"
    session_name = "ec2_provision"
    external_id  = "EXTERNAL_ID"
  }
}

# Only allow following inbound from TW Network:
# Port 22 - SSH Access
resource "aws_security_group" "twdu_server_sg" {
  name_prefix = "twdu-server-sg-"
  description = "Allow only few inbound traffic from 10.0.0.0/8 and all outbound to 0.0.0.0/0"
  vpc_id      = "${var.default_vpc}"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = "${var.vpc_cidr_blocks}"
    description = "Allow SSH access"
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
    description     = "Allow all outbound access"
  }

  tags {
    Owner       =   "${var.tag_owner}"
    Identifief  =   "${var.tag_identifier}"
  }
}

data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["NNNNN"]
  }
}

resource "aws_instance" "ec2_server" {
  ami                    = "${data.aws_ami.amazon_linux_2.image_id}"
  instance_type          = "${var.twdu_server_instance_type}}"
  vpc_security_group_ids = ["${aws_security_group.twdu_server_sg.id}"]
  subnet_id              = "${var.vpc_subnet_list[0]}"
  key_name               = "${var.ec2_key_pair}"

  tags {
    Owner       =   "${var.tag_owner}"
    Identifief  =   "${var.tag_identifier}"
  }
}

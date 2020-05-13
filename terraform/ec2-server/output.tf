output "twdu_server_sg_id" {
  value = "${aws_security_group.twdu_server_sg.id}"
}

output "twdu_server_sg_name" {
  value = "${aws_security_group.twdu_server_sg.name}"
}

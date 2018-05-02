output "aws_elb" {
  value = "${aws_elb.simple_service_elb.arn}"
}

output "aws_iamrole_name" {
  value = "${aws_iam_role.ecs_service_role.arn}"
}

output "aws_iamrole_id" {
  value = "${aws_iam_role.ecs_service_role.id}"
}

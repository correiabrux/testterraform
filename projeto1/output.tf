output "aws_vpc" {
  value = "${module.vpc.aws_vpc_id}"
}

output "aws_subnet" {
  value = "${module.subnet.aws_subnet}"
}

output "s3_site" {
  value = "${module.s3.bucket_site_id}"
}

output "s3_site_domainname" {
  value = "${module.s3.bucket_site_domainname}"
}

output "aws_ecs_cluster_id" {
  value = "${module.ecs_cluster.aws_ecs_cluster_id}"
}

output "taskdefinition" {
  value = "${module.ecs_taskdefinition.taskdefinition_arn}"
}

output "sg_id" {
  value = "${module.security_group.sg_id}"
}

output "aws_elb" {
  value = "${module.aws_elb.aws_elb}"
}

output "iam_ecs_role" {
  value = "${module.iam_ecs_role.aws_iamrole_name}"
}

output "aws_iamrole_id" {
  value = "${module.iam_ecs_role.aws_iamrole_id}"
}

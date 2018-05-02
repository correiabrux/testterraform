resource "aws_ecs_service" "app" {
  name            = "${var.name}"
  cluster         = "${var.cluster}"
  task_definition = "${var.task_definition}"
  desired_count   = 1
  launch_type     = "FARGATE"

#  iam_role = "${var.iam_role_arn}"

  network_configuration {
    security_groups = ["${var.security_groups_ids}"]
    subnets         = ["${var.subnets_ids}"]
  }

  load_balancer {
    target_group_arn = "${var.elb_id}"
    container_name   = "web"
    container_port   = "80"
  }
}

resource "aws_ecs_task_definition" "service" {
  family = "${var.family}"

  container_definitions    = "${file("task-definitions/service.json")}"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = "256"
  memory                   = "512"
}

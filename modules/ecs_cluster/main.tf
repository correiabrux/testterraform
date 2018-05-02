resource "aws_ecs_cluster" "app" {
  name = "${var.clustername}"
}

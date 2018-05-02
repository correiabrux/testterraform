resource "aws_elb" "simple_service_elb" {
  name            = "${var.elbname}"
  subnets         = ["${var.subnets_ids}"]
  security_groups = ["${var.security_groups_ids}"]

  listener {
    instance_port     = "${var.instance_port}"
    instance_protocol = "http"
    lb_port           = "${var.lb_port}"
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    target              = "${var.target_healthcheck}"
    interval            = 15
    timeout             = 5
  }
}

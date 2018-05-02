resource "aws_security_group" "sg" {
  name        = "${var.sgname}"
  description = "${var.sgname}"
  vpc_id      = "${var.vpc_id}"

  ingress {
    from_port   = "${var.from_port}"
    to_port     = "${var.to_port}"
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${lookup(var.tags, "Name")}"
    Env  = "${lookup(var.tags, "Env")}"
  }
}

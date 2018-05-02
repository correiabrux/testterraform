resource "aws_subnet" "main" {
  vpc_id                  = "${var.vpc_id}"
  cidr_block              = "${var.cidr}"
  map_public_ip_on_launch = true

  tags = {
    Name = "${lookup(var.tags, "Name")}"
    Env  = "${lookup(var.tags, "Env")}"
  }
}

resource "aws_vpc" "main" {
  cidr_block           = "${var.cidr}"
  enable_dns_hostnames = "${var.enable_dns_hostnames}"
  enable_dns_support   = "${var.enable_dns_support}"

  tags = {
    Name = "${lookup(var.tags, "Name")}"
    Env  = "${lookup(var.tags, "Env")}"
  }
}

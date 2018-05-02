provider "aws" {
  profile                 = "default"
  shared_credentials_file = "~/.aws/config"
  region                  = "${var.region}"
}

# Do not possible to use variable in this block
terraform {
  required_version = ">= 0.11.7"

  backend "s3" {
    bucket = "terraform-state-test"
    key    = "projeto1/terraform.tfstate"
    region = "us-east-1"
  }
}

module "vpc" {
  source = "../modules/vpc"
  cidr   = "${var.cidr}"

  tags = {
    Name = "${lookup(var.tags, "Name")}"
    Env  = "${lookup(var.tags, "Env")}"
  }
}

module "vpc_ig" {
  source = "../modules/vpc_ig"
  vpc_id = "${module.vpc.aws_vpc_id}"

  tags = {
    Name = "${lookup(var.tags, "Name")}"
    Env  = "${lookup(var.tags, "Env")}"
  }
}

module "subnet" {
  source = "../modules/subnet"
  cidr   = "${var.cidr}"
  vpc_id = "${module.vpc.aws_vpc_id}"

  tags = {
    Name = "${lookup(var.tags, "Name")}"
    Env  = "${lookup(var.tags, "Env")}"
  }
}

module "s3" {
  source      = "../modules/s3"
  bucket_site = "${var.bucket_site}"

  tags = {
    Name = "${lookup(var.tags, "Name")}"
    Env  = "${lookup(var.tags, "Env")}"
  }
}

module "s3_object" {
  source = "../modules/s3_object"
  bucket = "${module.s3.bucket_site_id}"
  upfile = "${var.upfile}"
}

module "cloudfront_s3_origin" {
  source     = "../modules/cloudfront_s3_origin"
  domainname = "${module.s3.bucket_site_domainname}"
  origin_id  = "${module.s3.bucket_site_domainname}"
}

module "security_group" {
  source    = "../modules/security_group"
  sgname    = "${var.sgname}"
  vpc_id    = "${module.vpc.aws_vpc_id}"
  from_port = "${var.from_port}"
  to_port   = "${var.to_port}"

  tags = {
    Name = "${lookup(var.tags, "Name")}"
    Env  = "${lookup(var.tags, "Env")}"
  }
}

module "aws_elb" {
  source              = "../modules/elb"
  elbname             = "${var.elbname}"
  subnets_ids         = "${module.subnet.aws_subnet}"
  security_groups_ids = "${module.security_group.sg_id}"
  instance_port       = 80
  lb_port             = 80
  target_healthcheck  = "HTTP:80/"
}

module "iam_ecs_role" {
  source  = "../modules/iam_ecs_role"
  iamname = "${var.iamname}"
}

module "iam_role_policy" {
  source = "../modules/iam_role_policy"
  iamid  = "${module.iam_ecs_role.aws_iamrole_id}"
}

module "ecs_cluster" {
  source      = "../modules/ecs_cluster"
  clustername = "${var.clustername}"
}

module "ecs_taskdefinition" {
  source                     = "../modules/ecs_taskdefinition"
  container_definitions      = "${file("task-definitions/service.json")}"
  family                     = "${var.familyservice}"
  volume_name                = "${var.volume_name}"
  placement_constraints_type = "${var.placement_constraints_type}"
  az1                        = "${var.az1}"
  az2                        = "${var.az2}"
}

module "ecs_service" {
  source              = "../modules/ecs_service"
  name                = "${var.ecsname}"
  containername       = "${var.ecsname}"
  cluster             = "${module.ecs_cluster.aws_ecs_cluster_id}"
  task_definition     = "${module.ecs_taskdefinition.taskdefinition_arn}"
  az1                 = "${var.az1}"
  az2                 = "${var.az2}"
  security_groups_ids = "${module.security_group.sg_id}"
  subnets_ids         = "${module.subnet.aws_subnet}"
  elb_id              = "${module.aws_elb.aws_elb}"
  iam_role_arn        = "${module.iam_ecs_role.aws_iamrole_name}"
}

variable "cluster" {
  type = "string"
}

variable "name" {
  type = "string"
}

variable "containername" {
  type = "string"
}

variable "task_definition" {
  type = "string"
}

variable "az1" {
  type = "string"
}

variable "az2" {
  type = "string"
}

variable "security_groups_ids" {
  type = "string"
}

variable "subnets_ids" {
  type = "string"
}

variable "elb_id" {
  type = "string"
}

variable "iam_role_arn" {
  type = "string"
}

variable "tags" {
  type = "map"

  default = {
    "Name" = "VPC_Terraform"
    "Env"  = "Prod"
  }
}

variable "cidr" {
  default = "10.20.0.0/24"
}

variable "region" {
  default = "us-east-1"
}

variable "az1" {
  default = "us-east-1a"
}

variable "az2" {
  default = "us-east-1b"
}

variable "bucket_site" {
  default = "terraformtest.com.br"
}

variable "upfile" {
  default = "./staticfiles/index.html"
}

variable "clustername" {
  default = "projeto1"
}

variable "ecsname" {
  default = "projeto1"
}

variable "containername" {
  default = "projeto1"
}

variable "familyservice" {
  default = "service"
}

variable "volume_name" {
  default = "service-storage"
}

variable "placement_constraints_type" {
  default = "memberOf"
}

variable "from_port" {
  default = "80"
}

variable "to_port" {
  default = "80"
}

variable "sgname" {
  default = "project1"
}

variable "elbname" {
  default = "projeto1"
}

variable "iamname" {
  default = "projeto1"
}

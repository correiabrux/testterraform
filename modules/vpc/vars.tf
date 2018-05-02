variable "enable_dns_hostnames" {
  description = "if truth activates dns hostnames"
  default     = true
}

variable "enable_dns_support" {
  description = "if truth activates dns resolution in vpc"
  default     = true
}

variable "tags" {
  type = "map"
}

variable "cidr" {
  type = "string"
}

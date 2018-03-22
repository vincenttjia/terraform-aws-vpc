variable "product_domain" {
  description = "Product domain these resources belongs to."
  type        = "string"
}

variable "environment" {
  description = "Type of environment these resources are."
  type        = "string"
}

variable "vpc_name" {
  description = "The name of the vpc. This name will be used as the prefix for all VPC components."
  type        = "string"
}

variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC."
  type        = "string"
}

variable "vpc_enable_dns_support" {
  description = "A boolean flag to enable/disable DNS support in the VPC. Defaults true."
  default     = true
}

variable "vpc_enable_dns_hostnames" {
  description = "A boolean flag to enable/disable DNS hostnames in the VPC. Defaults true."
  default     = true
}

variable "vpc_multi_tier" {
  description = "A boolean flag that indicate number of tier. true means 3-tier, false means single-tier. Defaults true. Recommended value is true."
  default     = true
}

variable "subnet_availability_zones" {
  description = "List of AZs for the subnet."
  type        = "list"

  default = [
    "ap-southeast-1a",
    "ap-southeast-1b",
    "ap-southeast-1c",
  ]
}

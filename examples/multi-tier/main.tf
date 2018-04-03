# This example was modified using terraform-provider-aws version 1.13.0 at 2018/04/03.
provider "aws" {
  version = "~> 1.13.0"
  region  = "ap-southeast-1"
}

# Get list of AWS Availability Zones in current region.
data "aws_availability_zones" "all" {
  state = "available"
}

module "dev" {
  source = "../../" # In actual use case, you have to replace this line with: source = "github.com/traveloka/terraform-aws-vpc.git?ref=0.0.1"

  product_domain = "txt"
  environment    = "dev"

  vpc_name                 = "dev"
  vpc_cidr_block           = "172.16.0.0/16"
  vpc_enable_dns_support   = true
  vpc_enable_dns_hostnames = true
  vpc_multi_tier           = true

  subnet_availability_zones = "${data.aws_availability_zones.all.names}"
}

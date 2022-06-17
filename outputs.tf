output "aws_account_id" {
  description = "The AWS Account ID number of the account that owns or contains the calling entity."
  value       = data.aws_caller_identity.current.account_id
}

output "aws_caller_arn" {
  description = "The AWS ARN associated with the calling entity."
  value       = data.aws_caller_identity.current.arn
}

output "aws_caller_user_id" {
  description = "The unique identifier of the calling entity."
  value       = data.aws_caller_identity.current.user_id
}

output "region_name" {
  description = "The name of the selected region."
  value       = data.aws_region.current.name
}

output "region_ec2_endpoint" {
  description = "The EC2 endpoint for the selected region."
  value       = data.aws_region.current.endpoint
}

output "vpc_id" {
  description = "The ID of the VPC."
  value       = element(concat(aws_vpc.this.*.id, [""]), "0")
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC."
  value       = element(concat(aws_vpc.this.*.cidr_block, [""]), "0")
}

output "vpc_instance_tenancy" {
  description = "Tenancy of instances spin up within VPC."
  value       = element(concat(aws_vpc.this.*.instance_tenancy, [""]), "0")
}

output "vpc_enable_dns_support" {
  description = "Whether or not the VPC has DNS support."
  value       = element(concat(aws_vpc.this.*.enable_dns_support, [""]), "0")
}

output "vpc_enable_dns_hostnames" {
  description = "Whether or not the VPC has DNS hostname support."
  value       = element(concat(aws_vpc.this.*.enable_dns_hostnames, [""]), "0")
}

output "vpc_enable_classiclink" {
  description = "Whether or not the VPC has Classiclink enabled."
  value       = element(concat(aws_vpc.this.*.enable_classiclink, [""]), "0")
}

output "vpc_multi_tier" {
  description = "Whether or not the VPC has Multi Tier subnets."
  value       = var.vpc_multi_tier ? "true" : "false"
}

output "vpc_main_route_table_id" {
  description = "The ID of the main route table associated with this VPC."
  value       = element(concat(aws_vpc.this.*.main_route_table_id, [""]), "0")
}

output "vpc_default_network_acl_id" {
  description = "The ID of the network ACL created by default on VPC creation."
  value       = element(concat(aws_vpc.this.*.default_network_acl_id, [""]), "0")
}

output "vpc_default_security_group_id" {
  description = "The ID of the security group created by default on VPC creation."
  value       = element(concat(aws_vpc.this.*.default_security_group_id, [""]), "0")
}

output "vpc_default_route_table_id" {
  description = "The ID of the route table created by default on VPC creation."
  value       = element(concat(aws_vpc.this.*.default_route_table_id, [""]), "0")
}

output "subnet_public_ids" {
  description = "List of IDs of public subnets."
  value       = aws_subnet.public.*.id
}

output "subnet_public_cidr_blocks" {
  description = "List of cidr_blocks of public subnets."
  value       = aws_subnet.public.*.cidr_block
}

output "subnet_app_ids" {
  description = "List of IDs of app subnets."
  value       = aws_subnet.app.*.id
}

output "subnet_app_cidr_blocks" {
  description = "List of cidr_blocks of app subnets."
  value       = aws_subnet.app.*.cidr_block
}

output "subnet_data_ids" {
  description = "List of IDs of data subnets."
  value       = aws_subnet.data.*.id
}

output "subnet_data_cidr_blocks" {
  description = "List of cidr_blocks of data subnets."
  value       = aws_subnet.data.*.cidr_block
}

output "db_subnet_group_name" {
  description = "The db subnet group name."
  value       = element(concat(aws_db_subnet_group.this.*.id, [""]), "0")
}

output "db_subnet_group_arn" {
  description = "The ARN of the db subnet group."
  value       = element(concat(aws_db_subnet_group.this.*.arn, [""]), "0")
}

output "elasticache_subnet_group_name" {
  description = "The elasticache subnet group name."
  value       = element(concat(aws_elasticache_subnet_group.this.*.name, [""]), "0")
}

output "redshift_subnet_group_id" {
  description = "The Redshift Subnet group ID."
  value       = element(concat(aws_redshift_subnet_group.this.*.id, [""]), "0")
}

output "igw_id" {
  description = "The ID of the Internet Gateway."
  value       = element(concat(aws_internet_gateway.this.*.id, [""]), "0")
}

output "rtb_public_id" {
  description = "ID of public route table"
  value       = element(concat(aws_route_table.public.*.id, [""]), "0")
}

output "rtb_app_ids" {
  description = "List of IDs of app route tables"
  value       = aws_route_table.app.*.id
}

output "rtb_data_ids" {
  description = "List of IDs of data route tables"
  value       = aws_route_table.data.*.id
}

output "vpce_s3_id" {
  description = "The ID of VPC endpoint for S3"
  value       = element(concat(aws_vpc_endpoint.s3.*.id, [""]), "0")
}

output "vpce_s3_prefix_list_id" {
  description = "The prefix list for the S3 VPC endpoint."
  value       = element(concat(aws_vpc_endpoint.s3.*.prefix_list_id, [""]), "0")
}

output "vpce_s3_cidr_blocks" {
  description = "The list of CIDR blocks for S3 service."
  value       = flatten(aws_vpc_endpoint.s3.*.cidr_blocks)
}

output "vpce_dynamodb_id" {
  description = "The ID of VPC endpoint for DynamoDB"
  value       = element(concat(aws_vpc_endpoint.dynamodb.*.id, [""]), "0")
}

output "vpce_dynamodb_prefix_list_id" {
  description = "The prefix list for the DynamoDB VPC endpoint."
  value = element(
    concat(aws_vpc_endpoint.dynamodb.*.prefix_list_id, [""]),
    "0",
  )
}

output "vpce_dynamodb_cidr_blocks" {
  description = "The list of CIDR blocks for DynamoDB service."
  value       = flatten(aws_vpc_endpoint.dynamodb.*.cidr_blocks)
}

# In case you are wondering why there are so many ugly interpolation: 
# https://github.com/hashicorp/terraform/issues/16726

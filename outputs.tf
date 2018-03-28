output "aws_account_id" {
  description = "The AWS Account ID number of the account that owns or contains the calling entity."
  value       = "${data.aws_caller_identity.current.account_id}"
}

output "aws_caller_arn" {
  description = "The AWS ARN associated with the calling entity."
  value       = "${data.aws_caller_identity.current.arn}"
}

output "aws_caller_user_id" {
  description = "The unique identifier of the calling entity."
  value       = "${data.aws_caller_identity.current.user_id}"
}

output "region_name" {
  description = "The name of the selected region."
  value       = "${data.aws_region.current.name}"
}

output "region_ec2_endpoint" {
  description = "The EC2 endpoint for the selected region."
  value       = "${data.aws_region.current.endpoint}"
}

output "vpc_id" {
  description = "The ID of the VPC."
  value       = "${aws_vpc.this.id}"
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC."
  value       = "${aws_vpc.this.cidr_block}"
}

output "vpc_instance_tenancy" {
  description = "Tenancy of instances spin up within VPC."
  value       = "${aws_vpc.this.instance_tenancy}"
}

output "vpc_enable_dns_support" {
  description = "Whether or not the VPC has DNS support."
  value       = "${aws_vpc.this.enable_dns_support}"
}

output "vpc_enable_dns_hostnames" {
  description = "Whether or not the VPC has DNS hostname support."
  value       = "${aws_vpc.this.enable_dns_hostnames}"
}

output "vpc_enable_classiclink" {
  description = "Whether or not the VPC has Classiclink enabled."
  value       = "${aws_vpc.this.enable_classiclink}"
}

output "vpc_multi_tier" {
  description = "Whether or not the VPC has Multi Tier subnets."
  value       = "${var.vpc_multi_tier ? "true" : "false"}"
}

output "vpc_main_route_table_id" {
  description = "The ID of the main route table associated with this VPC."
  value       = "${aws_vpc.this.main_route_table_id}"
}

output "vpc_default_network_acl_id" {
  description = "The ID of the network ACL created by default on VPC creation."
  value       = "${aws_vpc.this.default_network_acl_id}"
}

output "vpc_default_security_group_id" {
  description = "The ID of the security group created by default on VPC creation."
  value       = "${aws_vpc.this.default_security_group_id}"
}

output "vpc_default_route_table_id" {
  description = "The ID of the route table created by default on VPC creation."
  value       = "${aws_vpc.this.default_route_table_id}"
}

output "subnet_public_ids" {
  description = "List of IDs of public subnets."
  value       = ["${aws_subnet.public.*.id}"]
}

output "subnet_public_cidr_blocks" {
  description = "List of cidr_blocks of public subnets."
  value       = ["${aws_subnet.public.*.cidr_block}"]
}

output "subnet_app_ids" {
  description = "List of IDs of app subnets."
  value       = ["${aws_subnet.app.*.id}"]
}

output "subnet_app_cidr_blocks" {
  description = "List of cidr_blocks of app subnets."
  value       = ["${aws_subnet.app.*.cidr_block}"]
}

output "subnet_data_ids" {
  description = "List of IDs of data subnets."
  value       = ["${aws_subnet.data.*.id}"]
}

output "subnet_data_cidr_blocks" {
  description = "List of cidr_blocks of data subnets."
  value       = ["${aws_subnet.data.*.cidr_block}"]
}

output "igw_id" {
  description = "The ID of the Internet Gateway."
  value       = "${aws_internet_gateway.this.id}"
}

output "eip_nat_ids" {
  description = "List of Elastic IP allocation IDs for NAT Gateway."
  value       = ["${aws_eip.nat.*.id}"]
}

output "eip_nat_public_ips" {
  description = "List of Elastic IP  public IPs for NAT Gateway."
  value       = ["${aws_eip.nat.*.public_ip}"]
}

output "nat_ids" {
  description = "List of NAT Gateway IDs"
  value       = ["${aws_nat_gateway.this.*.id}"]
}

output "nat_network_interface_ids" {
  description = "List of ENI IDs of the network interface created by the NAT gateway."
  value       = ["${aws_nat_gateway.this.*.network_interface_id}"]
}

output "nat_private_ips" {
  description = "List of private IP addresses of the NAT Gateway."
  value       = ["${aws_nat_gateway.this.*.private_ip}"]
}

output "rtb_public_id" {
  description = "ID of public route table"
  value       = "${aws_route_table.public.id}"
}

output "rtb_app_ids" {
  description = "List of IDs of app route tables"
  value       = ["${aws_route_table.app.*.id}"]
}

output "rtb_data_ids" {
  description = "List of IDs of data route tables"
  value       = ["${aws_route_table.data.*.id}"]
}

output "vpce_s3_id" {
  description = "The ID of VPC endpoint for S3"
  value       = "${aws_vpc_endpoint.s3.id}"
}

output "vpce_s3_prefix_list_id" {
  description = "The prefix list for the S3 VPC endpoint."
  value       = "${aws_vpc_endpoint.s3.prefix_list_id}"
}

output "vpce_s3_cidr_blocks" {
  description = "The list of CIDR blocks for S3 service."
  value       = "${aws_vpc_endpoint.s3.cidr_blocks}"
}

output "vpce_dynamodb_id" {
  description = "The ID of VPC endpoint for DynamoDB"
  value       = "${aws_vpc_endpoint.dynamodb.id}"
}

output "vpce_dynamodb_prefix_list_id" {
  description = "The prefix list for the DynamoDB VPC endpoint."
  value       = "${aws_vpc_endpoint.dynamodb.prefix_list_id}"
}

output "vpce_dynamodb_cidr_blocks" {
  description = "The list of CIDR blocks for DynamoDB service."
  value       = "${aws_vpc_endpoint.dynamodb.cidr_blocks}"
}

output "flow_logs_log_group_arn" {
  description = "The Amazon Resource Name (ARN) specifying the log group for VPC Flow Logs."
  value       = "${aws_cloudwatch_log_group.flow_logs.arn}"
}

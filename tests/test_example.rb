# frozen_string_literal: true

require "awspec"
require "aws-sdk"
require "rhcl"

main_tf = Rhcl.parse(File.open("examples/multi-tier/main.tf"))
module_dev = main_tf["module"]["dev"]
product_domain = module_dev["product_domain"]
environment = module_dev["environment"]
vpc_name = module_dev["vpc_name"]
vpc_cidr_block = module_dev["vpc_cidr_block"]
vpc_enable_dns_support = module_dev["vpc_enable_dns_support"]
vpc_enable_dns_hostnames = module_dev["vpc_enable_dns_hostnames"]
vpc_multi_tier = module_dev["vpc_multi_tier"]
environment = module_dev["subnet_availability_zones"]

state_file = "terraform.tfstate.d/kitchen-terraform-default-aws/terraform.tfstate"
tf_state = JSON.parse(File.open(state_file).read)
outputs = tf_state["modules"][0]["outputs"]
region_name = outputs["region_name"]["value"]
vpc_id = outputs["vpc_id"]["value"]
vpc_cidr_block = outputs["vpc_cidr_block"]["value"]
vpc_instance_tenancy = outputs["vpc_instance_tenancy"]["value"]
vpc_multi_tier = outputs["vpc_multi_tier"]["value"]
vpc_default_network_acl_id = outputs["vpc_default_network_acl_id"]["value"]
vpc_default_route_table_id = outputs["vpc_default_route_table_id"]["value"]
rtb_public_id = outputs["rtb_public_id"]["value"]
rtb_app_ids = outputs["rtb_app_ids"]["value"]
rtb_data_ids = outputs["rtb_data_ids"]["value"]

ec2 = Aws::EC2::Client.new(region: region_name)
azs = ec2.describe_availability_zones
zone_names = azs.to_h[:availability_zones].map { |az| az[:zone_name] }
describe vpc(vpc_name.to_s) do
    it { should exist }
    it { should be_available }

    its(:vpc_id) { should eq "#{vpc_id}" }
    its(:cidr_block) { should eq "#{vpc_cidr_block}" }
    its(:instance_tenancy) { should eq "#{vpc_instance_tenancy}" }
    its(:is_default) { should eq false }

    it { should have_network_acl("#{vpc_name}-default-acl") }      
    it { should have_network_acl("#{vpc_default_network_acl_id}") }    

    it { should have_route_table("#{vpc_name}-default-rtb") }
    it { should have_route_table("#{vpc_default_route_table_id}") }
    
    it { should have_route_table("#{vpc_name}-public-rtb") }
    it { should have_route_table("#{rtb_public_id}") }
    if "#{vpc_multi_tier}" == "true"
        zone_names.each do |az|
            it { should have_route_table("#{vpc_name}-data-rtb-#{az[-1]}") }
            it { should have_route_table("#{vpc_name}-app-rtb-#{az[-1]}") }
        end
        rtb_app_ids.concat(rtb_data_ids).each do |rtb_ids|
            it { should have_route_table("#{rtb_ids}") }
        end
    end
end
terraform-aws-vpc
=================

Terraform module to create all mandatory VPC components.

This module supports either single-tier (only pubilc subnet) or multi-tier (public-app-data subnets) VPC creation.
This module supports only up to 4 AZs.

Usage
-----

```hcl
module "abc_dev" {
  source = "github.com/traveloka/terraform-aws-vpc.git?ref=0.0.1"

  product_domain = "abc"
  environment    = "dev"

  vpc_name       = "abc-dev"
  vpc_cidr_block = "172.16.0.0/16"
}
```

Single-Tier VPC
---------------

In some cases, you will need a VPC which has only public subnets.

```hcl
module "abc_dev" {
  source = "github.com/traveloka/terraform-aws-vpc.git?ref=0.0.1"

  # you only need to add this line
  vpc_multi_tier = false 

  # ... omitted
}
```

In some situations (it is not always happening), you will get some errors from Terraform when you set `vpc_multi_tier = false`.
It happens because several resources were not created but stated as the outputs.
Currrently Terraform does not allow `count` inside `output` block, so now it is inevitable.
But don't worry, the errors have nothing to do with the stacks/resources/infrastructures that you created.
Just re-execute `terraform apply` and you will be fine.

Terraform Version
-----------------

This module was created using Terraform 0.11.4. 
So to be more safe, Terraform version 0.11.4 or newer is required to use this module.

Examples
--------

* [Multi-Tier VPC](https://github.com/traveloka/terraform-aws-vpc/tree/master/examples/multi-tier)

Authors
-------

* [Rafi Kurnia Putra](https://github.com/rafikurnia)

License
-------

Apache 2 Licensed. See LICENSE for full details.

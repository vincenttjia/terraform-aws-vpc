data "aws_iam_policy_document" "flowlogs_to_s3" {
  statement {
    sid    = "AWSLogDeliveryWrite"
    effect = "Allow"

    actions = [
      "s3:PutObject",
    ]

    principals {
      identifiers = ["delivery.logs.amazonaws.com"]
      type        = "Service"
    }

    resources = [
      "arn:aws:s3:::${module.flowlogs_to_s3_naming.name}/*",
    ]

    condition {
      test     = "StringEquals"
      variable = "s3:x-amz-acl"

      values = [
        "bucket-owner-full-control",
      ]
    }
  }

  statement {
    sid    = "AWSLogDeliveryAclCheck"
    effect = "Allow"

    actions = [
      "s3:GetBucketAcl",
    ]

    principals {
      identifiers = ["delivery.logs.amazonaws.com"]
      type        = "Service"
    }

    resources = [
      "arn:aws:s3:::${module.flowlogs_to_s3_naming.name}",
    ]
  }
}


data "aws_ami" "fck_nat" {
  most_recent = true

  filter {
    name   = "name"
    values = ["fck-nat-ubuntu-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["arm64"]
  }

  owners = ["568608671756"]
}


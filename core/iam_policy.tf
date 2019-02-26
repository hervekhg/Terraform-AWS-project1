# ---------------------------------------------------------------------
# IAM Roles for EC2
# --------------------------------------------------------------------
data "aws_iam_policy_document" "ec2_policy_document" {
  statement {
    sid = "AllowEc2AllActionOnEfs"
    effect = "Allow"
    actions = [
      "elasticfilesystem:*"
    ]
    resources = [
      "${aws_efs_file_system.hervekhg-efs-edealshare.arn}"
    ]
  }
  statement {
    sid = "AllowEc2ToPutMetrics"
    effect = "Allow"
    actions = [
      "cloudwatch:PutMetricData"
    ]
    resources = [
      "*"
    ]
  }
  statement {
    sid = "AllowEc2ActionsOnRepoBuckets"
    effect = "Allow"
    actions = [
      "s3:Get*",
      "s3:List*"
    ]
    resources = [
      "arn:aws:s3:::${data.consul_keys.ck.var.bucket_app}/projects/${data.consul_keys.ck.var.project_name}/*",
      "arn:aws:s3:::${data.consul_keys.ck.var.bucket_app}",
      "arn:aws:s3:::${data.consul_keys.ck.var.bucket_app}/*"
    ]
  }

  statement {
    sid = "AllowEc2ActionsOnDropzoneBucket"
    effect = "Allow"
    actions = [
      "s3:Get*",
      "s3:List*",
      "s3:Put*",
      "s3:Delete*"
    ]
    resources = [
      "${aws_s3_bucket.dropzone.arn}",
      "${aws_s3_bucket.dropzone.arn}/*"
    ]
  }

  statement {
    sid = "AllowEc2ActionsOnSQS"
    effect = "Allow"
    actions = [
      "SQS:*"]
    resources = [
      "arn:aws:sqs:*${data.consul_keys.ck.var.project_name}-${var.install_name}-${var.env}-*"
    ]

  }
}

data "aws_iam_policy_document" "ec2_assume" {
  statement {
    sid = "Ec2AssumeRoles"
    actions = ["sts:AssumeRole"]
    principals {
      type = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "ec2_access_ressource" {
  name = "${data.consul_keys.ck.var.project_name}-${var.install_name}-${var.env}-ec2-role"
  assume_role_policy = "${data.aws_iam_policy_document.ec2_assume.json}"
}

resource "aws_iam_role_policy" "ec2_role_policy" {
  policy = "${data.aws_iam_policy_document.ec2_policy_document.json}"
  role = "${aws_iam_role.ec2_access_ressource.id}"
}

resource "aws_iam_instance_profile" "ec2_hervekhg_profile" {
  name = "${data.consul_keys.ck.var.project_name}-${var.install_name}-${var.env}-ec2-profile"
  role = "${aws_iam_role.ec2_access_ressource.id}"
}








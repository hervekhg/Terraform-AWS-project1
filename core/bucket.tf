resource "aws_s3_bucket" "dropzone" {
  bucket = "mm-${data.consul_keys.ck.var.project_name}-${var.install_name}-${var.env}-dropzone"
  tags {
    BillingBusinessApp = "${data.consul_keys.ck.var.billing_business_app}"
    env = "${data.consul_keys.ck.var.env}"
    resource-name = "${data.consul_keys.ck.var.project_name}"
  }
}

resource "aws_s3_bucket_notification" "dropzone_notif" {
  bucket = "${aws_s3_bucket.dropzone.id}"
  queue {
    id = "edeal"
    events = ["s3:ObjectCreated:*"]
    queue_arn = "${aws_sqs_queue.dropzone_queue.arn}"
  }
}


resource "aws_s3_bucket_policy" "dropzone_policy_attach" {
  bucket = "${aws_s3_bucket.dropzone.id}"
  policy = "${data.aws_iam_policy_document.dropzone_policy_ec2.json}"
}

data "aws_iam_policy_document" "dropzone_policy_ec2" {
  "statement" {
    sid = "AllowEc2ToPutandGetObject"
    effect = "Allow"
    actions = [
      "s3:PutObject*",
      "s3:GetObject*",
      "s3:DeleteObject",
      "s3:List*"
    ]
    resources = [
      "${aws_s3_bucket.dropzone.arn}",
      "${aws_s3_bucket.dropzone.arn}/*"
    ]
    principals {
      type = "AWS"
      identifiers = ["${data.consul_keys.ck.var.ec2_iam_role_arn}"]

    }

  }
}
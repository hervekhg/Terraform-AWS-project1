resource "aws_sqs_queue" "dropzone_queue" {
  name = "${data.consul_keys.ck.var.project_name}-${var.install_name}-${var.env}-dropzone-sqs"
  delay_seconds = 0
  max_message_size = 262144
  message_retention_seconds = 1209600
  receive_wait_time_seconds = 0
  visibility_timeout_seconds = 50
  tags {
    BillingBusinessApp = "${data.consul_keys.ck.var.billing_business_app}"
    env = "${data.consul_keys.ck.var.env}"
    resource-name = "${data.consul_keys.ck.var.project_name}"
  }
}

resource "aws_sqs_queue_policy" "dropzone_queue_policy" {
  queue_url = "${aws_sqs_queue.dropzone_queue.id}"
  policy = "${data.aws_iam_policy_document.dropzone_queue_policy_doc.json}"

}

data "aws_iam_policy_document" "dropzone_queue_policy_doc" {
  "statement" {
    sid = "AllowDelegatedAccountToSendMessage"
    actions = [
      "SQS:*"
    ]
    resources = ["${aws_sqs_queue.dropzone_queue.arn}"]

    principals {
      type = "AWS"
      identifiers = [
        "*"]
    }
    condition {
      test = "ArnLike"
      variable = "aws:SourceArn"
      values = [
        "${data.consul_keys.ck.var.ec2_iam_role_arn}",
        "${aws_s3_bucket.dropzone.arn}"
      ]
    }
  }
}
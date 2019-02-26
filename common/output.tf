
//# ---------------------------------------------------------------------# Output to Consul
//# ---------------------------------------------------------------------
//resource "consul_keys" "hervekhg" {
//  key {
//    path = "${data.consul_keys.ck.var.env}/${data.consul_keys.ck.var.project_name}/${var.install_name}/terraform/output/dropzone_arn"
//    value = "${aws_s3_bucket.dropzone.arn}"
//  }
//}

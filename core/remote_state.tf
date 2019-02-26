data "terraform_remote_state" "network" {
  backend = "s3"
  config {
    bucket = "${data.consul_keys.ck.var.vpc_s3_tfstate_bucket}"
    key = "${data.consul_keys.ck.var.vpc_s3_tfstate_key}"
    region = "${data.consul_keys.ck.var.region}"
  }
}

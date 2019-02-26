provider "aws" {
  region = "${data.consul_keys.ck.var.region}"

  assume_role {
    role_arn = "${data.consul_keys.ck.var.role_arn}"
  }
}

provider "consul" {
  address = "${var.consul_host}:${var.consul_port}"
  scheme = "http"
  datacenter = "${var.env}"
}

terraform {
  backend "s3" {
  }
}
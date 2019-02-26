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

# AWS Management (for Route53)
provider "aws" {
  alias  = "mgmt"
  assume_role {
    role_arn = "${data.consul_keys.ck.var.route53_roleid}"
  }
  region = "${data.consul_keys.ck.var.region}"
}
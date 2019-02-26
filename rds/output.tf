
# ---------------------------------------------------------------------# Output to Consul
# ---------------------------------------------------------------------
resource "consul_keys" "hervekhg" {
  key {
    path  = "${data.consul_keys.ck.var.env}/${data.consul_keys.ck.var.project_name}/${var.install_name}/terraform/output/sg_ec2_id"
    value = "${aws_security_group.hervekhg-sg-ec2.id}"
  }

  key {
    path = "${data.consul_keys.ck.var.env}/${data.consul_keys.ck.var.project_name}/${var.install_name}/terraform/output/sg_efs_id"
    value = "${aws_security_group.hervekhg-sg-efs.id}"
  }

  key {
    path = "${data.consul_keys.ck.var.env}/${data.consul_keys.ck.var.project_name}/${var.install_name}/terraform/output/sg_alb_priv_id"
    value = "${aws_security_group.hervekhg-edeal-alb-priv.id}"
  }

  key {
    path = "${data.consul_keys.ck.var.env}/${data.consul_keys.ck.var.project_name}/${var.install_name}/terraform/output/sg_alb_pub_id"
    value = "${aws_security_group.hervekhg-edeal-alb-pub.id}"
  }

  key {
    path = "${data.consul_keys.ck.var.env}/${data.consul_keys.ck.var.project_name}/${var.install_name}/terraform/output/sg_rds_id"
    value = "${aws_security_group.hervekhg-rds.id}"
  }
}

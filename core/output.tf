
# ---------------------------------------------------------------------# Output to Consul
# ---------------------------------------------------------------------
resource "consul_keys" "hervekhg" {
  key {
    path  = "${data.consul_keys.ck.var.env}/${data.consul_keys.ck.var.project_name}/${var.install_name}/terraform/output/efs_id"
    value = "${aws_efs_file_system.hervekhg-efs-edealshare.id}"
  }

  key {
    path = "${data.consul_keys.ck.var.env}/${data.consul_keys.ck.var.project_name}/${var.install_name}/terraform/output/efs_dns_name"
    value = "${aws_efs_mount_target.hervekhg-mount-target.dns_name}"
  }

  key {
    path = "${data.consul_keys.ck.var.env}/${data.consul_keys.ck.var.project_name}/${var.install_name}/terraform/output/ec2_iam_role_arn"
    value = "${aws_iam_role.ec2_access_ressource.arn}"
  }

}

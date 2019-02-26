# --------------
# EFS Filesystem
# --------------
resource "aws_efs_file_system" "hervekhg-efs-edealshare" {
  creation_token = "${data.consul_keys.ck.var.project_name}-${var.install_name}-${var.env}-efs-edeal"
  tags {
    BillingBusinessApp = "${data.consul_keys.ck.var.project_name}"
    env = "${var.env}"
    resource-name = "${data.consul_keys.ck.var.project_name}-${var.install_name}-${var.env}"
    Name = "${data.consul_keys.ck.var.project_name}-${var.install_name}-${var.env}-efs-edeal"
  }
}


resource "aws_efs_mount_target" "hervekhg-mount-target" {
  file_system_id = "${aws_efs_file_system.hervekhg-efs-edealshare.id}"
  subnet_id = "${data.terraform_remote_state.network.aws_subnet_dataapp[0]}"
  security_groups = ["${data.consul_keys.ck.var.sg_efs_id}"]
}

resource "aws_efs_mount_target" "hervekhg-mount-target2" {
  file_system_id = "${aws_efs_file_system.hervekhg-efs-edealshare.id}"
  subnet_id = "${data.terraform_remote_state.network.aws_subnet_dataapp[1]}"
  security_groups = ["${data.consul_keys.ck.var.sg_efs_id}"]
}

resource "aws_efs_mount_target" "hervekhg-mount-target3" {
  file_system_id = "${aws_efs_file_system.hervekhg-efs-edealshare.id}"
  subnet_id = "${data.terraform_remote_state.network.aws_subnet_dataapp[2]}"
  security_groups = ["${data.consul_keys.ck.var.sg_efs_id}"]
}
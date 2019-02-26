###########
## Database insance
########################
resource "aws_db_instance" "rds_hervekhg" {
  name                            = "${data.consul_keys.ck.var.rds_name}"
  db_subnet_group_name            = "${aws_db_subnet_group.rds_hervekhg_subnet.id}"
  allow_major_version_upgrade     = "${data.consul_keys.ck.var.rds_allow_major_version_upgrade}"
  username                        = "${data.consul_keys.ck.var.rds_username}"
  engine_version                  = "${data.consul_keys.ck.var.rds_engine_version}"
  port                            = "${data.consul_keys.ck.var.rds_port}"
  character_set_name              = "${data.consul_keys.ck.var.rds_character_set_name}"
  storage_type                    = "${data.consul_keys.ck.var.rds_storage_type}"
  auto_minor_version_upgrade      = "${data.consul_keys.ck.var.rds_auto_minor_version_upgrade}"
  instance_class                  = "${data.consul_keys.ck.var.rds_instance_class}"
  maintenance_window              = "${data.consul_keys.ck.var.rds_maintenance_window}"
  publicly_accessible             = "${data.consul_keys.ck.var.rds_publicly_accessible}"
  license_model                   = "${data.consul_keys.ck.var.rds_license_model}"
  copy_tags_to_snapshot           = "${data.consul_keys.ck.var.rds_copy_tags_to_snapshot}"
  allocated_storage               = "${data.consul_keys.ck.var.rds_allocated_storage}"
  parameter_group_name            = "${data.consul_keys.ck.var.rds_parameter_group_name}"
  multi_az                        = "${data.consul_keys.ck.var.rds_multi_az}"
  engine                          = "${data.consul_keys.ck.var.rds_engine}"
  backup_retention_period         = "${data.consul_keys.ck.var.rds_backup_retention_period}"
  identifier                      = "${data.consul_keys.ck.var.rds_identifier}"
  backup_window                   = "${data.consul_keys.ck.var.rds_backup_window}"
  password                        = "${data.consul_keys.ck.var.rds_password}"
  vpc_security_group_ids          = ["${aws_security_group.hervekhg-rds.id}","${data.consul_keys.ck.var.dba_security_group_id}"]
  skip_final_snapshot             = "${data.consul_keys.ck.var.rds_skip_final_snapshot}"
  final_snapshot_identifier       = "${data.consul_keys.ck.var.rds_name}-final-snapshot"
  apply_immediately               = "true"

  tags {
    BillingBusinessApp = "${data.consul_keys.ck.var.billing_business_app}"
    Name               = "${data.consul_keys.ck.var.project_name}-${var.install_name}-${var.env}-rds"
    resource-env = "${data.consul_keys.ck.var.env}"
    resource-name = "${data.consul_keys.ck.var.project_name}"
  }
}

resource "aws_db_subnet_group" "rds_hervekhg_subnet" {
  name       = "${data.consul_keys.ck.var.project_name}-${var.install_name}-${var.env}-subnet-group"
  subnet_ids = ["${data.terraform_remote_state.network.aws_subnet_dataapp}"]

  tags = {
    Name = "${data.consul_keys.ck.var.project_name}-${var.install_name}-${var.env}-subnet-group"
    BillingBusinessApp = "${data.consul_keys.ck.var.billing_business_app}"
    resource-env = "${data.consul_keys.ck.var.env}"
    resource-name = "${data.consul_keys.ck.var.project_name}"
  }
}
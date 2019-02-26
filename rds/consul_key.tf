data "consul_keys" "ck" {
  key {
    name = "env"
    path = "${var.consul_path}/terraform/common/env"
  }
  key {
    name = "project_name"
    path = "${var.consul_path}/terraform/common/project_name"
  }

   key {
    name = "role_arn"
    path = "${var.consul_path}/terraform/common/role_arn"
  }

  key {
    name = "region"
    path = "${var.consul_path}/terraform/common/region"
  }

  key {
    name = "billing_business_app"
    path = "${var.consul_path}/terraform/common/billing_business_app"
  }

  //RDS
  key {
    name = "rds_name"
    path = "${var.consul_path}/terraform/rds/rds_name"
  }
  key {
    name = "rds_identifier"
    path = "${var.consul_path}/terraform/rds/rds_identifier"
  }
  key {
    name = "rds_instance_class"
    path = "${var.consul_path}/terraform/rds/rds_instance_class"
  }
  key {
    name = "rds_parameter_group_name"
    path = "${var.consul_path}/terraform/rds/rds_parameter_group_name"
  }
  key {
    name = "rds_engine"
    path = "${var.consul_path}/terraform/rds/rds_engine"
  }
  key {
    name = "rds_engine_version"
    path = "${var.consul_path}/terraform/rds/rds_engine_version"
  }
  key {
    name = "rds_license_model"
    path = "${var.consul_path}/terraform/rds/rds_license_model"
  }
  key {
    name = "rds_identifier"
    path = "${var.consul_path}/terraform/rds/rds_identifier"
  }
  key {
    name = "rds_allow_major_version_upgrade"
    path = "${var.consul_path}/terraform/rds/rds_allow_major_version_upgrade"
  }
  key {
    name = "rds_username"
    path = "${var.consul_path}/terraform/rds/rds_username"
  }
  key {
    name = "rds_password"
    path = "${var.consul_path}/terraform/rds/rds_password"
  }
  key {
    name = "rds_port"
    path = "${var.consul_path}/terraform/rds/rds_port"
  }
  key {
    name = "rds_character_set_name"
    path = "${var.consul_path}/terraform/rds/rds_character_set_name"
  }
  key {
    name = "rds_storage_type"
    path = "${var.consul_path}/terraform/rds/rds_storage_type"
  }
  key {
    name = "rds_auto_minor_version_upgrade"
    path = "${var.consul_path}/terraform/rds/rds_auto_minor_version_upgrade"
  }
  key {
    name = "rds_maintenance_window"
    path = "${var.consul_path}/terraform/rds/rds_maintenance_window"
  }
  key {
    name = "rds_publicly_accessible"
    path = "${var.consul_path}/terraform/rds/rds_publicly_accessible"
  }
  key {
    name = "rds_copy_tags_to_snapshot"
    path = "${var.consul_path}/terraform/rds/rds_copy_tags_to_snapshot"
  }
  key {
    name = "rds_allocated_storage"
    path = "${var.consul_path}/terraform/rds/rds_allocated_storage"
  }
  key {
    name = "rds_backup_retention_period"
    path = "${var.consul_path}/terraform/rds/rds_backup_retention_period"
  }
  key {
    name = "rds_engine_version"
    path = "${var.consul_path}/terraform/rds/rds_engine_version"
  }
  key {
    name = "rds_backup_window"
    path = "${var.consul_path}/terraform/rds/rds_backup_window"
  }
  key {
    name = "rds_skip_final_snapshot"
    path = "${var.consul_path}/terraform/rds/rds_skip_final_snapshot"
  }
  key {
    name = "rds_multi_az"
    path = "${var.consul_path}/terraform/rds/rds_multi_az"
  }
  key {
    name = "dba_security_group_id"
    path = "${var.consul_path}/terraform/network/dba_security_group_id"
  }

  // VPC
  key {
    name = "vpc_s3_tfstate_bucket"
    path = "${var.consul_path}/terraform/network/vpc_s3_tfstate_bucket"
  }

  key {
    name = "vpc_s3_tfstate_key"
    path = "${var.consul_path}/terraform/network/vpc_s3_tfstate_key"
  }

}
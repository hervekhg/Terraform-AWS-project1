data "consul_keys" "ck" {
  key {
    name = "env"
    path = "${var.consul_path}/terraform/common/env"
  }
  key {
    name = "role_arn"
    path = "${var.consul_path}/terraform/common/role_arn"
  }
  key {
    name = "account_mgmt"
    path = "${var.consul_path}/terraform/common/account_mgmt"
  }
  key {
    name = "project_name"
    path = "${var.consul_path}/terraform/common/project_name"
  }

  key {
    name = "region"
    path = "${var.consul_path}/terraform/common/region"
  }

  // EC2 VAR
  key {
    name = "asg_max_size"
    path = "${var.consul_path}/terraform/asg/asg_max_size"
  }
  key {
    name = "asg_min_size"
    path = "${var.consul_path}/terraform/asg/asg_min_size"
  }
  key {
    name = "asg_desired_capacity"
    path = "${var.consul_path}/terraform/asg/asg_desired_capacity"
  }
  key {
    name = "asg_health_check_grace_period"
    path = "${var.consul_path}/terraform/asg/asg_health_check_grace_period"
  }
  key {
    name = "asg_health_check_type"
    path = "${var.consul_path}/terraform/asg/asg_health_check_type"
  }
  key {
    name = "billing_business_app"
    path = "${var.consul_path}/terraform/common/billing_business_app"
  }
  key {
    name = "asg_termination_policy"
    path = "${var.consul_path}/terraform/asg/asg_termination_policy"
  }

  // Launch config
  key {
    name = "instance_type"
    path = "${var.consul_path}/terraform/asg/instance_type"
  }
  key {
    name = "image_id"
    path = "${var.consul_path}/terraform/asg/image_id"
  }
  key {
    name = "key_name"
    path = "${var.consul_path}/terraform/asg/key_name"
  }
  key {
    name = "bucket_app"
    path = "${var.consul_path}/terraform/common/bucket_app"
  }

  // Network
  key {
    name = "sns_nagios_arn"
    path = "${var.consul_path}/terraform/common/sns_nagios_arn"
  }
  // Alb
  key {
    name = "alb_idle_timeout"
    path = "${var.consul_path}/terraform/alb/alb_idle_timeout"
  }
  key {
    name = "alb_external_port_listen"
    path = "${var.consul_path}/terraform/alb/alb_external_port_listen"
  }
  key {
    name = "alb_internal_port_listen"
    path = "${var.consul_path}/terraform/alb/alb_internal_port_listen"
  }
  key {
    name = "alb_external_port_target"
    path = "${var.consul_path}/terraform/alb/alb_external_port_target"
  }
  key {
    name = "alb_internal_port_target"
    path = "${var.consul_path}/terraform/alb/alb_internal_port_target"
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
    // Security Group ID
  key {
    name = "sg_ec2_id"
    path = "${var.consul_path}/terraform/output/sg_ec2_id"
  }

  key {
    name = "sg_efs_id"
    path = "${var.consul_path}/terraform/output/sg_efs_id"
  }
  key {
    name = "sg_alb_priv_id"
    path = "${var.consul_path}/terraform/output/sg_alb_priv_id"
  }
  key {
    name = "sg_alb_pub_id"
    path = "${var.consul_path}/terraform/output/sg_alb_pub_id"
  }
  key {
    name = "sg_rds_id"
    path = "${var.consul_path}/terraform/output/sg_rds_id"
  }

//  key {
//    name = "dropzone_arn"
//    path = "${var.consul_path}/terraform/output/dropzone_arn"
//  }

  // VPC
  key {
    name = "ec2_iam_role_arn"
    path = "${var.consul_path}/terraform/output/ec2_iam_role_arn"
  }

  key {
    name = "vpc_s3_tfstate_bucket"
    path = "${var.consul_path}/terraform/network/vpc_s3_tfstate_bucket"
  }

  key {
    name = "vpc_s3_tfstate_key"
    path = "${var.consul_path}/terraform/network/vpc_s3_tfstate_key"
  }

  // Certificate
  key {
    name = "alb_listener_acm_certificate"
    path = "${var.consul_path}/terraform/common/alb_listener_acm_certificate"
  }

  // Route53
  key {
    name = "route53_domain"
    path = "${var.consul_path}/terraform/route53/route53_domain"
  }
  key {
    name = "route53_roleid"
    path = "${var.consul_path}/terraform/route53/route53_roleid"
  }
  key {
    name = "route53_zoneid"
    path = "${var.consul_path}/terraform/route53/route53_zoneid"
  }
}
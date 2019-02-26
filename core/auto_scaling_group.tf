# ---------------------------------------------------------------------
# Auto Scaling Group Edeal
# ---------------------------------------------------------------------
resource "aws_autoscaling_group" "ec2-edeal" {

  #launch_configuration = "${aws_launch_template.ec2_launch.id}"
  name = "${data.consul_keys.ck.var.project_name}-${var.install_name}-${var.env}-edeal"
  max_size = "${data.consul_keys.ck.var.asg_max_size}"
  min_size = "${data.consul_keys.ck.var.asg_min_size}"
  desired_capacity = "${data.consul_keys.ck.var.asg_desired_capacity}"
  health_check_grace_period = "${data.consul_keys.ck.var.asg_health_check_grace_period}"
  health_check_type = "${data.consul_keys.ck.var.asg_health_check_type}"
  termination_policies = ["${data.consul_keys.ck.var.asg_termination_policy}"]
  vpc_zone_identifier = ["${data.terraform_remote_state.network.aws_subnet_dataapp}"]
  enabled_metrics = ["GroupInServiceInstances", "GroupPendingInstances","GroupStandbyInstances"]
  target_group_arns = ["${aws_alb_target_group.ext_alb_target_group.arn}","${aws_alb_target_group.int_alb_target_group.arn}"]

  launch_template {
    id = "${aws_launch_template.ec2_launch.id}"
    version = "$$Latest"
  }

  tag {
    key = "BillingBusinessApp"
    propagate_at_launch = true
    value = "${data.consul_keys.ck.var.billing_business_app}"
  }
  tag {
    key = "env"
    propagate_at_launch = true
    value = "${data.consul_keys.ck.var.project_name}-${var.env}"
  }
  tag {
    key = "Name"
    propagate_at_launch = true
    value = "${data.consul_keys.ck.var.project_name}-${var.env}-${var.install_name}-edeal"
  }
}


# ---------------------------------------------------------------------
# Launch Configuration Auto Scaling Group
# ---------------------------------------------------------------------
resource "aws_launch_template" "ec2_launch" {

  instance_type = "${data.consul_keys.ck.var.instance_type}"
  image_id = "${data.consul_keys.ck.var.image_id}"
  name_prefix = "${data.consul_keys.ck.var.project_name}-${var.install_name}-${var.env}-edeal"
  key_name = "${data.consul_keys.ck.var.key_name}"
  iam_instance_profile = {
    name = "${aws_iam_instance_profile.ec2_hervekhg_profile.name}"
  }
  vpc_security_group_ids = ["${data.consul_keys.ck.var.sg_ec2_id}"]
  user_data = "${base64encode(data.template_file.ec2.rendered)}"

  monitoring {
    enabled = true
  }
  lifecycle {
    create_before_destroy = true
  }
  tag_specifications {
    resource_type = "volume"
    tags = {
      BillingBusinessApp = "${data.consul_keys.ck.var.billing_business_app}"
      env = "${data.consul_keys.ck.var.project_name}-${var.env}"
      name = "${data.consul_keys.ck.var.project_name}-${var.env}-${var.install_name}-edeal"

    }
  }

}

data "template_file" "ec2" {
  template = "${file("${path.root}/templates/user_data.sh.tpl")}"
  vars {
    project_name = "${data.consul_keys.ck.var.project_name}"
    install_name = "${var.install_name}"
    env = "${data.consul_keys.ck.var.env}"
    region = "${data.consul_keys.ck.var.region}"
    version_lot = "${var.version_lot}"
    app_bucket = "${data.consul_keys.ck.var.bucket_app}"
    sns_nagios_arn = "${data.consul_keys.ck.var.sns_nagios_arn}"
  }
}
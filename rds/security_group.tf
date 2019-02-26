# --------------------------------------------------------------
# Security Group AutoScalingGroup
# ---------------------------------------------------------------
resource "aws_security_group" "hervekhg-sg-ec2" {
  vpc_id = "${data.terraform_remote_state.network.aws_vpc_id}"
  name = "${data.consul_keys.ck.var.project_name}-${var.install_name}-${var.env}.sg-ec2"
  description = "Security group for hervekhg - edeal "

  tags {
    BillingBusinessApp = "${data.consul_keys.ck.var.project_name}"
    env = "${var.env}"
    resource-name = "${data.consul_keys.ck.var.project_name}-${var.install_name}-${var.env}"
  }
}


# -------------------------------------------------------------
# Security Group EFS
# -------------------------------------------------------------
resource "aws_security_group" "hervekhg-sg-efs" {
  vpc_id = "${data.terraform_remote_state.network.aws_vpc_id}"
  name = "${data.consul_keys.ck.var.project_name}-${var.install_name}-${var.env}.sg-efs"
  description = "Security Group of EFS"
  tags {
    BillingBusinessApp = "${data.consul_keys.ck.var.project_name}"
    env = "${var.env}"
    resource-name = "${data.consul_keys.ck.var.project_name}-${var.install_name}-${var.env}"
    Name = "${data.consul_keys.ck.var.project_name}-${var.install_name}-${data.consul_keys.ck.var.env}-sg-efs"
  }
}

# --------------------------------------------------------------------
# Security Group External ALB
# --------------------------------------------------------------------
resource "aws_security_group" "hervekhg-edeal-alb-pub" {
  vpc_id = "${data.terraform_remote_state.network.aws_vpc_id}"
  name = "${data.consul_keys.ck.var.project_name}-${var.install_name}-${var.env}.sg-alb-ext"
  description = "Security Group for External ALB"
  tags {
    BillingBusinessApp = "${data.consul_keys.ck.var.project_name}"
    env = "${var.env}"
    resource-name = "${data.consul_keys.ck.var.project_name}-${var.install_name}-${var.env}"
    Name = "${data.consul_keys.ck.var.project_name}-${var.install_name}-${data.consul_keys.ck.var.env}-sg-alb-pub"
  }
}


# ---------------------------------------------------------------------
# Security Group Internal ALB
# ---------------------------------------------------------------------
resource "aws_security_group" "hervekhg-edeal-alb-priv" {
  vpc_id = "${data.terraform_remote_state.network.aws_vpc_id}"
  name = "${data.consul_keys.ck.var.project_name}-${var.install_name}-${var.env}.sg-alb-int"
  description = "Security Group for Internal ALB"
  tags {
    BillingBusinessApp = "${data.consul_keys.ck.var.project_name}"
    env = "${var.env}"
    resource-name = "${data.consul_keys.ck.var.project_name}-${var.install_name}-${var.env}"
    Name = "${data.consul_keys.ck.var.project_name}-${var.install_name}-${data.consul_keys.ck.var.env}-sg-alb-priv"
  }

}


# ---------------------------------------------------------------------
# Security Group for RDS
# ---------------------------------------------------------------------
resource "aws_security_group" "hervekhg-rds" {
  vpc_id = "${data.terraform_remote_state.network.aws_vpc_id}"
  name = "${data.consul_keys.ck.var.project_name}-${var.env}-sg-rds"
  description = "Security Group for RDS"
  tags {
    BillingBusinessApp = "${data.consul_keys.ck.var.project_name}"
    env = "${var.env}"
    resource-name = "${data.consul_keys.ck.var.project_name}-${var.install_name}-${var.env}"
    Name = "${data.consul_keys.ck.var.project_name}-${var.install_name}-${data.consul_keys.ck.var.env}-sg-rds"
  }
}



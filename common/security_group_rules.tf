# --------------------------------------------------------------
# Security Group Rules AutoScalingGroup
# ---------------------------------------------------------------
resource "aws_security_group_rule" "hervekhg-sg-ssh-ingress" {
  from_port = 22
  protocol = "tcp"
  security_group_id = "${data.consul_keys.ck.var.sg_ec2_id}"
  to_port = 22
  type = "ingress"
  cidr_blocks = ["10.0.0.0/8", "192.168.152.0/21"]
}

resource "aws_security_group_rule" "hervekhg-sg-alb-priv-ingress" {
  from_port = 8080
  protocol = "tcp"
  security_group_id = "${data.consul_keys.ck.var.sg_ec2_id}"
  to_port = 8080
  type = "ingress"
  source_security_group_id = "${data.consul_keys.ck.var.sg_alb_priv_id}"
}

resource "aws_security_group_rule" "hervekhg-sg-alb-pub-ingress" {
  from_port = 8080
  protocol = "tcp"
  security_group_id = "${data.consul_keys.ck.var.sg_ec2_id}"
  to_port = 8080
  type = "ingress"
  source_security_group_id = "${data.consul_keys.ck.var.sg_alb_pub_id}"
}


resource "aws_security_group_rule" "hervekhg-sg-egress" {
  from_port = "0"
  protocol = "-1"
  to_port = "0"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = "${data.consul_keys.ck.var.sg_ec2_id}"
  type = "egress"
}

# -------------------------------------------------------------
# Security Group Rules EFS
# -------------------------------------------------------------
resource "aws_security_group_rule" "hervekhg-efs-solr-ingress" {
  from_port = 2049
  protocol = "tcp"
  security_group_id = "${data.consul_keys.ck.var.sg_efs_id}"
  to_port = 2049
  type = "ingress"
  source_security_group_id = "${data.consul_keys.ck.var.sg_ec2_id}"
}

resource "aws_security_group_rule" "hervekhg-edeal-solr-egress" {
  from_port = "0"
  protocol = "-1"
  to_port = "0"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = "${data.consul_keys.ck.var.sg_efs_id}"
  type = "egress"
}

# --------------------------------------------------------------------
# Security Group Rules Public ALB
# --------------------------------------------------------------------

resource "aws_security_group_rule" "hervekhg-edeal-alb-pub-ingress" {
  from_port = 443
  protocol = "tcp"
  security_group_id = "${data.consul_keys.ck.var.sg_alb_pub_id}"
  to_port = 443
  cidr_blocks = ["0.0.0.0/0"]
  type = "ingress"
}

resource "aws_security_group_rule" "hervekhg-edeal-alb-pub-egress" {
  from_port = "0"
  protocol = "-1"
  to_port = "0"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = "${data.consul_keys.ck.var.sg_alb_pub_id}"
  type = "egress"
}

# ---------------------------------------------------------------------
# ---------------------------------------------------------------------
# Security Group private ALB
# ---------------------------------------------------------------------
# ---------------------------------------------------------------------

resource "aws_security_group_rule" "hervekhg-edeal-alb-priv-ssl-ingress" {
  from_port = 443
  protocol = "tcp"
  security_group_id = "${data.consul_keys.ck.var.sg_alb_priv_id}"
  to_port = 443
  cidr_blocks = ["10.8.160.0/21","10.6.160.0/21","10.9.160.0/21","10.64.160.0/23","10.65.1.0/24"]
  type = "ingress"
}

resource "aws_security_group_rule" "hervekhg-edeal-alb-priv-ssl-egress" {
  from_port = "0"
  protocol = "-1"
  to_port = "0"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = "${data.consul_keys.ck.var.sg_alb_priv_id}"
  type = "egress"
}

# ---------------------------------------------------------------------
# Security Group Rules for RDS
# ---------------------------------------------------------------------

resource "aws_security_group_rule" "hervekhg-rds-ingress" {
  from_port = 1521
  protocol = "tcp"
  security_group_id = "${data.consul_keys.ck.var.sg_rds_id}"
  to_port = 1521
  type = "ingress"
  source_security_group_id = "${data.consul_keys.ck.var.sg_ec2_id}"
}

resource "aws_security_group_rule" "hervekhg-rds-egress" {
  from_port = "0"
  protocol = "-1"
  to_port = "0"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id =  "${data.consul_keys.ck.var.sg_rds_id}"
  type = "egress"
}


# --------------------------------------------------------------
# External ALB
# ---------------------------------------------------------------
resource "aws_alb" "ext_alb" {
  name = "${data.consul_keys.ck.var.project_name}-${var.install_name}-${var.env}-edeal-alb-pub"
  subnets = ["${data.terraform_remote_state.network.aws_subnet_front}"]
  security_groups = ["${data.consul_keys.ck.var.sg_alb_pub_id}"]
  internal = false
  idle_timeout = "${data.consul_keys.ck.var.alb_idle_timeout}"

//  access_logs {
//    bucket = "${aws_s3_bucket.alb_ext.bucket}"
//    enabled = true
//  }

  tags {
    BillingBusinessApp = "${data.consul_keys.ck.var.billing_business_app}"
    resource-env = "${data.consul_keys.ck.var.env}"
    resource-name = "${data.consul_keys.ck.var.project_name}"
    Name = "${data.consul_keys.ck.var.project_name}-${var.install_name}-${data.consul_keys.ck.var.env}-edeal-alb-ext"
  }

}


resource "aws_alb_listener" "ext_alb_listener" {
  load_balancer_arn = "${aws_alb.ext_alb.arn}"
  port = "${data.consul_keys.ck.var.alb_external_port_listen}"
  protocol = "HTTPS"
  certificate_arn = "${data.consul_keys.ck.var.alb_listener_acm_certificate}"
  "default_action" {
    target_group_arn = "${aws_alb_target_group.ext_alb_target_group.arn}"
    type = "forward"
  }
}

// Redirect on ALB http to https
resource "aws_alb_listener" "alb_ext_http" {
  "default_action" {
    type = "redirect"

    redirect {
      port = "443"
      protocol = "HTTPS"
      status_code = "HTTP_301"
    }
  }
  load_balancer_arn = "${aws_alb.ext_alb.arn}"
  port = "80"
  protocol = "HTTP"
}

//ACM Certificate
resource "aws_lb_listener_certificate" "ssl" {
  listener_arn    = "${aws_alb_listener.ext_alb_listener.arn}"
  certificate_arn = "${data.consul_keys.ck.var.alb_listener_acm_certificate}"
}

resource "aws_alb_target_group" "ext_alb_target_group" {
  name = "${data.consul_keys.ck.var.project_name}-${var.install_name}-${var.env}-alb-pub-tg"
  port = "${data.consul_keys.ck.var.alb_external_port_target}"
  protocol = "HTTP"
  vpc_id = "${data.terraform_remote_state.network.aws_vpc_id}"

  health_check {
    healthy_threshold = "2"
    unhealthy_threshold = "3"
    timeout = "4"
    interval = "5"
    matcher = "200"
    path = "/"
  }

  tags {
    BillingBusinessApp = "${data.consul_keys.ck.var.billing_business_app}"
    resource-env = "${data.consul_keys.ck.var.env}"
    resource-name = "${data.consul_keys.ck.var.project_name}"
    Name = "${data.consul_keys.ck.var.project_name}-${var.install_name}-${data.consul_keys.ck.var.env}-edeal-alb-pub-tg"
  }
}


# --------------------------------------------------------------
# Internal ALB
# ---------------------------------------------------------------
resource "aws_alb" "int_alb" {
  name = "${data.consul_keys.ck.var.project_name}-${var.install_name}-${var.env}-edeal-alb-priv"
  subnets = ["${data.terraform_remote_state.network.aws_subnet_dataapp}"]
  security_groups = ["${data.consul_keys.ck.var.sg_alb_priv_id}"]
  internal = true
  idle_timeout = "${data.consul_keys.ck.var.alb_idle_timeout}"

//  access_logs {
//    bucket = "${aws_s3_bucket.alb_int.bucket}"
//    enabled = true
//  }

  tags {
    BillingBusinessApp = "${data.consul_keys.ck.var.billing_business_app}"
    resource-env = "${data.consul_keys.ck.var.env}"
    resource-name = "${data.consul_keys.ck.var.project_name}"
    Name = "${data.consul_keys.ck.var.project_name}-${var.install_name}-${data.consul_keys.ck.var.env}-edeal-alb-priv"
  }

}


resource "aws_alb_listener" "int_alb_listener" {
  load_balancer_arn = "${aws_alb.int_alb.arn}"
  port = "${data.consul_keys.ck.var.alb_internal_port_listen}"
  protocol = "HTTP"
  "default_action" {
    target_group_arn = "${aws_alb_target_group.int_alb_target_group.arn}"
    type = "forward"
  }
}

resource "aws_alb_listener" "alb_int_http" {
  "default_action" {
    type = "redirect"

    redirect {
      port = "443"
      protocol = "HTTPS"
      status_code = "HTTP_301"
    }
  }
  load_balancer_arn = "${aws_alb.int_alb.arn}"
  port = "80"
  protocol = "HTTP"
}

resource "aws_alb_target_group" "int_alb_target_group" {
  name = "${data.consul_keys.ck.var.project_name}-${var.install_name}-${var.env}-alb-priv-tg"
  port = "${data.consul_keys.ck.var.alb_internal_port_target}"
  protocol = "HTTP"
  vpc_id = "${data.terraform_remote_state.network.aws_vpc_id}"

  health_check {
    healthy_threshold = "2"
    unhealthy_threshold = "3"
    timeout = "4"
    interval = "5"
    matcher = "200"
    path = "/"
  }

  tags {
    BillingBusinessApp = "${data.consul_keys.ck.var.billing_business_app}"
    resource-env = "${data.consul_keys.ck.var.env}"
    resource-name = "${data.consul_keys.ck.var.project_name}"
    Name = "${data.consul_keys.ck.var.project_name}-${var.install_name}-${data.consul_keys.ck.var.env}-edeal-alb-priv-tg"
  }
}
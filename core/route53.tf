# Route53 DNS Record supervision:
resource "aws_route53_record" "edealrecord" {
  provider = "aws.mgmt"
  zone_id = "${data.consul_keys.ck.var.route53_zoneid}"
  name = "${data.consul_keys.ck.var.project_name}-${var.install_name}-${var.env}-edeal.${data.consul_keys.ck.var.route53_domain}"
  type = "CNAME"
  ttl = "60"
  records = ["${aws_alb.ext_alb.dns_name}"]
}
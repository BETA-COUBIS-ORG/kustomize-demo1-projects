resource "aws_route53_record" "cluster-alias" {
  depends_on = [module.alb]
  zone_id    = "Z09289712OR1E49S4E493"
  name       = "DelavergnejosephLLC"     #tchdzukou  #rafy.betasoudure.com   "*.betacoubis.com" 
  type       = "CNAME"
  ttl        = "60"
  records    = [module.alb.lb_dns_name]    # 2:02 video 7 tia project
}

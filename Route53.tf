resource "aws_route53_zone" "lacardia" {
  name = "lacardia.com"
}

resource "aws_route53_record" "lacardia_ns" {
  allow_overwrite = true
  name            = "lacardia.com"
  ttl             = 172800
  type            = "NS"
  zone_id         = aws_route53_zone.lacardia.zone_id

  records = [
    aws_route53_zone.lacardia.name_servers[0],
    aws_route53_zone.lacardia.name_servers[1],
    aws_route53_zone.lacardia.name_servers[2],
    aws_route53_zone.lacardia.name_servers[3],
  ]
}

resource "aws_route53_record" "lacardia_a_record" {
  name    = "lacardia.com"
  type    = "A"
  zone_id = aws_route53_zone.lacardia.zone_id

  alias {
    evaluate_target_health = true
    name                   = "s3-website-us-east-1.amazonaws.com"
    zone_id                = "Z3AQBSTGFYJSTF"
  }
}

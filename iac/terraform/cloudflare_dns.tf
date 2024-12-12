module "cloudflare_record" {
  source = "github.com/Ujstor/terraform-hetzner-modules//modules/network/cloudflare_record?ref=v0.0.3"

  cloudflare_record = {
    kube_api_c1 = {
      zone_id = var.cloudflare_zone_id
      name    = "api.k3s3c1"
      content = module.k3s3_server.server_info.c1.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    kube_api_c2 = {
      zone_id = var.cloudflare_zone_id
      name    = "api.k3s3c2"
      content = module.k3s3_server.server_info.c2.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    kube_api_c3 = {
      zone_id = var.cloudflare_zone_id
      name    = "api.k3s3c3"
      content = module.k3s3_server.server_info.c3.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    kube_api_n1 = {
      zone_id = var.cloudflare_zone_id
      name    = "api.k3s3n1"
      content = module.k3s3_server.server_info.n1.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    kube_api_n2 = {
      zone_id = var.cloudflare_zone_id
      name    = "api.k3s3n2"
      content = module.k3s3_server.server_info.n2.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    kube_api_n3 = {
      zone_id = var.cloudflare_zone_id
      name    = "api.k3s3n3"
      content = module.k3s3_server.server_info.n3.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    kube_api_1 = {
      zone_id = var.cloudflare_zone_id
      name    = "api.k3s3"
      content = module.k3s3_server.server_info.c1.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    kube_api_2 = {
      zone_id = var.cloudflare_zone_id
      name    = "api.k3s3"
      content = module.k3s3_server.server_info.c2.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    kube_api_3 = {
      zone_id = var.cloudflare_zone_id
      name    = "api.k3s3"
      content = module.k3s3_server.server_info.c3.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    wildcard_record_k3s3_1 = {
      zone_id = var.cloudflare_zone_id
      name    = "*.k3s3"
      content = module.k3s3_server.server_info.n1.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    wildcard_record_k3s3_2 = {
      zone_id = var.cloudflare_zone_id
      name    = "*.k3s3"
      content = module.k3s3_server.server_info.n2.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    wildcard_record_k3s3_3 = {
      zone_id = var.cloudflare_zone_id
      name    = "*.k3s3"
      content = module.k3s3_server.server_info.n3.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    wildcard_record_1 = {
      zone_id = var.cloudflare_zone_id
      name    = "*"
      content = module.k3s3_server.server_info.n1.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    wildcard_record_2 = {
      zone_id = var.cloudflare_zone_id
      name    = "*"
      content = module.k3s3_server.server_info.n2.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    wildcard_record_3 = {
      zone_id = var.cloudflare_zone_id
      name    = "*"
      content = module.k3s3_server.server_info.n3.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
  }
  depends_on = [module.k3s3_server]
}

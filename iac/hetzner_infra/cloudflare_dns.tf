module "cloudflare_record" {
  source = "github.com/Ujstor/terraform-hetzner-modules//modules/network/cloudflare_record?ref=v0.0.3"

  cloudflare_record = {
    kube_api_c1 = {
      zone_id = var.cloudflare_zone_id
      name    = "api.k3s0c1"
      content = module.k3s0_server.server_info.c1.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    kube_api_c2 = {
      zone_id = var.cloudflare_zone_id
      name    = "api.k3s0c2"
      content = module.k3s0_server.server_info.c2.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    kube_api_c3 = {
      zone_id = var.cloudflare_zone_id
      name    = "api.k3s0c3"
      content = module.k3s0_server.server_info.c3.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    kube_api_n1 = {
      zone_id = var.cloudflare_zone_id
      name    = "api.k3s0n1"
      content = module.k3s0_server.server_info.n1.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    kube_api_n2 = {
      zone_id = var.cloudflare_zone_id
      name    = "api.k3s0n2"
      content = module.k3s0_server.server_info.n2.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    kube_api_n3 = {
      zone_id = var.cloudflare_zone_id
      name    = "api.k3s0n3"
      content = module.k3s0_server.server_info.n3.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    kube_api1 = {
      zone_id = var.cloudflare_zone_id
      name    = "api.k3s0"
      content = module.k3s0_server.server_info.c1.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    kube_api2 = {
      zone_id = var.cloudflare_zone_id
      name    = "api.k3s0"
      content = module.k3s0_server.server_info.c2.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    kube_api3 = {
      zone_id = var.cloudflare_zone_id
      name    = "api.k3s0"
      content = module.k3s0_server.server_info.c3.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    argocd1 = {
      zone_id = var.cloudflare_zone_id
      name    = "argocd.k3s0"
      content = module.k3s0_server.server_info.n1.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    argocd2 = {
      zone_id = var.cloudflare_zone_id
      name    = "argocd.k3s0"
      content = module.k3s0_server.server_info.n2.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    argocd3 = {
      zone_id = var.cloudflare_zone_id
      name    = "argocd.k3s0"
      content = module.k3s0_server.server_info.n3.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    gitea1 = {
      zone_id = var.cloudflare_zone_id
      name    = "gitea.k3s0"
      content = module.k3s0_server.server_info.n1.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    gitea2 = {
      zone_id = var.cloudflare_zone_id
      name    = "gitea.k3s0"
      content = module.k3s0_server.server_info.n2.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    gitea3 = {
      zone_id = var.cloudflare_zone_id
      name    = "gitea.k3s0"
      content = module.k3s0_server.server_info.n3.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    portfolio1 = {
      zone_id = var.cloudflare_zone_id
      name    = "portfolio"
      content = module.k3s0_server.server_info.n1.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    portfolio2 = {
      zone_id = var.cloudflare_zone_id
      name    = "portfolio"
      content = module.k3s0_server.server_info.n2.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    portfolio3 = {
      zone_id = var.cloudflare_zone_id
      name    = "portfolio"
      content = module.k3s0_server.server_info.n3.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    working-hours1 = {
      zone_id = var.cloudflare_zone_id
      name    = "working-hours"
      content = module.k3s0_server.server_info.n1.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    working-hours2 = {
      zone_id = var.cloudflare_zone_id
      name    = "working-hours"
      content = module.k3s0_server.server_info.n2.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    working-hours3 = {
      zone_id = var.cloudflare_zone_id
      name    = "working-hours"
      content = module.k3s0_server.server_info.n3.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    todo1 = {
      zone_id = var.cloudflare_zone_id
      name    = "todo"
      content = module.k3s0_server.server_info.n1.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    todo2 = {
      zone_id = var.cloudflare_zone_id
      name    = "todo"
      content = module.k3s0_server.server_info.n2.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    todo3 = {
      zone_id = var.cloudflare_zone_id
      name    = "todo"
      content = module.k3s0_server.server_info.n3.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    notes1 = {
      zone_id = var.cloudflare_zone_id
      name    = "notes"
      content = module.k3s0_server.server_info.n1.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    notes2 = {
      zone_id = var.cloudflare_zone_id
      name    = "notes"
      content = module.k3s0_server.server_info.n2.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    notes3 = {
      zone_id = var.cloudflare_zone_id
      name    = "notes"
      content = module.k3s0_server.server_info.n3.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    analytics1 = {
      zone_id = var.cloudflare_zone_id
      name    = "plausible-analytics"
      content = module.k3s0_server.server_info.n1.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    analytics2 = {
      zone_id = var.cloudflare_zone_id
      name    = "plausible-analytics"
      content = module.k3s0_server.server_info.n2.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    analytics3 = {
      zone_id = var.cloudflare_zone_id
      name    = "plausible-analytics"
      content = module.k3s0_server.server_info.n3.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    wordpress1 = {
      zone_id = var.cloudflare_zone_id
      name    = "wordpress"
      content = module.k3s0_server.server_info.n1.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    wordpress2 = {
      zone_id = var.cloudflare_zone_id
      name    = "wordpress"
      content = module.k3s0_server.server_info.n2.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    wordpress3 = {
      zone_id = var.cloudflare_zone_id
      name    = "wordpress"
      content = module.k3s0_server.server_info.n3.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    uptimekuma1 = {
      zone_id = var.cloudflare_zone_id
      name    = "uptime.k3s0"
      content = module.k3s0_server.server_info.n1.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    uptimekuma2 = {
      zone_id = var.cloudflare_zone_id
      name    = "uptime.k3s0"
      content = module.k3s0_server.server_info.n2.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    uptimekuma3 = {
      zone_id = var.cloudflare_zone_id
      name    = "uptime.k3s0"
      content = module.k3s0_server.server_info.n3.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    harbor1 = {
      zone_id = var.cloudflare_zone_id
      name    = "harbor"
      content = module.k3s0_server.server_info.n1.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    harbor2 = {
      zone_id = var.cloudflare_zone_id
      name    = "harbor"
      content = module.k3s0_server.server_info.n2.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    harbor3 = {
      zone_id = var.cloudflare_zone_id
      name    = "harbor"
      content = module.k3s0_server.server_info.n3.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    gitlab-gitlab1 = {
      zone_id = var.cloudflare_zone_id
      name    = "gitlab.k3s0"
      content = module.k3s0_server.server_info.n1.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    gitlab-gitlab2 = {
      zone_id = var.cloudflare_zone_id
      name    = "gitlab.k3s0"
      content = module.k3s0_server.server_info.n2.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    gitlab-gitlab3 = {
      zone_id = var.cloudflare_zone_id
      name    = "gitlab.k3s0"
      content = module.k3s0_server.server_info.n3.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    gitlab-registry1 = {
      zone_id = var.cloudflare_zone_id
      name    = "registry.k3s0"
      content = module.k3s0_server.server_info.n1.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    gitlab-registry2 = {
      zone_id = var.cloudflare_zone_id
      name    = "registry.k3s0"
      content = module.k3s0_server.server_info.n2.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    gitlab-registry3 = {
      zone_id = var.cloudflare_zone_id
      name    = "registry.k3s0"
      content = module.k3s0_server.server_info.n3.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    gitlab-minio1 = {
      zone_id = var.cloudflare_zone_id
      name    = "minio.k3s0"
      content = module.k3s0_server.server_info.n1.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    gitlab-minio2 = {
      zone_id = var.cloudflare_zone_id
      name    = "minio.k3s0"
      content = module.k3s0_server.server_info.n2.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    gitlab-minio3 = {
      zone_id = var.cloudflare_zone_id
      name    = "minio.k3s0"
      content = module.k3s0_server.server_info.n3.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    gitlab-kas1 = {
      zone_id = var.cloudflare_zone_id
      name    = "kas.k3s0"
      content = module.k3s0_server.server_info.n1.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    gitlab-kas2 = {
      zone_id = var.cloudflare_zone_id
      name    = "kas.k3s0"
      content = module.k3s0_server.server_info.n2.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    gitlab-kas3 = {
      zone_id = var.cloudflare_zone_id
      name    = "kas.k3s0"
      content = module.k3s0_server.server_info.n3.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    gitlab-pages1 = {
      zone_id = var.cloudflare_zone_id
      name    = "pages.k3s0"
      content = module.k3s0_server.server_info.n1.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    gitlab-pages2 = {
      zone_id = var.cloudflare_zone_id
      name    = "pages.k3s0"
      content = module.k3s0_server.server_info.n2.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    gitlab-pages3 = {
      zone_id = var.cloudflare_zone_id
      name    = "pages.k3s0"
      content = module.k3s0_server.server_info.n3.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    s3-1 = {
      zone_id = var.cloudflare_zone_id
      name    = "s3.k3s0"
      content = module.k3s0_server.server_info.n1.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    s3-2 = {
      zone_id = var.cloudflare_zone_id
      name    = "s3.k3s0"
      content = module.k3s0_server.server_info.n2.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    s3-3 = {
      zone_id = var.cloudflare_zone_id
      name    = "s3.k3s0"
      content = module.k3s0_server.server_info.n3.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    s3-console1 = {
      zone_id = var.cloudflare_zone_id
      name    = "s3.console.k3s0"
      content = module.k3s0_server.server_info.n1.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    s3-console2 = {
      zone_id = var.cloudflare_zone_id
      name    = "s3.console.k3s0"
      content = module.k3s0_server.server_info.n2.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    s3-console3 = {
      zone_id = var.cloudflare_zone_id
      name    = "s3.console.k3s0"
      content = module.k3s0_server.server_info.n3.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    rook-ceph-console1 = {
      zone_id = var.cloudflare_zone_id
      name    = "rook-ceph.dashboard.k3s0"
      content = module.k3s0_server.server_info.n1.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    rook-ceph-console2 = {
      zone_id = var.cloudflare_zone_id
      name    = "rook-ceph.dashboard.k3s0"
      content = module.k3s0_server.server_info.n2.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    rook-ceph-console3 = {
      zone_id = var.cloudflare_zone_id
      name    = "rook-ceph.dashboard.k3s0"
      content = module.k3s0_server.server_info.n3.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
  }
  depends_on = [module.k3s0_server]
}

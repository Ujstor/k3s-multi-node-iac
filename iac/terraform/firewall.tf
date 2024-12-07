module "firewall" {
  source = "github.com/Ujstor/terraform-hetzner-modules//modules/network/firewall?ref=v0.0.6"
  firewalls = {
    ssh = {
      labels = {
        type = "ssh-fw"
      }
      name = "firewall-ssh"
      rules = [
        {
          direction = "in"
          port      = "22"
          protocol  = "tcp"
        },
        {
          destination_ips = ["0.0.0.0/0"]
          direction       = "out"
          port            = "22"
          protocol        = "tcp"
        },
      ]
    }
    https = {
      labels = {
        type = "ingress"
      }
      name = "firewall-ingress"
      rules = [
        {
          direction = "in"
          port      = "80"
          protocol  = "tcp"
        },
        {
          destination_ips = ["0.0.0.0/0"]
          direction       = "out"
          port            = "80"
          protocol        = "tcp"
        },
        {
          direction = "in"
          port      = "443"
          protocol  = "tcp"
        },
        {
          destination_ips = ["0.0.0.0/0"]
          direction       = "out"
          port            = "443"
          protocol        = "tcp"
        },
      ]
    }
    kubeapi = {
      labels = {
        type = "kubeapi"
      }
      name = "firewall-kubeapi"
      rules = [
        {
          direction = "in"
          port      = "6443"
          protocol  = "tcp"
        },
        {
          destination_ips = ["0.0.0.0/0"]
          direction       = "out"
          port            = "6443"
          protocol        = "tcp"
        },
      ]
    }
    argocd = {
      labels = {
        type = "argocd"
      }
      name = "firewall-argocd"
      rules = [
        {
          direction = "in"
          port      = "2746"
          protocol  = "tcp"
        },
        {
          destination_ips = ["0.0.0.0/0"]
          direction       = "out"
          port            = "2746"
          protocol        = "tcp"
        },
      ]
    }
    k3s = {
      labels = {
        type = "k3s"
      }
      name = "firewall-k3s"
      rules = [
        {
          direction = "in"
          port      = "2379-2380"
          protocol  = "tcp"
        },
        {
          destination_ips = ["0.0.0.0/0"]
          direction       = "out"
          port            = "2379-2380"
          protocol        = "tcp"
        },
        {
          direction = "in"
          port      = "8472"
          protocol  = "udp"
        },
        {
          destination_ips = ["0.0.0.0/0"]
          direction       = "out"
          port            = "8472"
          protocol        = "udp"
        },
        {
          direction = "in"
          port      = "10250"
          protocol  = "tcp"
        },
        {
          destination_ips = ["0.0.0.0/0"]
          direction       = "out"
          port            = "10250"
          protocol        = "tcp"
        },
        {
          direction = "in"
          port      = "51820"
          protocol  = "udp"
        },
        {
          destination_ips = ["0.0.0.0/0"]
          direction       = "out"
          port            = "51820"
          protocol        = "udp"
        },
        {
          direction = "in"
          port      = "51821"
          protocol  = "udp"
        },
        {
          destination_ips = ["0.0.0.0/0"]
          direction       = "out"
          port            = "51821"
          protocol        = "udp"
        },
        {
          direction = "in"
          port      = "5001"
          protocol  = "tcp"
        },
        {
          destination_ips = ["0.0.0.0/0"]
          direction       = "out"
          port            = "5001"
          protocol        = "tcp"
        }
      ]
    }
  }
}

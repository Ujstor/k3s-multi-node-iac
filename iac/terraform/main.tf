module "ssh_key_k3s3" {
  source = "github.com/Ujstor/terraform-hetzner-modules//modules/ssh_key?ref=v0.0.6"

  ssh_key_name = "k3s3_hetzner_key"
  ssh_key_path = ".ssh" #create dir before appling tf config if you use custom paths for ssh keys
}

module "k3s3_server" {
  source = "github.com/Ujstor/terraform-hetzner-modules//modules/server?ref=v0.0.6"

  hcloud_ssh_key_id = [module.ssh_key_k3s3.hcloud_ssh_key_id]

  server_config = {
    c1 = {
      location     = "fsn1"
      server_type  = "cx22"
      ipv6_enabled = false
      subnet_id    = module.network_config.subnet_id.subnet-1.subnet_id
      subnet_ip    = "10.0.1.1"
    }
    c2 = {
      location     = "nbg1"
      server_type  = "cx22"
      ipv6_enabled = false
      subnet_id    = module.network_config.subnet_id.subnet-1.subnet_id
      subnet_ip    = "10.0.1.2"
    }
    c3 = {
      location     = "hel1"
      server_type  = "cx22"
      ipv6_enabled = false
      subnet_id    = module.network_config.subnet_id.subnet-1.subnet_id
      subnet_ip    = "10.0.1.3"
    }
    n1 = {
      location     = "nbg1"
      server_type  = "cx42"
      ipv6_enabled = false
      subnet_id    = module.network_config.subnet_id.subnet-2.subnet_id
      subnet_ip    = "10.0.2.1"
    }
    n2 = {
      location     = "fsn1"
      server_type  = "cx42"
      ipv6_enabled = false
      subnet_id    = module.network_config.subnet_id.subnet-2.subnet_id
      subnet_ip    = "10.0.2.2"
    }
    n3 = {
      location     = "hel1"
      server_type  = "cx42"
      ipv6_enabled = false
      subnet_id    = module.network_config.subnet_id.subnet-2.subnet_id
      subnet_ip    = "10.0.2.3"
    }
  }
  # firewall_ids = [
  #   module.firewall.firewall_ids.cilium.id,
  #   module.firewall.firewall_ids.ssh-https.id,
  #   module.firewall.firewall_ids.kubeapi.id,
  #   module.firewall.firewall_ids.k3s.id,
  #   module.firewall.firewall_ids.argocd.id
  # ]
  use_network = true
  depends_on = [
    # module.firewall,
    module.ssh_key_k3s3,
    module.network_config
  ]
}

module "volumes" {
  source = "github.com/Ujstor/terraform-hetzner-modules//modules/volumes?ref=v0.0.6"

  volume_config = {
    volume-1 = {
      size      = 100
      location  = module.k3s3_server.server_info.n1.location
      server_id = module.k3s3_server.server_info.n1.id
    }
    volume-2 = {
      size      = 100
      location  = module.k3s3_server.server_info.n2.location
      server_id = module.k3s3_server.server_info.n2.id
    }
    volume-3 = {
      size      = 100
      location  = module.k3s3_server.server_info.n3.location
      server_id = module.k3s3_server.server_info.n3.id
    }
  }
}

module "network_config" {
  source = "github.com/Ujstor/terraform-hetzner-modules//modules/network/vpc_subnet?ref=v0.0.6"

  vpc_config = {
    vpc_name     = "cluster-vpc"
    vpc_ip_range = "10.0.0.0/16"
  }

  subnet_config = {
    subnet-1 = {
      subnet_ip_range = "10.0.1.0/24"
    }
    subnet-2 = {
      subnet_ip_range = "10.0.2.0/24"
    }
  }

  network_type = "cloud"
  network_zone = "eu-central"
}

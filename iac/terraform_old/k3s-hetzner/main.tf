module "kube-hetzner" {
  source = "github.com/kube-hetzner/terraform-hcloud-kube-hetzner?ref=v2.15.4"

  providers = {
    hcloud = hcloud
  }

  hcloud_token = var.hcloud_token

  ssh_public_key  = file(".ssh/k3s3_hetzner_key.pub")
  ssh_private_key = file(".ssh/k3s3_hetzner_key")

  control_plane_nodepools = [
    {
      name        = "c1",
      server_type = "cx22",
      location    = "fsn1",
      labels      = ["control-plane=true"],
      taints      = [],
      count       = 1
    },
    {
      name        = "c2",
      server_type = "cx22",
      location    = "fsn1",
      labels      = ["control-plane=true"],
      taints      = [],
      count       = 1
    },
    {
      name        = "c3",
      server_type = "cx22",
      location    = "fsn1",
      labels      = ["control-plane=true"],
      taints      = [],
      count       = 1
    }
  ]

  agent_nodepools = [
    {
      name        = "n1",
      server_type = "cx32",
      location    = "fsn1",
      labels      = ["node=true", "rook-ceph-role=storage-node", "role=storage-node"],
      taints      = []
      taints      = [],
      count       = 1
    },
    {
      name        = "n2",
      server_type = "cx32",
      location    = "fsn1",
      labels      = ["node=true", "rook-ceph-role=storage-node", "role=storage-node"],
      taints      = []
      count       = 1
    },
    {
      name        = "n3",
      location    = "fsn1",
      server_type = "cx32",
      labels      = ["node=true", "rook-ceph-role=storage-node", "role=storage-node"],
      taints      = []
      count       = 1
    },
  ]


  # etcd_s3_backup = {
  #   etcd-s3-endpoint        = ""
  #   etcd-s3-access-key      = ""
  #   etcd-s3-secret-key      = ""
  #   etcd-s3-bucket          = ""
  #   etcd-s3-region          = ""
  # }

  ingress_controller   = "none"
  enable_cert_manager  = false
  enable_local_storage = true
  disable_hetzner_csi  = true
  hetzner_csi_version  = "v2.5.1"
  create_kustomization = false

  # allow_scheduling_on_control_plane = true
  system_upgrade_use_drain = false
  install_k3s_version      = "v1.30.1+k3s1"

  cluster_name = "k3s3"

  additional_tls_sans       = ["api.k3s3.ujstor.com"]
  kubeconfig_server_address = "api.k3s3.ujstor.com"

  # load_balancer_type         = "lb11"
  # load_balancer_location     = "fsn1"
  # load_balancer_disable_ipv6 = true

  # existing_network_id = [hcloud_network.your_network.id]
  network_region = "eu-central"
  # network_ipv4_cidr               = "10.240.0.0/12"
  # cluster_ipv4_cidr               = "10.250.0.0/16"
  # service_ipv4_cidr               = "10.240.0.0/16"
  # cluster_dns_ipv4                = "10.240.0.10"
  cni_plugin                      = "cilium"
  disable_network_policy          = true
  enable_klipper_metal_lb         = true
  cilium_version                  = "v1.16.0"
  cilium_routing_mode             = "native"
  cilium_ipv4_native_routing_cidr = "10.0.0.0/8"

  cilium_values = <<EOT
ipam:
  mode: kubernetes
k8s:
  requireIPv4PodCIDR: true
kubeProxyReplacement: true
routingMode: native
ipv4NativeRoutingCIDR: "10.0.0.0/8"
endpointRoutes:
  enabled: true
loadBalancer:
  acceleration: native
bpf:
  masquerade: true
encryption:
  enabled: true
  type: wireguard
MTU: 1450
  EOT

  extra_firewall_rules = [
    {
      description     = "To Allow ArgoCD access to resources via SSH"
      direction       = "out"
      protocol        = "tcp"
      port            = "22"
      source_ips      = []
      destination_ips = ["0.0.0.0/0", "::/0"]
    }
  ]

  dns_servers = [
    "1.1.1.1",
    "8.8.8.8",
    "2606:4700:4700::1111",
  ]
}

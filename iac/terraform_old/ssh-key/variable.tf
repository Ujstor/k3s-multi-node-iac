variable "ssh_key_name" {
  type        = string
  description = "Name of the SSH key created"
  default     = "kube_hetzner_key"
}

variable "ssh_key_path" {
  description = "Path where the SSH key is stored"
  type        = string
  default     = "../k3s-hetzner/.ssh"
}

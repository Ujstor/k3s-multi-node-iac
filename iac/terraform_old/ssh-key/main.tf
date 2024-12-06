resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "null_resource" "ca_key_cert" {
  provisioner "local-exec" {
    command = <<-EOT
     mkdir -p ${var.ssh_key_path} &&
     echo "${tls_private_key.ssh_key.private_key_pem}" > ${var.ssh_key_path}/${var.ssh_key_name} &&
     echo "${tls_private_key.ssh_key.public_key_openssh}" > ${var.ssh_key_path}/${var.ssh_key_name}.pub &&
     chmod 600 ${var.ssh_key_path}/${var.ssh_key_name}
   EOT
  }
}

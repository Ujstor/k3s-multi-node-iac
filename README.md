# k8s multi node iac on Hetzner

## Terraform

```bash
cd hetzner_infra

terraform init
terraform apply
```

## Ansible

```bash
docker build -t ansible-k3s-cluster ./iac/ansible/

docker run --rm -it \
    -v $(pwd)/iac/ansible/inventory.yml:/config/inventory.yml \
    -v $(pwd)/iac/hetzner_infra/.ssh/k3s0_hetzner_key:/secrets/ssh_key \
    -v $(pwd)/iac/hetzner_infra/.ssh/k3s0_hetzner_key.pub:/secrets/ssh_key.pub \
    ansible-k3s-cluster

ansible-playbook playbook_k3s_deploy.yml

cat kubeconfig
```

or use the [prebuilt](https://hub.docker.com/repository/docker/ujstor/ansible-k3s-deploy/general) image.

## Helm

### Install Cilium in the `kube-system` namespace:

```bash
cd helm/system/cilium
helm install cilium . -n kube-system
```

### Install Argo CD:
```bash
kubectl create namespace gitops
cd helm/system/argo-cd
helm install argocd . -n gitops
```

### Apply `aoa.yaml` in the `gitops` namespace:
```bash
cd helm
kubectl apply -f aoa.yaml -n gitops
``````

The cluster will be automatically bootstrapped.

## Prerequisites

Before you begin, ensure you have the following:

- A Hetzner Cloud account. You can sign up for one [here](https://hetzner.cloud/?ref=Ix9xCKNxJriM).
- The following command-line tools installed:
  - [Terraform](https://www.terraform.io/downloads.html)
  - [Packer](https://www.packer.io/downloads)
  - [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)
  - [hcloud CLI](https://github.com/hetznercloud/cli)

Check official [terraform-hcloud-kube-hetzner](https://github.com/kube-hetzner/terraform-hcloud-kube-hetzner)repo for more details.

## Deployment Steps

### 1. Create MicroOS snapshot

```bash
cd ./iac/packer/MicroOS-packer
terraform apply
```

### 2. Generate SSH Keys

Generate a passphrase-less SSH key pair to be used for the cluster.

```bash
cd ./iac/terraform/ssh-key
terraform apply
```

### 3. Initialize and Apply Terraform

```bash
cd ./iac/terraform/k3s-hetzner
terraform init
terraform apply
```

### 4. Access and Manage Your Cluster

Once the cluster is deployed, you can access and manage it:

- To access the cluster details, use:

  ```bash
  terraform output kubeconfig
  ```

### 5. Cleanup

When you are finished with your cluster, you can destroy it and release the associated resources using Terraform:

```bash
terraform destroy
```

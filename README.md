# k8s/k3s multi node iac on Hetzner

## Terraform

```bash
cd iac/terrafrom/nodes-hetzner

terraform init
terraform apply
```

## Ansible

```bash
#K3s
docker build -t ansible-k3s-cluster ./iac/ansible/k3s

docker run --rm -it \
    -v $(pwd)/iac/ansible/k3s_inventory.yml:/config/inventory.yml \
    -v $(pwd)/iac/terraform/nodes-hetzner/.ssh/kube_hetzner_key:/secrets/ssh_key \
    -v $(pwd)/iac/terraform/nodes-hetzner/.ssh/kube_hetzner_key.pub:/secrets/ssh_key.pub \
    ansible-k3s-cluster

ansible-playbook k3s_deploy.yml
ansible-playbook prepare_block_dev_rook_ceph.yml

#K8s kubespray
docker build -t ansible-k8s-cluster ./iac/ansible/kubespray

docker run --rm -it \
    -v $(pwd)/iac/ansible/k8s_kubespray_inventory.yml:/config/inventory.yml \
    -v $(pwd)/iac/terraform/nodes-hetzner/.ssh/kube_hetzner_key:/secrets/ssh_key \
    -v $(pwd)/iac/terraform/nodes-hetzner/.ssh/kube_hetzner_key.pub:/secrets/ssh_key.pub \
    ansible-k8s-cluster

ansible-playbook k8s_deploy.yml
ansible-playbook prepare_block_dev_rook_ceph.yml


cat kubeconfig
```
or use the [prebuilt](https://hub.docker.com/repository/docker/ujstor/ansible-k3s-cluster-deploy/general) image.

## Helm

### Install Cilium in the `kube-system` namespace:

```bash
cd gitops/helm/system/cilium
helm install cilium . -n kube-system
```

### Install Argo CD:
```bash
kubectl create namespace gitops
cd gitops/helm/system/argo-cd
helm install argocd . -n gitops
```

### Apply `aoa.yaml` in the `gitops` namespace:
```bash
cd gitops/helm
kubectl apply -f aoa.yaml -n gitops
```

The cluster will be automatically bootstrapped.

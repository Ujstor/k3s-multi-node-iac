# k8s multi node iac on Hetzner

## Terraform

```bash
cd iac/terrafrom

terraform init
terraform apply
```

## Ansible

```bash
docker build -t ansible-k3s-cluster ./iac/ansible/

docker run --rm -it \
    -v $(pwd)/iac/ansible/inventory.yml:/config/inventory.yml \
    -v $(pwd)/iac/terraform/.ssh/k3s3_hetzner_key:/secrets/ssh_key \
    -v $(pwd)/iac/terraform/.ssh/k3s3_hetzner_key.pub:/secrets/ssh_key.pub \
    ansible-k3s-cluster

ansible-playbook k3s_deploy.yml
ansible-playbook repare_block_dev_rook_ceph.yml

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

# argocd-homelab
ArgoCD managed homelab

# Setup
# Essential packages (ZFS/NFS/iSCSI)
sudo apt update && sudo apt install -y \
  zfsutils-linux \
  nfs-kernel-server \
  cifs-utils \
  open-iscsi  # Optional but recommended

# Customize these values!
export SETUP_NODEIP=192.168.0.82  # Your node IP
export SETUP_CLUSTERTOKEN=randomtokensecret12343  # Strong token

curl -sfL https://get.k3s.io | INSTALL_K3S_VERSION="v1.33.3+k3s1" \
  INSTALL_K3S_EXEC="--node-ip $SETUP_NODEIP \
  --disable=flannel,local-storage,metrics-server,servicelb,traefik \
  --flannel-backend='none' \
  --disable-network-policy \
  --disable-cloud-controller \
  --disable-kube-proxy" \
  K3S_TOKEN=$SETUP_CLUSTERTOKEN \
  K3S_KUBECONFIG_MODE=644 sh -s -

# Configure kubectl access
mkdir -p $HOME/.kube && sudo cp -i /etc/rancher/k3s/k3s.yaml $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config && chmod 600 $HOME/.kube/config-


# Install Helm
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash


# helm chart for certmgr
# helm chart for argocd


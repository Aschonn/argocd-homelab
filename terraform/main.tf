# resource "helm_release" "cilium" {
#   name       = "cilium"
#   repository = "https://helm.cilium.io/"
#   chart      = "cilium"
#   namespace  = "kube-system"
#   version    = "1.16.5"

#   values = [
#     file("../infra/networking/cilium/values.yaml")
#   ]
# }

# resource "helm_release" "argocd" {
#     name = "argocd"
#     repository = "https://argoproj.github.io/argo-helm"
#     chart = "argo-cd"
#     namespace = "argocd"   
#     create_namespace = true
#     values = [
#     file("../infra/networking/cilium/values.yaml ")
#     ]
# }

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}


resource "helm_release" "argo_cd" {
    name             = "argocd"
    repository       = "https://argoproj.github.io/argo-helm" # Official Chart Repo
    chart            = "argo-cd"                              # Official Chart Name
    namespace        = "argocd"
    version          = var.chart_version
    create_namespace = true
}
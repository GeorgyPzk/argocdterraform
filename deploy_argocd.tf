module "argocd_dev" {
  source           = "./terraform_argocd"
  eks_cluster_name = "demo"
  chart_version    = "5.46.7"
}

# Can be deployed ONLY after ArgoCD deployment: depends_on = [module.argocd_dev]
module "argocd_dev_root" {
  source             = "./terraform_argocd"
  eks_cluster_name   = "demo"
  git_source_path    = "demo/applications"
  git_source_repoURL = "https://github.com/GeorgyPzk/argocdpub.git"
}

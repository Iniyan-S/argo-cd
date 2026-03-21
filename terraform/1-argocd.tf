# Install using ARGOCD Helm Chart
# helm install argocd -n argocd --create-namespace argo/argo-cd --version 3.35.4 -f terraform/values/argocd.yaml

# To install using helm chart use helm_release terraform resource
resource "helm_release" "argocd" {
  name = "argocd"
  repository = "https://argoproj.github.io/argo-helm"
  chart = "argo-cd" # In argo/argo-cd argo is repo name & argo-cd is the chart name
  version = "3.35.4" # Chart version, can get it using helm search repo argocd
  namespace = "argocd"
  create_namespace = true
  
  values = [file("values/argocd.yaml")] # Overrides the default values using the specified file
}


resource "helm_release" "nginx_ingress" {
  name             = "nginx-ingress"
  repository       = "https://helm.nginx.com/stable"
  chart            = "nginx-ingress"
  namespace        = "nginx-ingress"
  create_namespace = true

  values = [file("${path.module}/../helm/nginx-ingress.yaml")]
}
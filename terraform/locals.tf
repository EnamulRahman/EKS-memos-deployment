locals {
  name   = "eks-lab"
  region = "eu-west-2"
  domain = "lab.myegh.com"

  tags = {
    Environment = "sandbox"
    Project     = "EKS-memos-deployment"
    Owner       = "Enamul"
  }
}

TF = terraform -chdir=terraform

init:
	$(TF) init

fmt:
	$(TF) fmt -recursive

validate:
	$(TF) validate

plan:
	$(TF) plan

apply:
	$(TF) apply
	aws eks update-kubeconfig --region eu-west-2 --name eks-lab
	kubectl apply -f argocd/memos-app.yaml

check:
	powershell -ExecutionPolicy Bypass -File check-costs.ps1

destroy:
	-kubectl delete -f argocd/memos-app.yaml --ignore-not-found
	-kubectl delete -f k8s/memos.yaml --ignore-not-found
	powershell -Command "Start-Sleep 60"
	$(TF) destroy -target=helm_release.nginx_ingress -auto-approve
	powershell -Command "Start-Sleep 120"
	$(TF) destroy -auto-approve
	$(MAKE) check

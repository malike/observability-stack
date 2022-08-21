
NAMESPACE := observability-poc
NAMESPACE_SYSTEM := observability-system

.PHONY:

install-flux:
	kubectl apply -f https://github.com/fluxcd/flux2/releases/latest/download/install.yaml

install-all:
	cd install;  kustomize build . | kubectl apply -f -


deploy-sample-app:
	echo "deploying application"
	cd sample-project;  kustomize build . | kubectl apply -f -

destroy:
	cd sample-project;  kustomize build . | kubectl delete -f -
	cd install;  kustomize build . | kubectl delete -f -


#!/bin/bash

helm repo add projectcalico https://docs.tigera.io/calico/charts
helm install calico projectcalico/tigera-operator --version v3.27.5 --namespace tigera-operator --create-namespace

kubectl taint node node1.example.com node-role.kubernetes.io/control-plane:NoSchedule-

kubectl apply -f calico-quay-crd.yaml
kubectl -n calico-system get pod

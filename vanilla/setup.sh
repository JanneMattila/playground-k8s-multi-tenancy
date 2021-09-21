#!/bin/bash

# All the variables for the deployment
subscriptionName="AzureDev"
aadAdminGroupContains="janne''s"

aksName="myvanillaaks"
acrName="myacr0000010"
workspaceName="myvanillaworkspace"
vnetName="myvanillaaks-vnet"
identityName="myvanillaaks"
resourceGroupName="rg-myvanillaaks"
location="northeurope"

# Login and set correct context
az login -o table
az account set --subscription $subscriptionName -o table

subscriptionID=$(az account show -o tsv --query id)
az group create -l $location -n $resourceGroupName -o table

acrid=$(az acr create -l $location -g $resourceGroupName -n $acrName --sku Basic --query id -o tsv)
echo $acrid

aadAdmingGroup=$(az ad group list --display-name $aadAdminGroupContains --query [].objectId -o tsv)
echo $aadAdmingGroup

workspaceid=$(az monitor log-analytics workspace create -g $resourceGroupName -n $workspaceName --query id -o tsv)
echo $workspaceid

subnetid=$(az network vnet create -g $resourceGroupName --name $vnetName \
  --address-prefix 10.0.0.0/8 \
  --subnet-name AksSubnet --subnet-prefix 10.2.0.0/24 \
  --query newVNet.subnets[0].id -o tsv)
echo $subnetid

identityid=$(az identity create --name $identityName --resource-group $resourceGroupName --query id -o tsv)
echo $identityid

az aks get-versions -l $location -o table

az aks create -g $resourceGroupName -n $aksName \
 --zones "1" --max-pods 150 --network-plugin azure \
 --node-count 1 --enable-cluster-autoscaler --min-count 1 --max-count 3 \
 --node-osdisk-type Ephemeral \
 --node-vm-size Standard_D8ds_v4 \
 --kubernetes-version 1.21.2 \
 --enable-addons azure-policy \
 --enable-addons monitoring \
 --enable-aad \
 --enable-managed-identity \
 --aad-admin-group-object-ids $aadAdmingGroup \
 --workspace-resource-id $workspaceid \
 --attach-acr $acrid \
 --vnet-subnet-id $subnetid \
 --assign-identity $identityid \
 -o table 

sudo az aks install-cli

az aks get-credentials -n $aksName -g $resourceGroupName

kubectl get nodes

#------------------------------------------------------------------------------

curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | sudo bash

helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update

helm install banana-nginx-ingress ingress-nginx/ingress-nginx \
  --create-namespace --namespace "banana" \
  --set controller.replicaCount=2 \
  --set controller.ingressClass="nginx-banana" \
  --set controller.useIngressClassOnly=true \
  --set controller.replicaCount=2 \
  --set controller.nodeSelector."kubernetes\.io/os"=linux

kubectl get services banana-nginx-ingress-ingress-nginx-controller -o wide -n banana
kubectl describe services banana-nginx-ingress-ingress-nginx-controller -n banana

helm install orange-nginx-ingress ingress-nginx/ingress-nginx \
  --create-namespace --namespace "orange" \
  --set controller.replicaCount=2 \
  --set controller.ingressClass="nginx-orange" \
  --set controller.useIngressClassOnly=true \
  --set controller.replicaCount=2 \
  --set controller.nodeSelector."kubernetes\.io/os"=linux

kubectl get services orange-nginx-ingress-ingress-nginx-controller -o wide -n orange
kubectl describe services orange-nginx-ingress-ingress-nginx-controller -n orange

k get all -n default
# To remove installation:
helm uninstall banana-nginx-ingress --namespace banana
helm uninstall orange-nginx-ingress --namespace orange

#------------------------------------------------------------------------------

kubectl apply -f banana/*.yaml
kubectl apply -f orange/*.yaml

kubectl get all -n banana
kubectl get all -n orange

# Wipe out the resources
az group delete --name $resourceGroupName -y

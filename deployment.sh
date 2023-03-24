#!/bin/bash

source functions

####################################################################################
###
# This script automatically deploys a Hello World Python app, based on the tutorials of Knative
# This version of the script assumes you run it from your local machine 
###
####################################################################################

####################################################################################
#DISCLAIMER
#This script should only be used for demo or learning purposes and NOT for any kind of production environment. There has been very little focus on subjects like security, redundancy, maintainability or reliability. It comes with absolutely no warrenty.
#Strobodov - 2023 - @ AT Computing
####################################################################################

###
#DEPENDENCIES
###
# you'll need the following tools on your machine:
# - bash
# - kubectl
# - kn
# - azure CLI

#immediately quit the script when something goes wrong
set -e

#capture time of start
printf "\rtimestamp: $(timeStamp) - \e[34mScript started\e[0m\n"

#check if variables are preset
varFileCheck

#login to Azure with User or Service Principal
azureLogin

#check what type of user is logged in
if [[ $(az account show --query [user.type] --output tsv) -eq 'user' ]]
then
    createServicePrincipal
fi

#log out with user
az logout

#log in with Service Principal
loginServicePrincipal

#create resource group
createResourceGroup

#create AKS Cluster
createKubernetesCluster

#deploy Knative
deployKnative

#create Azure Container Registry
createACR

###
#build the App container
###

#build the container using Podman (of you can also use Docker if you like)
imageID=$(podman build \
--tag $imageName:$imageTag \
helloworld/ \
--no-cache \
--quiet)

###########
#If you are using Docker, you'll have to login first to push to ACR. Docker does not have the --creds flag for the push command.
#echo "$acrCred" | sudo docker login \
#--username $registryName \
#--password-stdin \
#$registryName.azurecr.io \
#--log-level fatal
###########

#call function to push container to ACR
pushContainer

#check Azure container digest
azureDigest=$(az acr repository show \
--name $registryName \
--image $imageName:$imageTag \
--query "digest" \
--output tsv)

#get local digest that is created by podman and check if it matches with the digest in Azure
localDigest=$(cat containerDigest)
if (test $localDigest == $azureDigest)
  then 
    echo -e "timestamp: $(date +%H:%M:%S) - \e[34mDigests Match. All is good\e[0m"
  else 
    echo "WARNING: digests are different"
fi

#create a namespace for Knative
kubectl create ns $k8sNamespace

echo -e "timestamp: $(date +%H:%M:%S) - \e[34mNamespace for app created\e[0m"

#make namespace default for all other commands
kubectl config set-context --current --namespace=$k8sNamespace

#create a pull secrey in Kubernetes. It all is called after Docker, but it also works with other registries
kubectl create secret docker-registry $pullSecretName \
--docker-server=https://$registryName.azurecr.io \
--docker-username=$registryName \
--docker-password="$acrCred"

#apply Knative service. This should deploy the Hello World application
kn service create $appName --image=$registryName.azurecr.io/$imageName:$imageTag --env TARGET="$appMessage" --pull-secret $pullSecretName --force

#open the app in browser
firefox $(kn service describe helloworld -o url)

#print elased time since start of script
endTime=$(date +%s)
elapsedTime=$(( $endTime - $startTime))
elapsedMinutes=$(( $elapsedTime / 60 ))
elapsedSeconds=$(( $elapsedTime % 60 ))
echo "Script ran in $elapsedMinutes minutes and $elapsedSeconds seconds"
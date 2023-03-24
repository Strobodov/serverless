# Demo project for running a serverless workload on Kubernetes

![Author](https://img.shields.io/badge/guru-marcel%20kornegoor-3399cc.svg?logo=data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4KPHN2ZyB2ZXJzaW9uPSIxLjEiIHZpZXdCb3g9IjAgMCAzMiAzMiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPGRlZnM+CjxjbGlwUGF0aCBpZD0iYSI+CjxwYXRoIGQ9Im0wIDI0NS41aDM4OC44NnYtMjQ1LjVoLTM4OC44NnoiLz4KPC9jbGlwUGF0aD4KPC9kZWZzPgo8ZyB0cmFuc2Zvcm09Im1hdHJpeCguMTgxMzcgMCAwIC0uMTgxMzcgLTE4LjYzMyAzOC41OTkpIiBjbGlwLXBhdGg9InVybCgjYSkiPgo8ZyB0cmFuc2Zvcm09InRyYW5zbGF0ZSgxOTEuMjkgNDAuODcyKSI+CjxwYXRoIGQ9Im0wIDBjNDUuODU1IDAgODMuMTYyIDM3LjMwNiA4My4xNjIgODMuMTYyIDAgNDUuODU1LTM3LjMwNyA4My4xNjItODMuMTYyIDgzLjE2Mi00NS44NTQgMC04My4xNjItMzcuMzA3LTgzLjE2Mi04My4xNjIgMC00NS44NTYgMzcuMzA4LTgzLjE2MiA4My4xNjItODMuMTYyIiBmaWxsPSIjZmZmIi8+CjwvZz4KPGcgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoMjAyLjI2IDEwMi40KSI+CjxwYXRoIGQ9Im0wIDAtMjguMDIzIDUyLjc4NmMxLjQxNC0yLjg0IDEuNTAyLTYuMjg4LTAuMDk5LTkuMzAzbC05LjAwMi0xNi45NiAxOS4xNDYtMzYuMDY4YzEuODMtMy40NDMgNS4zNTQtNS40MDYgOC45OTktNS40MDYgMS42MDkgMCAzLjI0MSAwLjM4NCA0Ljc2MyAxLjE5MSA0Ljk2MyAyLjYzNSA2Ljg1MSA4Ljc5NCA0LjIxNiAxMy43NiIgZmlsbD0iIzllYzllZCIvPgo8L2c+CjxnIHRyYW5zZm9ybT0idHJhbnNsYXRlKDE2MC4zNyAxNTkuNikiPgo8cGF0aCBkPSJtMCAwYzQuOTY4IDIuNjM1IDExLjEyNiAwLjc0NyAxMy43Ni00LjIxNmwwLjEwNS0wLjJjLTAuOTEzIDEuODM2LTIuMzY2IDMuNDIyLTQuMzE1IDQuNDU3LTQuOTYgMi42MzUtMTEuMTI0IDAuNzQ4LTEzLjc1OS00LjIxN2wtMjguMTI3LTUyLjk4NGMtMi42MzctNC45NjUtMC43NDgtMTEuMTI0IDQuMjE2LTEzLjc1OSAxLjUyLTAuODA5IDMuMTUzLTEuMTkxIDQuNzYzLTEuMTkxIDMuNjQ0IDAgNy4xNjkgMS45NjMgOC45OTggNS40MDZsMTkuMTIzIDM2LjAyNi04Ljk4MSAxNi45MTdjLTIuNjM2IDQuOTY0LTAuNzQ3IDExLjEyNiA0LjIxNyAxMy43NjEiIGZpbGw9IiMzMTk5Y2MiLz4KPC9nPgo8ZyB0cmFuc2Zvcm09InRyYW5zbGF0ZSgxNzQuMjMgMTU1LjE5KSI+CjxwYXRoIGQ9Im0wIDAtMC4xMDUgMC4xOTljLTIuNjM1IDQuOTYzLTguNzkzIDYuODUxLTEzLjc2MSA0LjIxNi00Ljk2NC0yLjYzNS02Ljg1Mi04Ljc5Ni00LjIxNy0xMy43Nmw4Ljk4MS0xNi45MTggOS4wMDIgMTYuOTZjMS42MDIgMy4wMTUgMS41MTMgNi40NjMgMC4xIDkuMzAzIiBmaWxsPSIjM2M2M2FkIi8+CjwvZz4KPGcgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoMjQ1LjYzIDE2MC44MykiPgo8cGF0aCBkPSJtMCAwaC0xOS42ODljNS42MjEgMCAxMC4xNzctNC41NTYgMTAuMTc3LTEwLjE3N3YtMTAuMTc3aDkuNTEyYzUuNjIxIDAgMTAuMTc4IDQuNTU2IDEwLjE3OCAxMC4xNzdzLTQuNTU3IDEwLjE3Ny0xMC4xNzggMTAuMTc3IiBmaWxsPSIjMzE5OWNjIi8+CjwvZz4KPGcgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoMjI1Ljk0IDE2MC44MykiPgo8cGF0aCBkPSJtMCAwaC0xOS42ODdjLTUuNjIxIDAtMTAuMTc2LTQuNTU2LTEwLjE3Ni0xMC4xNzdzNC41NTUtMTAuMTc3IDEwLjE3Ni0xMC4xNzdoOS41MTF2MTAuMTc3YzAgNS42MjEgNC41NTYgMTAuMTc3IDEwLjE3NiAxMC4xNzciIGZpbGw9IiMzMTk5Y2MiLz4KPC9nPgo8ZyB0cmFuc2Zvcm09InRyYW5zbGF0ZSgyMTUuNzYgOTcuMzY5KSI+CjxwYXRoIGQ9Im0wIDBjMC01LjYyMSA0LjU1Ni0xMC4xNzcgMTAuMTc3LTEwLjE3N3MxMC4xNzcgNC41NTYgMTAuMTc3IDEwLjE3N3Y0My4xMTFoLTIwLjM1NHoiIGZpbGw9IiMzMTk5Y2MiLz4KPC9nPgo8ZyB0cmFuc2Zvcm09InRyYW5zbGF0ZSgyMjUuOTQgMTYwLjgzKSI+CjxwYXRoIGQ9Im0wIDBjLTUuNjIgMC0xMC4xNzYtNC41NTYtMTAuMTc2LTEwLjE3N3YtMTAuMTc3aDIwLjM1NHYxMC4xNzdjMCA1LjYyMS00LjU1NyAxMC4xNzctMTAuMTc4IDEwLjE3NyIgZmlsbD0iIzNjNjNhZCIvPgo8L2c+CjwvZz4KPC9zdmc+Cg==)
![GitHub last commit](https://img.shields.io/github/last-commit/Strobodov/serverless?logo=github)
![GitHub License](https://img.shields.io/github/license/Strobodov/serverless)
![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/Strobodov/serverless?logo=github)
![GitHub top language](https://img.shields.io/github/languages/top/Strobodov/serverless?logo=github)

*This repository contains everything that's needed to demo the working principles and building blocks of a Knative based serverless workload on AKS (Kubernetes)*

>**Warning**
All commands and code used within this repository should be used for demo and learning pursposes only! It may have serious security shortcomings that should NOT be part of your production setup.

# Design Overview
<img src="https://raw.githubusercontent.com/Strobodov/serverless/main/knative_on_k8s.svg">

## Files in this repository
- `deployment.sh`: a complete Bash-script that deploys all steps of this demo automatically (after taking care of some prerequisites)
- `functions` : the (Bash) functions used within the `deployment.sh` Bash-script
- `cleanup.sh`: a Bash-script that cleans up everything that's been created by the deployment script
- `README.md` : the file you're reading now
- licence
- `.var`: file containing all variables that are used within the Bash-scripts
- `.azCred`: contains your Azure credentials. Be very careful with this file and add it to `.gitignore`

# Sources used for this demo

### Knative Hello World App with Python
https://github.com/knative/docs/tree/main/code-samples/serving/hello-world/helloworld-python

### Knative
https://knative.dev
https://github.com/knative

### sslip.io
https://sslip.io/

### kn cli tool
https://knative.dev/docs/client/install-kn/

### Azure CLI
https://learn.microsoft.com/en-us/cli/azure/install-azure-cli
https://github.com/Azure/azure-cli

### kubectl
https://github.com/kubernetes/kubectl

### variables used in .var for this demo
- rgName = name of the Resource Group to be used in Azure
- adminName = name of the admin account for the Jumpbox VM
- location = Azure Region to deploy all resources to
- appName = name to be used for the Azure Service Principal
- clusterName = name of the AKS Cluster
- registryName = name of the Azure Container Registry (ACR)
- imageName = name of the container image to be used
- imageTag = version tag for the container
- pullSecretName = name of the Kubernetes secret to be used for pulling the container image from ACR
- k8sNamespace = name of the Kubernetes namespace to be used by Knative
- appMessage = message to be displayed with the Python app
- appName= name of the Knative app to be deployed

### variables used in .azCred for this demo
- azUsername = your Azure user name
- azPassword = your Azure password
- azSubscription = the Azure subscription you want to uze

### variables used in .spCred for this demo (create this file if you already have a Service Principal, otherwise it will be created during Step 1 of the the DEMO)
- appID = Service Principal application ID
- certName = name (and/or path) of the certificate to authenticate the Service Principal
- tenantID = ID of the tenant used

# How To Guide

### Step 0: prerequisites
- some Linux-distro running Bash
- one of the following Microsoft Azure accounts:
  + User account with `Contributor` role on Subscription or on a Resource Group
  + `Service Principal` account with `Contributor` permissions on Subscription or on a Resource Group
- `az` CLI tool
- `kn` CLI tool
- `kubectl` CLI tool
- `podman` (or `docker`)
- option 1) a file called `.azCred` containing:
  + Azure username
  + Azure password
  + Azure subscription to be used
- option 2) a file called `.spCred` containing:
  + Service Principal App ID
  + Path to Service Principal certificate
  + tenant ID of the Azure environment

### (Optional) Step 1: log in to Azure and deploy jumpbox VM
```
Log in to Azure to deploy a jumbox VM. This step is optional, you can also run all the commands on your local system 
or in a VM you host on some platform of your own choice.
```

source the .azCred and .var files
```bash
source .azCred
source .var
```

Option 1) Log in to Azure and set the Subscription you want to use
```bash
az login \
  --username $azUsername \
  --password $azPassword \
  --output none
az account set \
  --subscription $azSubscription
```

Option 2) create a Service Principal (or log in with it if you have one)
```bash
#get the subscription ID
subscriptionID=$(az account show --query id --output tsv)

#creat the service principal with scope limited to Resource Group
az ad sp create-for-rbac \
  --name $appName \
  --role Contributor \
  --scopes /subscriptions/$subscriptionID/resourceGroups/$rgName \
  --output none

#get AppID for the Service Principal
appID=$(az ad sp list --display-name $appName --query [].appId --output tsv)

printf "\rappID=\"$appID\"\n" >> .spCred

#create a self-signed certificate for the Service Principal and move it to working directory
certPath=$(az ad sp credential reset --id $appID --create-cert --query fileWithCertAndPrivateKey --output tsv)

#move the certificate to the working directory
mv $certPath .

#write the certificate name into .spCred
certName=$(echo $(ls) | grep -o 'tmp.*.pem')
printf "\rcertName=\"$certName\"\n" >> .spCred

#get the Tenant ID
tenantID=$(az account show \
  --query tenantId \
  --output tsv)

#write tenantID to .spCred
printf "\rtenantID=\"$tenantID\"\n" >> .spCred

#log user out
az logout

#log in with Service Principal
az login --service-principal \
    --username $appID \
    --password $certName \
    --tenant $tenantID \
    --output none
```

### Step 2: create a Resource Group and JumpBox VM

```bash
az group create \
  --name $rgName \
  --location $location \
  --output none
```

```bash
az vm create \
--name jumpbox \
--resource-group $rgName \
--admin-user $adminName \
--generate-ssh-key \
--image Canonical:0001-com-ubuntu-server-jammy:22_04-lts:22.04.202204200 \
--size Standard_B2ms \
--output none
```

get jumpbox VM IP address
```bash
jumpBoxIP=$(az vm list-ip-addresses \
--resource-group $rgName \
--name jumpbox \
--query [].virtualMachine.network.publicIpAddresses[0].ipAddress \
--output tsv)
```

copy your azure credentials and helloworld directory to the jumpbox VM:
```bash
scp -r .spCred .var helloworld $adminName@$jumpBoxIP:/home/knative
```
connect to the jumpbox via ssh (might prompt for confirmation because of connection to new remote server)
```bash
ssh $adminName@$jumpBoxIP
```

### Step 3: install CLI tools on jumpbox

**kn**
```bash
curl https://storage.googleapis.com/knative-nightly/client/latest/kn-linux-amd64 --output kn
chmod +x kn
sudo mv kn /usr/local/bin
```

**Azure CLI**
```bash
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
```

**kubectl**
```bash
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
```

**Podman**
```bash
sudo apt-get -y install podman
```

### Step 4: log in to Azure from jumpbox with Service Principal
```bash
source .spCred
source .var
az login --service-principal \
  --username $appID \
  --password $certName \
  --tenant $tenantID \
  --output none
```
**make sure you're in the right subscription**
```bash
az account set --subscription $Subscription
```
### Step 5: create single node AKS cluster

**First, select the latest available AKS versions available in your location**
```bash
aksVersion=$(az aks get-versions \
  --location $location \
  --output tsv \
  --query 'max_by(orchestrators[], &orchestratorVersion).orchestratorVersion')
```
**Deploy the cluster**
```bash
az aks create \
--name $clusterName \
--resource-group $rgName \
--kubernetes-version $aksVersion \
--node-count 1 \
--node-vm-size Standard_D2_v3 \
--generate-ssh-keys
```

**Get AKS credentials for use with `kubectl`**
```bash
az aks get-credentials --resource-group $rgName --name $clusterName
```

### Step 6: Deploy knative on Kubernetes

**install knative serving crds and core**
```bash
kubectl apply -f https://github.com/knative/serving/releases/latest/download/serving-crds.yaml
kubectl apply -f https://github.com/knative/serving/releases/latest/download/serving-core.yaml
```

**install Kourier for networking**
```bash
kubectl apply -f https://github.com/knative/net-kourier/releases/latest/download/kourier.yaml
```

**deploy Knative Serving to use Kourier by default**
```bash
kubectl patch configmap/config-network --namespace knative-serving --type merge --patch '{"data":{"ingress-class":"kourier.ingress.networking.knative.dev"}}'
```

**deploy Serving Default Domain for service with sslip.io**
```bash
kubectl apply -f https://github.com/knative/serving/releases/latest/download/serving-default-domain.yaml
```

### Step 7: create Azure Container Registry (ACR)

**Check if name is available (name must be globally unique). This will return `true` (available) or `false` (unavailable)**
```bash
az acr check-name --name $registryName --query nameAvailable --output tsv
```

**create ACR**
```bash
az acr create \
--name $registryName \
--resource-group $rgName \
--sku Standard \
--location $location \
--zone-redundancy Disabled \
--output none
```

**enable admin account**
>**Warning** be carefull with providing admin access to the registry!
```bash
az acr update \
--name $registryName \
--admin-enabled true \
--anonymous-pull-enabled false \
--output none
```

**get registry credentials for pushing containers and create shell variable**
>**Warning** be carefull you don't loose these credentials

```bash
acrCred=$(az acr credential show \
--name $registryName \
--query passwords[0].value \
--output tsv)
```

### Step 8: build and push container with Docker

**Change Directory to `helloworld`**
```bash
cd helloworld
```

**If you use Docker instead of Podman, you need to log in to the Azure Container Registry**

*this is needed to make use of the private container registry* 
```bash
echo $acrCred | sudo docker login \
--username $registryName \
--password-stdin \
$registryName.azurecr.io
```

**build the container using the Dockerfile**
```bash
podman build -t $imageName:$imageTag .
```
**push container to ACR**
```bash
podman push $registryName:$acrCred $imageName:$imageTag azurecr.io/$imageName:$imageTag
```
## Step 9: deploy the container to Knative

**create a pull secret in Kubernetes**
>**Note** docker-server value needs to be FQDN including https://
```bash
kubectl create secret docker-registry $pullSecretName \ 
  --docker-server=https://$registryName.azurecr.io \ 
  --docker-username=$registryName \ 
  --docker-password=$acrCred
```

**create a namespace for Knative**
```bash
kubectl create ns $k8sNamespace
```

**make namespace default for all other commands**
```bash
kubectl config set-context --current --namespace=$k8sNameSpace
```

**edit service.yaml to set values**

Make sure that, in the `service.yaml` file, the following things are correct and alligned with the values you've chosen during this tutorial:

```yaml
apiVersion: serving.knative.dev/v1
kind: Service
metadata:
  name: **<service name>**
  namespace: **<name for namespace>**
spec:
  template:
    spec:
      containers:
      - image: **<registry name>.azurecr.io/<image name>:<tag>**
        env:
        - name: TARGET
          value: **"<your text here>"**
      imagePullSecrets:
      - name: **<secret name>**
```

### There are now two ways to create a Knative service for the helloworld app

#### 1: use `service.yaml` template with `kubectl`
```bash
kubectl apply --filename service.yaml
```
**get information about the service and show the URL**
```bash
kn service describe <service name>
```

#### 2: use `kn` to deploy the service with the CLI
>**Note** If you want to overwrite the previous deployment of the `helloworld` service, add the `--force` flag. the `--env TARGET=""` flag is optional. When left out, the Python app will use the default as defined in the source code.
```bash
kn service create $appName \
--image $registryName.azurecr.io/$imageName:$imageTag \ 
--pull-secret $pullSecretName \
--env TARGET="$appMessage"
```
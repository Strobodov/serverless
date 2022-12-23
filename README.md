# Demo project for running a serverless workload on Kubernetes

![Author](https://img.shields.io/badge/guru-marcel%20kornegoor-3399cc.svg?logo=data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4KPHN2ZyB2ZXJzaW9uPSIxLjEiIHZpZXdCb3g9IjAgMCAzMiAzMiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPGRlZnM+CjxjbGlwUGF0aCBpZD0iYSI+CjxwYXRoIGQ9Im0wIDI0NS41aDM4OC44NnYtMjQ1LjVoLTM4OC44NnoiLz4KPC9jbGlwUGF0aD4KPC9kZWZzPgo8ZyB0cmFuc2Zvcm09Im1hdHJpeCguMTgxMzcgMCAwIC0uMTgxMzcgLTE4LjYzMyAzOC41OTkpIiBjbGlwLXBhdGg9InVybCgjYSkiPgo8ZyB0cmFuc2Zvcm09InRyYW5zbGF0ZSgxOTEuMjkgNDAuODcyKSI+CjxwYXRoIGQ9Im0wIDBjNDUuODU1IDAgODMuMTYyIDM3LjMwNiA4My4xNjIgODMuMTYyIDAgNDUuODU1LTM3LjMwNyA4My4xNjItODMuMTYyIDgzLjE2Mi00NS44NTQgMC04My4xNjItMzcuMzA3LTgzLjE2Mi04My4xNjIgMC00NS44NTYgMzcuMzA4LTgzLjE2MiA4My4xNjItODMuMTYyIiBmaWxsPSIjZmZmIi8+CjwvZz4KPGcgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoMjAyLjI2IDEwMi40KSI+CjxwYXRoIGQ9Im0wIDAtMjguMDIzIDUyLjc4NmMxLjQxNC0yLjg0IDEuNTAyLTYuMjg4LTAuMDk5LTkuMzAzbC05LjAwMi0xNi45NiAxOS4xNDYtMzYuMDY4YzEuODMtMy40NDMgNS4zNTQtNS40MDYgOC45OTktNS40MDYgMS42MDkgMCAzLjI0MSAwLjM4NCA0Ljc2MyAxLjE5MSA0Ljk2MyAyLjYzNSA2Ljg1MSA4Ljc5NCA0LjIxNiAxMy43NiIgZmlsbD0iIzllYzllZCIvPgo8L2c+CjxnIHRyYW5zZm9ybT0idHJhbnNsYXRlKDE2MC4zNyAxNTkuNikiPgo8cGF0aCBkPSJtMCAwYzQuOTY4IDIuNjM1IDExLjEyNiAwLjc0NyAxMy43Ni00LjIxNmwwLjEwNS0wLjJjLTAuOTEzIDEuODM2LTIuMzY2IDMuNDIyLTQuMzE1IDQuNDU3LTQuOTYgMi42MzUtMTEuMTI0IDAuNzQ4LTEzLjc1OS00LjIxN2wtMjguMTI3LTUyLjk4NGMtMi42MzctNC45NjUtMC43NDgtMTEuMTI0IDQuMjE2LTEzLjc1OSAxLjUyLTAuODA5IDMuMTUzLTEuMTkxIDQuNzYzLTEuMTkxIDMuNjQ0IDAgNy4xNjkgMS45NjMgOC45OTggNS40MDZsMTkuMTIzIDM2LjAyNi04Ljk4MSAxNi45MTdjLTIuNjM2IDQuOTY0LTAuNzQ3IDExLjEyNiA0LjIxNyAxMy43NjEiIGZpbGw9IiMzMTk5Y2MiLz4KPC9nPgo8ZyB0cmFuc2Zvcm09InRyYW5zbGF0ZSgxNzQuMjMgMTU1LjE5KSI+CjxwYXRoIGQ9Im0wIDAtMC4xMDUgMC4xOTljLTIuNjM1IDQuOTYzLTguNzkzIDYuODUxLTEzLjc2MSA0LjIxNi00Ljk2NC0yLjYzNS02Ljg1Mi04Ljc5Ni00LjIxNy0xMy43Nmw4Ljk4MS0xNi45MTggOS4wMDIgMTYuOTZjMS42MDIgMy4wMTUgMS41MTMgNi40NjMgMC4xIDkuMzAzIiBmaWxsPSIjM2M2M2FkIi8+CjwvZz4KPGcgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoMjQ1LjYzIDE2MC44MykiPgo8cGF0aCBkPSJtMCAwaC0xOS42ODljNS42MjEgMCAxMC4xNzctNC41NTYgMTAuMTc3LTEwLjE3N3YtMTAuMTc3aDkuNTEyYzUuNjIxIDAgMTAuMTc4IDQuNTU2IDEwLjE3OCAxMC4xNzdzLTQuNTU3IDEwLjE3Ny0xMC4xNzggMTAuMTc3IiBmaWxsPSIjMzE5OWNjIi8+CjwvZz4KPGcgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoMjI1Ljk0IDE2MC44MykiPgo8cGF0aCBkPSJtMCAwaC0xOS42ODdjLTUuNjIxIDAtMTAuMTc2LTQuNTU2LTEwLjE3Ni0xMC4xNzdzNC41NTUtMTAuMTc3IDEwLjE3Ni0xMC4xNzdoOS41MTF2MTAuMTc3YzAgNS42MjEgNC41NTYgMTAuMTc3IDEwLjE3NiAxMC4xNzciIGZpbGw9IiMzMTk5Y2MiLz4KPC9nPgo8ZyB0cmFuc2Zvcm09InRyYW5zbGF0ZSgyMTUuNzYgOTcuMzY5KSI+CjxwYXRoIGQ9Im0wIDBjMC01LjYyMSA0LjU1Ni0xMC4xNzcgMTAuMTc3LTEwLjE3N3MxMC4xNzcgNC41NTYgMTAuMTc3IDEwLjE3N3Y0My4xMTFoLTIwLjM1NHoiIGZpbGw9IiMzMTk5Y2MiLz4KPC9nPgo8ZyB0cmFuc2Zvcm09InRyYW5zbGF0ZSgyMjUuOTQgMTYwLjgzKSI+CjxwYXRoIGQ9Im0wIDBjLTUuNjIgMC0xMC4xNzYtNC41NTYtMTAuMTc2LTEwLjE3N3YtMTAuMTc3aDIwLjM1NHYxMC4xNzdjMCA1LjYyMS00LjU1NyAxMC4xNzctMTAuMTc4IDEwLjE3NyIgZmlsbD0iIzNjNjNhZCIvPgo8L2c+CjwvZz4KPC9zdmc+Cg==)
![GitHub last commit](https://img.shields.io/github/last-commit/Strobodov/serverless?logo=github)
![GitHub License](https://img.shields.io/github/license/Strobodov/serverless)
![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/Strobodov/serverless?logo=github)
![GitHub top language](https://img.shields.io/github/languages/top/Strobodov/serverless?logo=github)

*This repository contains everything that's needed to demo the working principles and building blocks of a Knative based serverless workload on AKS (Kubernetes)*

>**Warning**
All commands and code used within this repository should be used for demo and learning pursposes only! It has some serious security shortcomings that should NOT be part of your production setup.

# Design Overview
<img src="https://raw.githubusercontent.com/Strobodov/serverless/main/knative_on_k8s.svg">

## Files in this repository
- deployment.sh: a complete Bash-script that deploys all steps of this demo automatically (after taking care of some prerequisites)
- cleanup.sh: a Bash-script that cleans up everything that's been created by the deployment script
- README.md
- licence
- variables: file containing all variables that are used within the Bash-scripts
- 

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

# How To Guide

### Step 0: prerequisites
- some Linux-distro running Bash (the demo uses Ubunutu 22.04 LTS)
- an Microsoft Azure account with Contributor role on a Subription or Resource Group
- az cli
- kn cli
- kubectl cli
- docker (or podman)
- creation of a file called `.az_cred` containing:
  + Azure username
  + Azure password
  + Azure Subscription name

### (Optional) Step 1: log in to Azure and deploy jumpbox VM
```
Log in to Azure to deploy a *jumbox* VM. This step is optional, you can also run all the commands on your local system 
or in a VM you host on some platform of your own choice.
```
```bash
az login --username <username> --password <password> --output none
```

```bash
az group create -n <rg_name> -l <location> --output none
```

```bash
az vm create \
--name jumpbox \
--resource-group <rg_name> \
--admin-user knative \
--generate-ssh-key \
--image Canonical:0001-com-ubuntu-server-jammy:22_04-lts:22.04.202204200 \
--size Standard_B2ms \
--output none
```

get jumpbox VM IP address
```bash
az vm list-ip-addresses \
--resource-group <rg_name> \
--name jumpbox \
--query [].virtualMachine.network.publicIpAddresses[0].ipAddress \
--output tsv
```

copy your azure credentials and helloworld directory to the jumpbox VM:
```bash
scp -r .az_cred helloworld knative@<jumpbox public IP>:/home/knative
```
connect to the jumpbox via ssh
```bash
ssh knative@<jumpbox public IP>
```

### Step 2: install CLI tools

**kn**
```bash
curl https://storage.googleapis.com/knative-nightly/client/latest/kn-linux-amd64 --output kn
```

```bash
chmod +x kn
```

```bash
sudo mv kn /usr/local/bin
```

```bash
kn version
```

**Azure CLI**
```bash
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
```

```bash
az --version
```

**kubectl**
```bash
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
```

```bash
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
```

```bash
kubectl version --client --output=yaml
```

**Docker**
```bash
sudo apt install docker.io -y
```

```bash
docker --version
```
### Step 3: log in to Azure from jumpbox
```bash
source .az_cred
```
```bash
az login -u $az_username -p $az_password
```
**make sure you're in the right subscription**
```bash
az account set --subscription $Subscription
```
### Step 4: create single node AKS cluster

**First, get actual versions available in your location**
```bash
az aks get-versions --location <location> --output table
```
**Deploy the cluster**
```bash
az aks create \
--name knative \
--resource-group <rg_name> \
--kubernetes-version <your version> \
--node-count 1 \
--node-vm-size Standard_D2_v3
```

**Get AKS credentials for use with `kubectl`**
```bash
az aks get-credentials --resource-group <rg_name> --name knative
```

### Step 5: Deploy knative on Kubernetes

**install knative serving crds and core**
```bash
kubectl apply -f https://github.com/knative/serving/releases/latest/download/serving-crds.yaml
```

```bash
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

### Step 6: create Azure Container Registry (ACR)

**Check if name is available (name must be globally unique). This will return `true` (available) or `false` (unavailable)**
```bash
az acr check-name --name <registry name> --query nameAvailable --output tsv
```

**create ACR**
```bash
az acr create \
--name <registry name> \
--resource-group <rg_name> \
--sku Standard \
--location <location> \
--zone-redundancy Disabled \
--output none
```

**enable admin account**
>**Warning** be carefull with providing admin access to the registry!
```bash
az acr update \
--name <registry name> \
--admin-enabled true \
--anonymous-pull-enabled false \
--output none
```

**get registry credentials for pushing containers and create shell variable**
>**Warning** be carefull you don't loose these credentials

```bash
acr_cred=$(az acr credential show \
--name <registry name> \
--query passwords[0].value \
--output tsv)
```

### Step 7: build and push container with Docker

**Log in to Azure Container Registry from Docker**
```bash
sudo docker login \
--username <registry name> \
--password $acr_cred \
<registry name>.azurecr.io
```

**build the container**
```bash
sudo docker build -t <image name>:<tag> .
```
**tag the image. This tag needs to contain the URL of ACR.**
>**Note** The local image name and tag doesn't need to be the same as ACR name and tag
```bash
sudo docker image tag <image name>:<tag> <registry name>.azurecr.io/<image name>:<tag>
```

**push container to ACR**
```bash
sudo docker image push <registry name>.azurecr.io/<image name>:<tag>
```
## Step 8: deploy the container on Knative

**create a pull secret in Kubernetes**
```bash
kubectl create secret docker-registry <secret name> \ 
--docker-server=<registry name>.azurecr.io \ 
--docker-username=<registry name> \ 
--docker-password=$acr_cred
```

**create a namespace for Knative**
```bash
kubectl create ns <name for namespace>
```

**make namespace default for all other commands**
```bash
kubectl config set-context --current --namespace=<name for namespace>
```

**edit service.yaml to set values**

Make sure that, in the `service.yaml` file, the following things are correct and alligned with the values you've chosen during this tutorial:

```
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
      -  name: **<secret name>**
```

**apply service.yaml to Kubernetes**
```bash
kubectl apply --filename service.yaml
```

**create Knative service for the serverless app**
```bash
kn service create <service name> --image=<registry name>.azurecr.io/<image name>:<tag> --env TARGET="<choose a text you like>"
```

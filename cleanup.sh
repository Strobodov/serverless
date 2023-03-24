#!/bin/bash

source functions

####################################################################################
#DISCLAIMER
#This script should only be used for testing and NOT for any kind of production environment. There has been no focus on any subject regarding security, redundancy or reliability!
#Strobodov - 2022 - @AT Computing
####################################################################################

#read variables from config file. 
source .var
source .azCred

#login to Azure using AZ CLI
az login \
--username $azUsername \
--password $azPassword \
--output none

#make sure you use the right subscription
az account set \
--subscription $subscription

#define name of the resource group and Azure region you want to deploy in. (see Azure documentation for current list of options)
az group delete \
--name $rgName \
--yes \
--no-wait

echo -e "timestamp: $(date +%H:%M:%S) - \e[34mIt's all gone\e[0m"

#print elased time since start of script
endTime=$(date +%s)
elapsedTime=$(( $endTime - $startTime))
elapsedMinutes=$(( $elapsedTime / 60 ))
elapsedSeconds=$(( $elapsedTime % 60 ))
echo "Script ran in $elapsedMinutes minutes and $elapsedSeconds seconds"
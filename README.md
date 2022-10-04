# Terraform Azure Bare Metal Kubernetes

Provisioning of a bare metal K8S cluster with Terraform on Azure

This code will provision a cluster with 2 nodes ( change the VM quantity in the variable.tf file if wanted )

Hit the following commands to start:

```
terraform init
terraform plan
terraform apply
``` 

#### Pay attention to the local_exec as it supposed to locally lunch X terminal windows on MacOS and ssh in each one of them to the VM.


variable "region" {
  type        = string
  default     = "West Europe"
  description = "Location"
}
variable "rg_name" {
  type        = string
  default     = "myRg"
  description = "Resource group name"
}
variable "vm_size" {
  type        = string
  default     = "Standard_D2s_v3"
  description = "Virtual Machine size"
}
variable "username" {
  type        = string
  default     = "moody"
  description = "Virtual Machine size"
}
variable "keypath" {
  type        = string
  default     = "~/.ssh/id_rsa.pub"
  description = "ssh key path"
}

variable "pem" {
  type        = string
  default     = "~/.ssh/id_rsa"
  description = "ssh private key"
}

variable "vm_qty" {
  type        = string
  default     = "2"
  description = "VMs Qunatity"
}

variable "network_name" {
  type        = string
  default     = "maNetwork"
  description = "init node script for k8s"
}

variable "ip_name" {
  type        = string
  default     = "maIP"
  description = "init node script for k8s"
}

variable "nic_name" {
  type        = string
  default     = "maNIC"
  description = "network interface name"
}

variable "subnet_name" {
  type        = string
  default     = "maSB"
  description = "subnet name"
}
variable "vm_name" {
  type        = string
  default     = "K8S"
  description = "virtual machine name"
}

variable "sg_name" {
  type        = string
  default     = "maSG"
  description = "security group name"
}


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
  default     = "3"
  description = "VMs Qunatity"
}

variable "master_script" {
  type        = string
  default     = "https://gist.github.com/moodyomar/8baed3dd0a2c774066989a2f859657c3/raw/543abc0ef8c339ede2b2101f7a08502ff3d7f309/intimater.sh"
  description = "init master script for k8s"
}

variable "node_script" {
  type        = string
  default     = "https://gist.github.com/moodyomar/afe0ca0b354dd9278f3b3d58ac38e568/raw/c1547797a918719aeddb726d2b42794e3cc3378f/initnode.sh"
  description = "init node script for k8s"
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


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

variable "get_master_script" {
  type        = string
  default     = "wget https://gist.github.com/moodyomar/8baed3dd0a2c774066989a2f859657c3/raw/543abc0ef8c339ede2b2101f7a08502ff3d7f309/intimater.sh && chmod +x intimater.sh"
  description = "init master script for k8s"
}

variable "get_node_script" {
  type        = string
  default     = "wget https://gist.github.com/moodyomar/afe0ca0b354dd9278f3b3d58ac38e568/raw/c1547797a918719aeddb726d2b42794e3cc3378f/initnode.sh && chmod +x initnode.sh"
  description = "init node script for k8s"
}
variable "apply_aliases" {
  type        = string
  default     = "wget https://gist.github.com/moodyomar/b95f9cc09d90581f19caa9295b874b53/raw/607573858498829b7489a53d594b91391047717e/.bash_aliases"
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


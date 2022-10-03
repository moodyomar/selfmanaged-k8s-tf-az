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


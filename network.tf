# Create a virtual network within the resource group
resource "azurerm_virtual_network" "network" {
  name                = var.network_name
  resource_group_name = var.rg_name
  location            = var.region
  address_space       = ["12.0.0.0/16"]
}

resource "azurerm_network_security_group" "sg" {
  name                = var.sg_name
  resource_group_name = var.rg_name
  location            = var.region

  security_rule {
    name                       = "SSH"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "Kubernetes API server"
    priority                   = 101
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "6443"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "Kubelet API"
    priority                   = 102
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "10250"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "kube-scheduler"
    priority                   = 103
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "10259"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "kube-controller-manager"
    priority                   = 104
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "10257"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "etcd server client API"
    priority                   = 105
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "2379"
    destination_port_range     = "2380"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = {
    environment = "MyProduction"
  }
}

resource "azurerm_subnet" "sb" {
  name                 = var.subnet_name
  resource_group_name  = var.rg_name
  virtual_network_name = var.network_name
  address_prefixes     = ["12.0.2.0/24"]
}

resource "azurerm_network_interface" "nic" {
  name                = "${var.nic_name}${count.index}"
  resource_group_name = var.rg_name
  location            = var.region
  count               = var.vm_qty

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.sb.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = element(azurerm_public_ip.ip.*.id, count.index)
  }
}

resource "azurerm_public_ip" "ip" {
  name                = "${var.ip_name}${count.index}"
  count               = var.vm_qty
  resource_group_name = var.rg_name
  location            = var.region
  allocation_method   = "Static"

  tags = {
    environment = "Production"
  }
}

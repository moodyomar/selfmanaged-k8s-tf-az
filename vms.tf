resource "azurerm_linux_virtual_machine" "vm" {
  name                = "myVM${count.index}"
  count               = var.vm_qty
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  size                = var.vm_size
  admin_username      = "${var.username}${count.index}"
  network_interface_ids = [
    element(azurerm_network_interface.nic.*.id, count.index),
  ]

  admin_ssh_key {
    username   = "${var.username}${count.index}"
    public_key = file(var.keypath)
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts-gen2"
    version   = "latest"
  }

  connection {
    type        = "ssh"
    user        = "${var.username}${count.index}"
    private_key = file(var.pem)
    host        = element(azurerm_public_ip.ip.*.ip_address, count.index)
  }

  provisioner "remote-exec" {
    inline = [
      "wget https://gist.github.com/moodyomar/8baed3dd0a2c774066989a2f859657c3/raw/543abc0ef8c339ede2b2101f7a08502ff3d7f309/intimater.sh",
      "wget https://gist.github.com/moodyomar/afe0ca0b354dd9278f3b3d58ac38e568/raw/c1547797a918719aeddb726d2b42794e3cc3378f/initnode.sh",
      "chmod +x intimater.sh",
      "chmod +x initnode.sh",
      "./intimater.sh",
    ]
  }

#   provisioner "local-exec" {
#     command = "ssh -i "${var.pem}" ${var.username}@${element(azurerm_public_ip.ip.*.ip_address, count.index)}"
#   }


}


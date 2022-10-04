resource "azurerm_linux_virtual_machine" "vm" {
  name                = "${var.vm_name}${count.index}"
  count               = var.vm_qty
  resource_group_name = var.rg_name
  location            = var.region
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
      "${var.get_master_script}",
      "${var.get_node_script}",
      "${var.apply_aliases}",
      "./intimater.sh",
    ]
  }

  #  open new Terminal window on mac and run an SSH command in it to the server(s)
  provisioner "local-exec" {
    command = "osascript -e 'tell app \"Terminal\" to do script \"ssh -o StrictHostKeyChecking=no -i '${var.pem}' ${var.username}${count.index}@${element(azurerm_public_ip.ip.*.ip_address, count.index)}\"'"
  }
}

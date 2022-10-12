resource null_resource "playbook_runner" {

  depends_on = [
    azurerm_linux_virtual_machine.Mastervm,
    azurerm_linux_virtual_machine.vm
  ]

  provisioner "local-exec" {
    command = "ansible-playbook ./Ansible/playbook.yaml -i ./Ansible/inventory"
  }
}

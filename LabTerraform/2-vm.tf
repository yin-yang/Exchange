resource "azurerm_virtual_machine" "exc" {
  name                  = "${var.prefix}-mbx-${count.index+1}"
  location              = "${var.location}"
  resource_group_name   = "${azurerm_resource_group.rg.name}"
  network_interface_ids = ["${azurerm_network_interface.lanexc.id}"]
  vm_size               = "${var.vm_mailbox_size}"
  count                 = 1

  os_profile_windows_config {
    enable_automatic_upgrades = false
    provision_vm_agent        = true
  }

  storage_image_reference {
    publisher = "MicrosoftWindowsServer"

    offer = "WindowsServer"

    sku = "2016-Datacenter"

    version = "latest"
  }

  storage_os_disk {
    name              = "${count.index+1}exosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name = "${var.prefix}-lan-mbx-${count.index+1}"

    admin_username = "${var.admin_username}"

    admin_password = "${var.admin_password}"
  }
}

resource "azurerm_virtual_machine" "dcs" {
  name                  = "${var.prefix}-dc-${count.index+1}"
  location              = "${var.location}"
  resource_group_name   = "${azurerm_resource_group.rg.name}"
  network_interface_ids = ["${azurerm_network_interface.landcs.id}"]
  vm_size               = "${var.vm_size}"
  count                 = 1

  os_profile_windows_config {
    enable_automatic_upgrades = false
    provision_vm_agent        = true
  }

  storage_image_reference {
    publisher = "MicrosoftWindowsServer"

    offer = "WindowsServer"

    sku = "2016-Datacenter"

    version = "latest"
  }

  storage_os_disk {
    name              = "${count.index+1}dcosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name = "${var.prefix}-lan-dc-${count.index+1}"

    admin_username = "${var.admin_username}"

    admin_password = "${var.admin_password}"
  }
}

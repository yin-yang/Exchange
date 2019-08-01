# Configure the Azure Provider
provider "azurerm" {}

# Create a resource group
resource "azurerm_resource_group" "rg" {
  name     = "${var.resourcegroup}"
  location = "${var.location}"
}

resource "azurerm_virtual_network" "vN" {
  name                = "${var.prefix}-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = "${azurerm_resource_group.rg.location}"
  resource_group_name = "${azurerm_resource_group.rg.name}"
  dns_servers         = ["10.0.1.5"]
}

resource "azurerm_subnet" "subnet" {
  name                 = "lan"
  address_prefix       = "10.0.1.0/24"
  virtual_network_name = "${azurerm_virtual_network.vN.name}"
  resource_group_name  = "${azurerm_resource_group.rg.name}"
}


resource "azurerm_public_ip" "dc" {
  name                = "${var.prefix}-${count.index+1}-pip"
  location            = "${azurerm_resource_group.rg.location}"
  resource_group_name = "${azurerm_resource_group.rg.name}"
  allocation_method   = "Static"
  count               = 1
}

resource "azurerm_public_ip" "exc" {
  name                = "${var.prefix}-exc-${count.index+1}-pip"
  location            = "${azurerm_resource_group.rg.location}"
  resource_group_name = "${azurerm_resource_group.rg.name}"
  allocation_method   = "Static"
  count               = 1
}



# Create a Network Security Group with some rules
resource "azurerm_network_security_group" "dc" {
  name                = "${var.prefix}-dc-nsg"
  location            = "${azurerm_resource_group.rg.location}"
  resource_group_name = "${azurerm_resource_group.rg.name}"
  count               = 1


  security_rule {
    name                       = "allow_RDP"
    description                = "Allow RDP access"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}
resource "azurerm_network_security_group" "exc" {
  name                = "${var.prefix}-exc-nsg"
  location            = "${azurerm_resource_group.rg.location}"
  resource_group_name = "${azurerm_resource_group.rg.name}"
  count               = 1

  security_rule {
    name                       = "allow_HTTP"
    description                = "Allow HTTP access"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "allow_HTTPS"
    description                = "Allow HTTPS access"
    priority                   = 105
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "allow_RDP"
    description                = "Allow RDP access"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

# Nic Lan Exchange
resource "azurerm_network_interface" "lanexc" {
  name                = "${var.prefix}-lan-exc${count.index+1}nic1"
  location            = "${azurerm_resource_group.rg.location}"
  resource_group_name = "${azurerm_resource_group.rg.name}"
  network_security_group_id = "${azurerm_network_security_group.exc.id}"
  count               = 1
  

  ip_configuration {
    name                          = "ip_Configuration"
    subnet_id                     = "${azurerm_subnet.subnet.id}"
    private_ip_address            = "10.0.1.6"
    private_ip_address_allocation = "static"
    public_ip_address_id = "${azurerm_public_ip.dc.id}"
  }
}

# Nic LAN Domain controller 
resource "azurerm_network_interface" "landcs" {
  name                = "${var.prefix}-lan-dc${count.index+1}nic1"
  location            = "${azurerm_resource_group.rg.location}"
  resource_group_name = "${azurerm_resource_group.rg.name}"
  count               = 1
  network_security_group_id = "${azurerm_network_security_group.dc.id}"

  ip_configuration {
    name                          = "ip_Configuration"
    subnet_id                     = "${azurerm_subnet.subnet.id}"
    private_ip_address            = "10.0.1.5"
    private_ip_address_allocation = "static"
    public_ip_address_id = "${azurerm_public_ip.exc.id}"
  }
}

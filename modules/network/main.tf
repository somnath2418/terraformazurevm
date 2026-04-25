resource "azurerm_virtual_network" "vnet" {
  name                = "vnet"
  location            = var.location
  resource_group_name = var.rg_name
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "subnet" {
  name                 = "subnet"
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

# ✅ Public IP (needed for RDP)
resource "azurerm_public_ip" "pip" {
  name                = "vm-pip"
  location            = var.location
  resource_group_name = var.rg_name
  allocation_method   = "Static"
}

# ✅ NSG
resource "azurerm_network_security_group" "nsg" {
  name                = "vm-nsg"
  location            = var.location
  resource_group_name = var.rg_name
}

# ✅ RDP Rule (Port 3389)
resource "azurerm_network_security_rule" "rdp" {
  name                        = "Allow-RDP"
  priority                    = 1000
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "3389"

  # ⚠️ IMPORTANT (Security)
  # Replace with your IP instead of 0.0.0.0/0 in production
  source_address_prefix       = "0.0.0.0/0"

  destination_address_prefix  = "*"
  resource_group_name         = var.rg_name
  network_security_group_name = azurerm_network_security_group.nsg.name
}

# ✅ Associate NSG with Subnet
resource "azurerm_subnet_network_security_group_association" "assoc" {
  subnet_id                 = azurerm_subnet.subnet.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}
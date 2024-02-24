resource "azurerm_windows_virtual_machine" "res-0" {
  admin_password                                         = "Bangalore@123&*()"
  admin_username                                         = "gautam"
  bypass_platform_safety_checks_on_user_schedule_enabled = true
  license_type                                           = "Windows_Server"
  location                                               = "eastus"
  name                                                   = "Az-eus-winvm01"
  network_interface_ids                                  = ["/subscriptions/90f4dd64-b8a4-40a8-898f-a777acc25b9a/resourceGroups/az-eastus/providers/Microsoft.Network/networkInterfaces/az-eus-winvm01805"]
  patch_assessment_mode                                  = "AutomaticByPlatform"
  patch_mode                                             = "AutomaticByPlatform"
  resource_group_name                                    = "AZ-EASTUS"
  secure_boot_enabled                                    = true
  size                                                   = "Standard_B1s"
  tags = {
    environment = "testing"
    owner       = "gautam"
    purpose     = "Virtual Machine deployment"
    subscrition = "Aztechone"
  }
  vtpm_enabled = true
  additional_capabilities {
  }
  boot_diagnostics {
    storage_account_uri = "https://azeastusdiag.blob.core.windows.net/"
  }
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "StandardSSD_LRS"
  }
  source_image_reference {
    offer     = "WindowsServer"
    publisher = "MicrosoftWindowsServer"
    sku       = "2019-datacenter-gensecond"
    version   = "latest"
  }
  depends_on = [
    azurerm_network_interface.res-3,
  ]
}
resource "azurerm_resource_group" "res-1" {
  location = "eastus"
  name     = "az-eastus"
}
resource "azurerm_dev_test_global_vm_shutdown_schedule" "res-2" {
  daily_recurrence_time = "2100"
  location              = "eastus"
  tags = {
    environment = "testing"
    owner       = "gautam"
    purpose     = "Virtual Machine deployment"
    subscrition = "Aztechone"
  }
  timezone           = "India Standard Time"
  virtual_machine_id = "/subscriptions/90f4dd64-b8a4-40a8-898f-a777acc25b9a/resourceGroups/az-eastus/providers/Microsoft.Compute/virtualMachines/Az-eus-winvm01"
  notification_settings {
    email   = "adm.prasadg1@Gmail.com"
    enabled = true
  }
}
resource "azurerm_network_interface" "res-3" {
  location            = "eastus"
  name                = "az-eus-winvm01805"
  resource_group_name = "az-eastus"
  tags = {
    environment = "testing"
    owner       = "gautam"
    purpose     = "Virtual Machine deployment"
    subscrition = "Aztechone"
  }
  ip_configuration {
    name                          = "ipconfig1"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = "/subscriptions/90f4dd64-b8a4-40a8-898f-a777acc25b9a/resourceGroups/az-eastus/providers/Microsoft.Network/publicIPAddresses/Az-eus-winvm01-ip"
    subnet_id                     = "/subscriptions/90f4dd64-b8a4-40a8-898f-a777acc25b9a/resourceGroups/az-eastus/providers/Microsoft.Network/virtualNetworks/Az-eus-vnet01/subnets/Prod"
  }
  depends_on = [
    azurerm_public_ip.res-7,
    azurerm_subnet.res-10,
  ]
}
resource "azurerm_network_interface_security_group_association" "res-4" {
  network_interface_id      = "/subscriptions/90f4dd64-b8a4-40a8-898f-a777acc25b9a/resourceGroups/az-eastus/providers/Microsoft.Network/networkInterfaces/az-eus-winvm01805"
  network_security_group_id = "/subscriptions/90f4dd64-b8a4-40a8-898f-a777acc25b9a/resourceGroups/az-eastus/providers/Microsoft.Network/networkSecurityGroups/Az-eus-nsg-01"
  depends_on = [
    azurerm_network_interface.res-3,
    azurerm_network_security_group.res-5,
  ]
}
resource "azurerm_network_security_group" "res-5" {
  location            = "eastus"
  name                = "Az-eus-nsg-01"
  resource_group_name = "az-eastus"
}
resource "azurerm_network_security_rule" "res-6" {
  access                      = "Allow"
  destination_address_prefix  = "*"
  destination_port_range      = "3389"
  direction                   = "Inbound"
  name                        = "RDP"
  network_security_group_name = "Az-eus-nsg-01"
  priority                    = 100
  protocol                    = "Tcp"
  resource_group_name         = "az-eastus"
  source_address_prefix       = "*"
  source_port_range           = "*"
  depends_on = [
    azurerm_network_security_group.res-5,
  ]
}
resource "azurerm_public_ip" "res-7" {
  allocation_method   = "Static"
  location            = "eastus"
  name                = "Az-eus-winvm01-ip"
  resource_group_name = "az-eastus"
  sku                 = "Standard"
  tags = {
    environment = "testing"
    owner       = "gautam"
    purpose     = "Virtual Machine deployment"
    subscrition = "Aztechone"
  }
}
resource "azurerm_virtual_network" "res-8" {
  address_space       = ["10.0.0.0/16"]
  location            = "eastus"
  name                = "Az-eus-vnet01"
  resource_group_name = "az-eastus"
}
resource "azurerm_subnet" "res-9" {
  address_prefixes     = ["10.0.1.0/24"]
  name                 = "Dev"
  resource_group_name  = "az-eastus"
  virtual_network_name = "Az-eus-vnet01"
  depends_on = [
    azurerm_virtual_network.res-8,
  ]
}
resource "azurerm_subnet" "res-10" {
  address_prefixes     = ["10.0.0.0/24"]
  name                 = "Prod"
  resource_group_name  = "az-eastus"
  virtual_network_name = "Az-eus-vnet01"
  depends_on = [
    azurerm_virtual_network.res-8,
  ]
}
resource "azurerm_storage_account" "res-11" {
  account_replication_type         = "LRS"
  account_tier                     = "Standard"
  cross_tenant_replication_enabled = false
  location                         = "eastus"
  name                             = "azeastusdiag"
  resource_group_name              = "az-eastus"
}
resource "azurerm_storage_container" "res-13" {
  name                 = "bootdiagnostics-azeuswinv-2b427685-d6f8-41b9-af03-b46e00c36d0c"
  storage_account_name = "azeastusdiag"
}

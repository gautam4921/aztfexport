import {
  id = "/subscriptions/90f4dd64-b8a4-40a8-898f-a777acc25b9a/resourceGroups/AZ-EASTUS/providers/Microsoft.Compute/virtualMachines/Az-eus-winvm01"
  to = azurerm_windows_virtual_machine.res-0
}
import {
  id = "/subscriptions/90f4dd64-b8a4-40a8-898f-a777acc25b9a/resourceGroups/az-eastus"
  to = azurerm_resource_group.res-1
}
import {
  id = "/subscriptions/90f4dd64-b8a4-40a8-898f-a777acc25b9a/resourceGroups/az-eastus/providers/Microsoft.DevTestLab/schedules/shutdown-computevm-Az-eus-winvm01"
  to = azurerm_dev_test_global_vm_shutdown_schedule.res-2
}
import {
  id = "/subscriptions/90f4dd64-b8a4-40a8-898f-a777acc25b9a/resourceGroups/az-eastus/providers/Microsoft.Network/networkInterfaces/az-eus-winvm01805"
  to = azurerm_network_interface.res-3
}
import {
  id = "/subscriptions/90f4dd64-b8a4-40a8-898f-a777acc25b9a/resourceGroups/az-eastus/providers/Microsoft.Network/networkInterfaces/az-eus-winvm01805|/subscriptions/90f4dd64-b8a4-40a8-898f-a777acc25b9a/resourceGroups/az-eastus/providers/Microsoft.Network/networkSecurityGroups/Az-eus-nsg-01"
  to = azurerm_network_interface_security_group_association.res-4
}
import {
  id = "/subscriptions/90f4dd64-b8a4-40a8-898f-a777acc25b9a/resourceGroups/az-eastus/providers/Microsoft.Network/networkSecurityGroups/Az-eus-nsg-01"
  to = azurerm_network_security_group.res-5
}
import {
  id = "/subscriptions/90f4dd64-b8a4-40a8-898f-a777acc25b9a/resourceGroups/az-eastus/providers/Microsoft.Network/networkSecurityGroups/Az-eus-nsg-01/securityRules/RDP"
  to = azurerm_network_security_rule.res-6
}
import {
  id = "/subscriptions/90f4dd64-b8a4-40a8-898f-a777acc25b9a/resourceGroups/az-eastus/providers/Microsoft.Network/publicIPAddresses/Az-eus-winvm01-ip"
  to = azurerm_public_ip.res-7
}
import {
  id = "/subscriptions/90f4dd64-b8a4-40a8-898f-a777acc25b9a/resourceGroups/az-eastus/providers/Microsoft.Network/virtualNetworks/Az-eus-vnet01"
  to = azurerm_virtual_network.res-8
}
import {
  id = "/subscriptions/90f4dd64-b8a4-40a8-898f-a777acc25b9a/resourceGroups/az-eastus/providers/Microsoft.Network/virtualNetworks/Az-eus-vnet01/subnets/Dev"
  to = azurerm_subnet.res-9
}
import {
  id = "/subscriptions/90f4dd64-b8a4-40a8-898f-a777acc25b9a/resourceGroups/az-eastus/providers/Microsoft.Network/virtualNetworks/Az-eus-vnet01/subnets/Prod"
  to = azurerm_subnet.res-10
}
import {
  id = "/subscriptions/90f4dd64-b8a4-40a8-898f-a777acc25b9a/resourceGroups/az-eastus/providers/Microsoft.Storage/storageAccounts/azeastusdiag"
  to = azurerm_storage_account.res-11
}
import {
  id = "https://azeastusdiag.blob.core.windows.net/bootdiagnostics-azeuswinv-2b427685-d6f8-41b9-af03-b46e00c36d0c"
  to = azurerm_storage_container.res-13
}

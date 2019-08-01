output "public_ip_address_dc" {
  value = "${azurerm_public_ip.dc.*.ip_address}"

}

output "public_ip_address_exc" {
  value = "${azurerm_public_ip.exc.*.ip_address}"
}
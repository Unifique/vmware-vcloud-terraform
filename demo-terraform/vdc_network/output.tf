# Saída com as informações da rede interna do VDC
output network_vdc_info {
  value       = <<-EOT
    Nome VDC: ${var.vcd_vdc}
    Nome do vApp: ${var.vApp}
    Nome da rede do cluster: ${vcd_network_routed_v2.net.name}
    Edge associado: ${data.vcd_nsxt_edgegateway.edge1.name}
    IP válido do Edge: ${data.vcd_nsxt_edgegateway.edge1.primary_ip}
    DHCP Range: ${var.vdc_dhcp_start_address} - ${var.vdc_dhcp_end_address}
    Static Pool Range: ${var.vdc_static_ip_start_address} - ${var.vdc_static_ip_end_address}
  EOT
  sensitive   = false
  description = "Informações da rede do VDC"
  depends_on  = [vcd_network_routed_v2.net, data.vcd_nsxt_edgegateway.edge1]
}
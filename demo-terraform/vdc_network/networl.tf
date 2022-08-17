# Obtem os dados do VDC
data "vcd_org_vdc" "vdc1" {
  org = var.vcd_org
  name = var.vcd_vdc
}

# Obtem os dados do Edge Gateway do VDC
data "vcd_nsxt_edgegateway" "edge1" {
  org      = var.vcd_org
  owner_id = data.vcd_org_vdc.vdc1.id
  name     = var.org_edge
}

# Cria a rede interna do VDC
resource "vcd_network_routed_v2" "net" {
  org                = var.vcd_org
  description        = "NSX-T - LAN do VDC"
  name               = var.vdc_network_name
  edge_gateway_id    = data.vcd_nsxt_edgegateway.edge1.id
  gateway            = var.vdc_network_gateway
  prefix_length      = var.vdc_network_prefix
  dns1               = var.vdc_network_dns1
  dns2               = var.vdc_network_dns2

  static_ip_pool {
    start_address = var.vdc_static_ip_start_address
    end_address   = var.vdc_static_ip_end_address
  }
}

# Cria pool de IPs do DHCP da rede interna do VDC
resource "vcd_nsxt_network_dhcp" "dhcp" {
  org_network_id = vcd_network_routed_v2.net.id

  pool {
    start_address = var.vdc_dhcp_start_address
    end_address   = var.vdc_dhcp_end_address
  }
}
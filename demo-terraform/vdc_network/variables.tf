variable "vcd_provider_version" {
  type        = string
  description = "Versão do provider VMWare Cloud Director"
}

variable vcd_org {
  type        = string
  description = "Org do VMware Cloud Director"
  sensitive   = false
}

variable vcd_vdc {
  type        = string
  description = "Nome do VDC"
  sensitive   = false
}

variable vdc_network_name {
  type        = string
  description = "Nome da rede interna do VDC (LAN)"
}

variable org_edge {
  type        = string
  description = "Nome do Edge da Org"
  sensitive   = false
}

variable vdc_network_gateway {
  type        = string
  description = "Gateway da rede interna do VDC"
}
variable vdc_network_prefix {
  type        = string
  description = "Prefixo da rede interna do VDC"
}

variable vdc_network_mask {
  type        = string
  description = "Mascara da rede interna do VDC"
}

variable vdc_network_dns1 {
  type        = string
  description = "DNS1 do POOL da rede interna do VDC"
}

variable vdc_network_dns2 {
  type        = string
  description = "DNS2 do POOL da rede interna do VDC"
}

variable vdc_dhcp_start_address {
  type        = string
  description = "Inicio do bloco de IP do DHCP da rede interna do VDC"
}

variable vdc_dhcp_end_address {
  type        = string
  description = "Fim do bloco de IP do DHCP da rede interna do VDC"
}

variable vdc_static_ip_start_address {
  type        = string
  description = "Inicio do bloco de IP estático da rede interna do VDC"
}

variable vdc_static_ip_end_address {
  type        = string
  description = "Fim do bloco de IP estático da rede interna do VDC"
}

variable vdc_internal_address {
  type        = string
  description = "CIDR da rede interna do Edge"
}

variable vApp {
  type        = string
  description = "Nome do VApp"
}
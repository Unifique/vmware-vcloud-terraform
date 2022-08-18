variable vcd_user {
  type        = string
  default     = "none"
  description = "Usuário VMWare Cloud Director"
  sensitive   = true
}

variable vcd_pass {
  type        = string
  default     = "none"
  description = "Senha usuário VMWare Cloud Director"
  sensitive   = true
}

variable "vcd_token" {
  type        = string
  default     = ""
  description = "API Token VMWare Cloud Director"
  sensitive   = true
}

variable vcd_url {
  type        = string
  default     = "https://vcloud.unifique.com.br/api"
  description = "URL da API do VCloud"
}

variable vcd_max_retry_timeout {
  type        = number
  default     = 120
  description = "Timeout de resposta da solicitacao"
}

variable vcd_allow_unverified_ssl {
  type        = bool
  default     = false
  description = "Permite conectar na API do VMWare Cloud Director sem verificar o certificado SSL"
}

variable vcd_org {
  type        = string
  default     = ""
  description = "Org do VMWare Cloud Director"
  sensitive   = false
}

variable vcd_vdc {
  type        = string
  default     = ""
  description = "Nome do VDC do VMWare Cloud Director (vSphere 7.0)"
  sensitive   = false
}

variable vApp {
  type        = string
  default     = ""
  description = "Nome do VApp da instancia do VMWare Cloud Director"
}

variable vdc_catalog {
  type        = string
  default     = ""
  description = "Nome do catálogo do VDC"
}

variable vdc_template {
  type        = string
  default     = ""
  description = "Nome de template da instância do VDC"
}

variable vdc_network_name {
  type        = string
  default     = ""
  description = "Nome da rede interna do VDC (LAN)"
}

variable org_edge {
  type        = string
  default     = ""
  description = "Nome do Edge da Org"
  sensitive   = false
}

variable vdc_internal_address {
  type        = string
  default     = ""
  description = "CIDR da rede interna do Edge"
}

variable vdc_internal_addressLst {
  type        = list(string)
  default     = [""]
  description = "Lista com as redes CIDR da rede interna do Edge."
}

variable vdc_network_gateway {
  type        = string
  default     = ""
  description = "Gateway da rede interna do VDC"
}

variable "vdc_network_prefix" {
  type        = string
  default     = ""
  description = "Prefixo da rede interna do VDC"
}
  
variable vdc_network_mask {
  type        = string
  default     = ""
  description = "Mascara da rede interna do VDC"
}

variable vdc_network_dns1 {
  type        = string
  default     = ""
  description = "DNS1 do POOL da rede interna do VDC"
}

variable vdc_network_dns2 {
  type        = string
  default     = ""
  description = "DNS2 do POOL da rede interna do VDC"
}

variable vdc_dhcp_start_address {
  type        = string
  default     = ""
  description = "Inicio do bloco de IP do DHCP da rede interna do VDC"
}

variable vdc_dhcp_end_address {
  type        = string
  default     = ""
  description = "Fim do bloco de IP do DHCP da rede interna do VDC"
}

variable vdc_static_ip_start_address {
  type        = string
  default     = ""
  description = "Inicio do bloco de IP estático da rede interna do VDC"
}

variable vdc_static_ip_end_address {
  type        = string
  default     = ""
  description = "Fim do bloco de IP estático da rede interna do VDC"
}

variable vdc_storage_profile {
  type        = string
  default     = ""
  description = "Profile da politica de disco do VDC"
  sensitive   = false
}

variable vdc_vm_os_type {
  type        = string
  default     = ""
  description = "Defini o tipo de sistema operacional das vms dentro do VMWare"
}

variable vdc_disk_bus_type {
  type        = string
  default     = "paravirtual"
  description = "Tipo de controladora de disco para as instâncias."
}

variable vdc_instance01_disk0_size {
  type        = string
  default     = ""
  description = "tamanho do disco da instância 01 em MB."
}

variable instance02_qtd {
  type        = number
  default     = 1
  description = "Quantidade de instâncias a serem criadas"
}

variable ipset_whitelist {
  type        = list(string)
  default     = [""]
  description = "IPSet de IPs em Whitelist"
}

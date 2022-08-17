variable vcd_user {
  type        = string
  default     = ""
  description = "Usuário VMWare Cloud Director"
  sensitive   = true
}

variable vcd_pass {
  type        = string
  default     = ""
  description = "Senha usuário VMWare Cloud Director"
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
  default     = "<NOME_ORG>"
  description = "Org do VMWare Cloud Director"
  sensitive   = false
}

variable vcd_vdc {
  type        = string
  default     = "<NOME_VIRTUAL_DATACENTER>"
  description = "Nome do VDC do VMWare Cloud Director (vSphere 7.0)"
  sensitive   = false
}

variable vApp {
  type        = string
  default     = "<NOME_VAPP>"
  description = "Nome do VApp da instancia do VMWare Cloud Director"
}

variable vdc_catalog {
  type        = string
  default     = "<NOME_CATALOGO_VDC>"
  description = "Nome do catálogo do VDC"
}

variable vdc_template {
  type        = string
  default     = "<NOME_TEMPLATE_VDC>"
  description = "Nome de template da instância do VDC"
}

variable vdc_network_name {
  type        = string
  default     = "<NOME_REDE_VDC>"
  description = "Nome da rede interna do VDC (LAN)"
}

variable org_edge {
  type        = string
  default     = "<NOME_ORG_EDGE>"
  description = "Nome do Edge da Org"
  sensitive   = false
}

variable vdc_internal_address {
  type        = string
  default     = "<CIDR_REDE_INTERNA_VDC>"
  description = "CIDR da rede interna do Edge"
}

variable vdc_internal_addressLst {
  type        = list(string)
  default     = ["<CIDR_REDE_INTERNA_VDC>"]
  description = "Lista CIDR da rede interna do Edge"
}

variable vdc_network_gateway {
  type        = string
  default     = "<GATEWAY_REDE_VDC>"
  description = "Gateway da rede interna do VDC"
}

variable "vdc_network_prefix" {
  type        = string
  default     = "<PREFIXO_REDE_VDC>"
  description = "Prefixo da rede interna do VDC"
}
  
variable vdc_network_mask {
  type        = string
  default     = "<MASCARA_REDE_VDC>"
  description = "Mascara da rede interna do VDC"
}

variable vdc_network_dns1 {
  type        = string
  default     = "<DNS1_REDE_VDC>"
  description = "DNS1 do POOL da rede interna do VDC"
}

variable vdc_network_dns2 {
  type        = string
  default     = "<DNS2_REDE_VDC>"
  description = "DNS2 do POOL da rede interna do VDC"
}

variable vdc_dhcp_start_address {
  type        = string
  default     = "<DHCP_INICIO_REDE_VDC>"
  description = "Inicio do bloco de IP do DHCP da rede interna do VDC"
}

variable vdc_dhcp_end_address {
  type        = string
  default     = "<DHCP_FINAL_REDE_VDC>"
  description = "Fim do bloco de IP do DHCP da rede interna do VDC"
}

variable vdc_static_ip_start_address {
  type        = string
  default     = "<STATIC_INICIO_REDE_VDC>"
  description = "Inicio do bloco de IP estático da rede interna do VDC"
}

variable vdc_static_ip_end_address {
  type        = string
  default     = "<STATIC_FINAL_REDE_VDC>"
  description = "Fim do bloco de IP estático da rede interna do VDC"
}

variable vdc_storage_profile {
  type        = string
  default     = "<NOME_STORAGE_PROFILE_VDC>"
  description = "Profile da politica de disco do VDC"
  sensitive   = false
}

variable vdc_vm_os_type {
  type        = string
  default     = "<NOME_OS_VDC>"
  description = "Defini o tipo de sistema operacional das vms dentro do VMWare"
}

variable vdc_disk_bus_type {
  type        = string
  default     = "paravirtual"
  description = "Tipo de controladora de disco para as instâncias."
}

variable vdc_instance01_disk0_size {
  type        = string
  default     = "<TAMANHO_DISCO_INSTANCIA01>"
  description = "tamanho do disco da instância 01 em MB."
}

variable instance02_qtd {
  type        = number
  default     = <QTD_INSTANCIAS>
  description = "Quantidade de instâncias a serem criadas"
}

variable unifique_whitelist {
  type        = list(string)
  default     = ["<LISTA_IP_WHITELIST>"]
  description = "IPSet de IPs em Whitelist"
}
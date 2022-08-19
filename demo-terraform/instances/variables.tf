variable vcd_org {
  type        = string
  description = "Org do VCloud"
  sensitive   = false
}

variable vcd_vdc {
  type        = string
  description = "Nome do VDC do VCloud"
  sensitive   = false
}

variable vApp {
  type        = string
  description = "Nome do Vapp"
}

variable vdc_network1_name {
  type        = string
  description = "Nome da rede da Org para adicionar no vApp"
}

variable vdc_storage_profile {
  type        = string
  description = "Profile da politica de disco do VDC"
  sensitive   = false
}

variable vdc_disk_bus_type {
  type        = string
  description = "Tipo de controladora de disco para as instâncias."
}

variable vdc_vm_os_type {
  type        = string
  default     = "centos8_64Guest"
  description = "Defini o tipo de sistema operacional das vms dentro do VMWare"
}

variable vdc_instance01_disk0_size {
  type        = string
  description = "tamanho do disco da instância 01 em MB."
}

variable instance02_qtd {
  type        = number
  default     = 0
  description = "Quantidade de instâncias modelo 2 a serem criadas"
}

variable vdc_catalog {
  type        = string
  description = "Nome do catálogo do VDC"
}

variable vdc_template {
  type        = string
  description = "Nome do template de instância do VDC"
}
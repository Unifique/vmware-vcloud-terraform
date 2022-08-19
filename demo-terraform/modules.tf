# Terrafile para carregar os modulos do Terraform usados no projeto

# Carrega o módulo para criar a rede do VDC
module "vdc_network" {
  source = "./vdc_network"
  vcd_org = var.vcd_org
  vcd_vdc = var.vcd_vdc
  vdc_network_name = var.vdc_network_name
  org_edge = var.org_edge
  vdc_network_gateway = var.vdc_network_gateway
  vdc_network_mask = var.vdc_network_mask
  vdc_network_dns1 = var.vdc_network_dns1
  vdc_network_dns2 = var.vdc_network_dns2
  vdc_dhcp_start_address = var.vdc_dhcp_start_address
  vdc_dhcp_end_address = var.vdc_dhcp_end_address
  vdc_static_ip_start_address = var.vdc_static_ip_start_address
  vdc_static_ip_end_address = var.vdc_static_ip_end_address
  vdc_internal_address = var.vdc_internal_address
  vdc_network_prefix = var.vdc_network_prefix
  vApp = var.vApp
}

# Carrega o módulo para criar as instâncias
module "instances" {
  source = "./instances"
    vcd_org = var.vcd_org
    vcd_vdc = var.vcd_vdc
    vApp = var.vApp
    vdc_network1_name = var.vdc_network_name
    vdc_storage_profile = var.vdc_storage_profile
    vdc_instance01_disk0_size = var.vdc_instance01_disk0_size
    vdc_disk_bus_type = var.vdc_disk_bus_type
    instance02_qtd = var.instance02_qtd
    vdc_vm_os_type = var.vdc_vm_os_type
    vdc_catalog = var.vdc_catalog
    vdc_template = var.vdc_template
    depends_on = [module.vdc_network]  
}

# Saída de informações do deploy do ambiente
output sumario_do_recursos_criados {
  value       = [
    module.vdc_network.network_vdc_info,
    module.instances.instances_info
  ]
  sensitive   = false
  description = "description"
}
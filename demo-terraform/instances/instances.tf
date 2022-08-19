# Cria o VApp das instâncias
resource "vcd_vapp" "vApp" {
  name = var.vApp
  power_on = true
  metadata = {
    Application = "vApp Demo"
  }
}

# Obtenm os dados da rede interna do Edge para atribuir as instâncias
data "vcd_network_routed_v2" "lan" {
  org  = var.vcd_org
  name = var.vdc_network1_name
  depends_on = [vcd_vapp.vApp]
}

# Adiciona a rede LAN no VApp
resource "vcd_vapp_org_network" "vappOrgNet1" {
  org = var.vcd_org
  vdc = var.vcd_vdc
  vapp_name = vcd_vapp.vApp.name
  org_network_name = data.vcd_network_routed_v2.lan.name
  depends_on = [vcd_vapp.vApp, data.vcd_network_routed_v2.lan]
}

# Gera uma senha aleatória para o usuário root a instância 01
resource "random_password" "instance01_password" {
  length           = 16
  special          = true
  override_special = "_%@"
}

# Gera senhas aleatórias para o usuário root das instâncias do modelo 02
resource "random_password" "instances_02_password" {
  count = var.instance02_qtd
  length           = 16
  special          = true
  override_special = "_%@"
}

# Criação de instâncias modelo 1
resource "vcd_vapp_vm" "instance01" {
  vapp_name     = vcd_vapp.vApp.name
  name          = "instance01"
  computer_name = "instance01"
  description   = "Instance 01"
  catalog_name  = var.vdc_catalog
  template_name = var.vdc_template
  memory        = 8192
  cpus          = 2
  cpu_cores     = 1
  power_on = true
  os_type= var.vdc_vm_os_type
  storage_profile = var.vdc_storage_profile
  metadata = {
    role    = "instance01"
    env     = "production"
    version = "v1"
    modelo  = "01"
  }
  
  guest_properties = {
    "guest.hostname"   = "instance01"
  }

  # Customização do SO para instância 01
  customization {
    enabled                             = true
    force                               = false
    allow_local_admin_password          = true
    auto_generate_password              = false
    must_change_password_on_first_login = false
    admin_password                      = random_password.instance01_password.result
  }

  # Configuração de disco
  override_template_disk {
    bus_type        = var.vdc_disk_bus_type
    size_in_mb      = var.vdc_instance01_disk0_size
    bus_number      = 0
    unit_number     = 0
    storage_profile = var.vdc_storage_profile
  }

  # Configuração de rede
  network {
    type               = "org"
    name               = data.vcd_network_routed_v2.lan.name
    ip_allocation_mode = "POOL"
    is_primary         = true
    adapter_type = "VMXNET3" 
  }

  # Dependências
  depends_on      = [
    data.vcd_network_routed_v2.lan, 
    random_password.instance01_password,
    vcd_vapp_org_network.vappOrgNet1,
    vcd_vapp.vApp
  ]
}

# Criação de instâncias modelo 2
resource "vcd_vapp_vm" "instances_02" {
  count         = var.instance02_qtd
  vapp_name     = vcd_vapp.vApp.name
  name          = "instances-${count.index+1}"
  computer_name = "instances-${count.index+1}"
  description   = "Instâncias modelo 2"
  catalog_name  = var.vdc_catalog
  template_name = var.vdc_template
  memory        = 4096
  cpus          = 2
  cpu_cores     = 1
  power_on = true
  os_type= var.vdc_vm_os_type
  storage_profile = var.vdc_storage_profile
  metadata = {
    role    = "instances-${count.index+1}"
    env     = "production"
    version = "v1"
    modelo  = "02"
  }
  
  guest_properties = {
    "guest.hostname"   = "instances-${count.index+1}"
  }

  # Customização do SO para instância 02
  customization {
    enabled                             = true
    force                               = false
    allow_local_admin_password          = true
    auto_generate_password              = false
    must_change_password_on_first_login = false
    admin_password                      = random_password.instances_02_password[count.index].result
  }


  # Configuração de disco
  override_template_disk {
    bus_type        = var.vdc_disk_bus_type
    size_in_mb      = var.vdc_instance01_disk0_size
    bus_number      = 0
    unit_number     = 0
    storage_profile = var.vdc_storage_profile
  }

  # Configuração de rede
  network {
    type               = "org"
    name               = data.vcd_network_routed_v2.lan.name
    ip_allocation_mode = "POOL"
    is_primary         = true
    adapter_type = "VMXNET3" 
  }

  depends_on      = [
    data.vcd_network_routed_v2.lan,
    random_password.instances_02_password,
    vcd_vapp_org_network.vappOrgNet1,
    vcd_vapp.vApp
  ]
}

# Obtem os dados das instâncias para utilização no output
locals {
  instance01_info = <<-EOT
    Nome VM                = ${vcd_vapp_vm.instance01.name},
    Descrição              = ${vcd_vapp_vm.instance01.description},
    vCPUs                  = ${vcd_vapp_vm.instance01.cpus},
    Cores por CPU          = ${vcd_vapp_vm.instance01.cpu_cores},
    Memória (MB)           = ${vcd_vapp_vm.instance01.memory},
    Storage Profile        = ${vcd_vapp_vm.instance01.storage_profile},
    Cátalogo S.O.          = ${vcd_vapp_vm.instance01.catalog_name},
    Template S.O.          = ${vcd_vapp_vm.instance01.template_name},
    Tipo S.O.              = ${vcd_vapp_vm.instance01.os_type},
    Metadata               = ${replace(replace(jsonencode(vcd_vapp_vm.instance01.metadata), "\"", ""), ":", "=")},
    Configuração da Rede   = ${replace(replace(jsonencode(vcd_vapp_vm.instance01.network), "\"", ""), ":", "=")},
    EOT

  instances_02_info = {
    for instances in vcd_vapp_vm.instances_02:
      instances.name => <<-EOT
        Descrição              = ${instances.description}
        vCPUs                  = ${instances.cpus}
        Cores por CPU          = ${instances.cpu_cores}
        Memória (MB)           = ${instances.memory}
        Storage Profile        = ${instances.storage_profile}
        Cátalogo S.O.          = ${instances.catalog_name}
        Template S.O.          = ${instances.template_name}
        Tipo S.O.              = ${instances.os_type}
        Metadata               = ${replace(replace(jsonencode(instances.metadata), "\"", ""), ":", "=")}
        Configuração da Rede   = ${replace(replace(jsonencode(instances.network), "\"", ""), ":", "=")}
        EOT
  }
}
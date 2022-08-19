output "instances_info" {
  value = [
    local.instance01_info,
    local.instances_02_info
  ]
  sensitive = false
  description = "Sumário da instância 01"
  depends_on = [vcd_vapp_vm.instance01]  
}
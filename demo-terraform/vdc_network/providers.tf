terraform {
  required_providers {
    vcd = {
      source = "vmware/vcd"
      version = var.vcd_provider_version
    }
  }
}
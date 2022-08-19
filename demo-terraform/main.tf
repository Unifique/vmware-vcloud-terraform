# Definição do provider para conectar na API do VMware Cloud Director
provider "vcd" {
    user                 = var.vcd_user # For api token set usert to none"
    password             = var.vcd_pass # For api token set usert to none
    auth_type            = "api_token" # For authentication with username and password set auth_type to "integrated"
    api_token            = var.vcd_token
    org                  = var.vcd_org
    vdc                  = var.vcd_vdc
    url                  = var.vcd_url
    max_retry_timeout    = var.vcd_max_retry_timeout
    allow_unverified_ssl = var.vcd_allow_unverified_ssl
}

# Definicao do backend do Terraform para salvar o state remotamente no S3 do Dell-ECS
terraform {
#    backend "s3" {
#        bucket = "<NOME_BUCKET_S3>"
#        key = "terraform-demo.tfstate"
#        region = "us-east-1"
#        endpoint = "s3.portal-tio.unifique-hd.net"
#        skip_credentials_validation = true
#        shared_credentials_file = "~/.aws/credentials"
#        profile = "default"
#        encrypt = true
#    }
    required_providers {
        vcd = {
            source = "vmware/vcd"
        version = "3.7.0"
        }
    } 
}
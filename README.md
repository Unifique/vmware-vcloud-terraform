# vmware-vcloud-terraform
Exemplo de deploy de instâncias de VM no VMWare Cloud Director com NSX-T


### Execução do projeto Terraform

```bash
cd demo-terraform
terraform plan -var-file=<EXTRA_VAR_FILE> -out plano
terraform apply plano
```
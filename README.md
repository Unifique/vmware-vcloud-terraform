# Usando Terraform para gerenciamento de Infraestrutura no VMWare Cloud Director

Exemplo para criação de instâncias de VM no VMWare Cloud Director e infraestrutura de rede usando o NSX-T.

## Pre-Requisitos

:white_check_mark: `Terraform client (https://www.terraform.io/downloads.html).  `
:white_check_mark: `Configurar as variáveis do Terraform com as informações necessárias para rodas os terrafiles.`

## Ajustando o arquivo de variáveis usadas pelo Terraform

Antes de rodar o Terraform, é necessário ajustar o arquivo de variáveis com as informações necessárias para o funcionamento do Terraform.
Segue as variáveis que precisam ser configuradas:


### Execução do projeto Terraform

```bash
cd demo-terraform
terraform plan -var-file=<EXTRA_VAR_FILE> -out plano
terraform apply plano
```
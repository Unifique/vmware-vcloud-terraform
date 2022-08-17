# Usando Terraform para gerenciar Infraestrutura no VMWare Cloud Director

Exemplo para criação uma infraestrutura de VMs no VMWare Cloud Director junto com uma infraestrutura de rede no NSX-T.

## Pre-Requisitos

:white_check_mark: Terraform client (https://www.terraform.io/downloads.html).  
:white_check_mark: Ajustar as variáveis do Terraform com as informações necessárias para rodas os terrafiles.

## Instalação do Terraform

### Instalar o Terraform no Ubuntu/Debian

```
wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform
```

### Instalar o Terraform no CentOS/RedHat/AlmaLinux
```
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
sudo yum -y install terraform
```

### Instalar o Terraform no MacOS
```
brew tap hashicorp/tap
brew install hashicorp/tap/terraform
```

## Instalar o Terraform no Windows

1. Download do Terraform no Windows (amd64): [Terraform Windows](https://releases.hashicorp.com/terraform/1.2.7/terraform_1.2.7_windows_amd64.zip).
2. Extrair o arquivo.
3. Copiar o arquivo para a pasta do seu ambiente de trabalho.

## Baixando o repositório do Terraform

```
git clone https://github.com/Unifique/vmware-vcloud-terraform.git
cd vmware-vcloud-terraform
```

## Ajustando o arquivo de variáveis usado pelo Terraform

Antes de rodar o Terraform, é necessário ajustar o arquivo de variáveis com as informações necessárias para o funcionamento do Terraform.
Segue as variáveis que precisam ser configuradas:

|VARIÁVEL|EXEMPLO|DESCRIÇÃO|
|--|--|--|
|vcd_user|example01|Usuário VMWare Cloud Director|
|vcd_pass|p4ssw0rd|Senha usuário VMWare Cloud Director|
|vcd_org|EXEMPLO_ORG|Org do VMWare Cloud Director|
|vcd_vdc|EXEMPLO_VDC-DC-SC-TIO-01|Nome do VDC do VMWare Cloud Director|
|vApp|VApp01|Nome do VApp da instancia do VMWare Cloud Director|
|vdc_catalog|CATALOGO-SC-TERRAFORM|Nome do catálogo do VDC|
|vdc_template|TEMPLATE_UBUNTU22|Nome de template da instância do VDC|
|org_edge|EXEMPLO_EGT|Nome do Edge da Org|
|vdc_network_name|LAN-Demo|Nome da rede interna do VDC (LAN)|
|vdc_internal_address|172.16.10.0/24|CIDR da rede interna do Edge|
|vdc_internal_addressLst|["172.16.10.0/24", "172.16.11.0/24"]|Lista com as redes CIDR da rede interna do Edge. (Pode ter mais de uma caso existam outras rede criadas)|
|vdc_network_gateway|172.16.15.1|Gateway padrão da rede interna do VDC|
|vdc_network_prefix|24|Prefixo da rede interna do VDC|
|vdc_network_mask|255.255.255.0|Mascara da rede interna do VDC|
|vdc_network_dns1|179.127.167.72|DNS1 do POOL da rede interna do VDC|
|vdc_network_dns2|172.16.15.150|DNS2 do POOL da rede interna do VDC|
|vdc_dhcp_start_address|172.16.15.50|Inicio do bloco de IP de DHCP da rede interna do VDC|
|vdc_dhcp_end_address|172.16.15.100|Fim do bloco de IP do DHCP da rede interna do VDC|
|vdc_static_ip_start_address|172.16.15.2|Inicio do bloco de IP estático da rede interna do VDC|
|vdc_static_ip_end_address|172.16.15.30|Fim do bloco de IP estático da rede interna do VDC|
|vdc_storage_profile|CLOUD-T2|Profile da Política de Armazenamento de disco do VDC|
|vdc_vm_os_type|ubuntu64Guest|Profile da Política de Armazenamento de disco do VDC|
|vdc_instance01_disk0_size|81820|Tamanho do disco 0 para a instância 02 em MB.|
|instance02_qtd|2|Quantidade de VMs da instância 02 a serem criadas."|
|ipset_whitelist|["111.111.111.111", "222.222.222.222"]|Lista de IPs externos em **whitelist** para serem utilizados na liberação do Firewall.|

## Criação da Infraestrutura

```bash
cd demo-terraform
terraform init
terraform plan -var-file=<EXTRA_VAR_FILE> -out plano
terraform apply plano
```

Observação: O parâmetro `-var-file=<EXTRA_VAR_FILE>` é opcional caso você queria passar um arquivo de variáveis separado. Por exemplo se vocês quiser deixar as variáveis que contenham dados `sensíveis` em um arquivo fora do repositório.

## Remoção da Infraestrutura

```bash
terraform destroy -var-file=<EXTRA_VAR_FILE>
```

## Documentação adicional do Terraform

* Para mais informações sobre o Terraform e a documentação, acesse: [Terraform Documentation](https://www.terraform.io/docs/).

* Para mais informações sobre o Provider do vcd, acesse: [VCD Provider Documentation](https://registry.terraform.io/providers/vmware/vcd/latest).
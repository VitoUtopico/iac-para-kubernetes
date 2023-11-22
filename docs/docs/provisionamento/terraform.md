# Terraform

É utilizado para construir o ambiente em nuvem em que o Kubernetes será instalado.

## AWS

### Terrafile

No arquivo terrafile.tf temos as declarações dos módulos, como "instancias_k8s", "security" e "network", por exemplo.

Em cada módulo é declarado um source (path de onde se encontra este módulo) e suas respectivas variáveis de ambiente.

### Provider

Identifica o cloud provider utilizado, neste caso AWS, que recebe o argumento "region", declarado nas variáveis gerais.

### Modulos

=== "intancias_k8s"

    Define as instâncias utilizadas para o cluster Kubernetes.

    Temos as definições para instâncias control plane e instâncias nodes.

    Para cada uma destas, temos as seguintes definições:

    * Número de instâncias;
    * Amazon Machine Image (AMI) para utilizar na instância;
    * Tipo da instância (por exemplo, t2.medium);
    * ID da subnet;
    * Se a instância deve ter um IP público associado;
    * Security Group associado;
    * É passado um script bash para alterar o nome do host ao se criar a instância;
    * Nome da chave criptográfica anteriormente gerada para a comunicação SSH;
    * Tag "Name", para que na lista de instâncias na interface seja mostrado o hostname da instância na coluna de nome.

=== "network"



=== "security"


---
## Referências

[Terraform Essentials](https://www.linuxtips.io/course/terraform-essentials)





















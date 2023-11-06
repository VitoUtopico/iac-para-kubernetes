# Gerando par de chaves para acesso ssh

Para facilitar o acesso via SSH à uma máquina remota, é altamente recomendado o uso de um par de chaves criptográficas. Tanto por motivos de segurança, quanto de praticidade, pois elimina a necessidade de inserção de senha a cada acesso à máquina.

## Gerando as chaves através do ssh-keygen

Este processo gera duas chaves, uma privada, que deve ser mantida na máquina onde se desenvolve, e uma pública que deve ser alocada nas máquinas remotas.
No caso de máquinas locais, pode-se enviar a chave pública para cada máquina. Máquinas geradas em nuvem, faremos o processo mais automatizado, a chave será enserida no host durante sua criação via Terraform.

~~~sh

ssh-keygen -f rasp_key # -f especifica o nome do arquivo, que por padrão é id_rsa
ssh-copy-id -i rasp_key.pub kluster@192.168.2.120 # deve-se especificar o nome da chave e o host pra onde se quer enviá-la
ssh-add rasp_key # adicionando a chave rasp_key a um agent ssh para não ser necessário passar o path da chave como argumento para o acesso à máquina remota

~~~

## Referências

Chaves ssh:

[Descomplicando o Ansible → Day-1 → Setup inicial e nosso primeiro ping!](https://www.linuxtips.io/course/descomplicando-o-ansible)
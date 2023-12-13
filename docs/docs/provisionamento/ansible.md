# <img src="../../images/ansible-logo.png" alt="drawing" width="40"/> Ansible

O Ansible será utilizado para automatizar a instalação do Kubernetes, tanto em um cluster local, quanto em um remoto.

## Tree

![Ansible tree](../images/ansible-tree.png)

## Vars

Contem variáveis gerais, que pode ser utilizadas em qualquer módulo do Ansible

## Inventory

Na pasta inventory existe um arquivo onde são listadas as máquinas que serão acessadas.

São definidos também três grupos de máquinas:

* Kubernetes: incluindo todos os nós
* Control plane: nós que rodarão como control plane do Kubernetes
* Nodes: nós que rodarão como workers do kubernetes

### DOCUMENTAR SOBRE INVENTÁRIO DINÂMICO


## Roles

Contem todas as fazes de instalações e configurações

=== "commons"

    É aplicado a todos os nós.

    * Faz um apt update e um apt upgrade 
    * Instala os pacotes necessários
    * Liga os módulos de kernel necessários

=== "kubernetes"

    É aplicado a todos os nós.

    Aplica as configurações necessárias para a instalação do cluster Kubernetes

    * Baixa as chaves e adiciona os repositórios do K8S
    * Instala o Kubelet, Kubeadm e Kubectl
    * Trava a versão destes componentes
    * Reseta o kubeadm para evitar erro no momento da criação do cluster

=== "containerd"

    É aplicado a todos os nós.

    Instala e configura componentes necessários para a utilização do containerd como CRI do Kubernetes

    * Baixa a chave e adiciona o repositório do containerd
    * Instala pacote do containerd
    * Edita o arquivo config.toml do containerd para que utilize o grupo systemdCgroup
    * Reseta o serviço do containerd

=== "control_plane"

    É aplicado apenas ao grupo control_plane

    Inicia o cluster kubernetes

    * Utiliza o kubeadm init
    * Copia o arquivo que origina o .kube/config
    * Gera o comando para fazer um join de nodes ao cluster e salva em um dummy host

=== "config_nodes"

    É aplicado apenas aos nodes

    Faz o join dos nodes ao cluster utilizando o comando gerado anteriormente pelo control plane

=== "install_kubectl"

    É aplicado a um control plane e não executa como sudo

    Faz instalações necessárias via kubectl

    * Faz kubectl apply do CNI Wavenet

## Playbooks

Associa de forma ordenada as tasks que devem ser executadas com cada grupo de hosts.

## Teste

Tentando usar um mesmo projeto para deployar tanto em nuvem quanto em máquinas locais.

!!! warning

    Ainda não sei a melhor forma de se fazer isso, seguindo boas práticas. Mas essa foi a forma que consegui fazer. Pretendo, o mais breve, descobrir a forma certa de se fazer isso.

=== "Inventory"

    Pasta inventory dividida em dois arquivos:

    * rasp.yaml: referência às máquinas locais (Raspberries Pi)
    * cloud.yaml: referência a máquinas que serão geradas na AWS

=== "Playbooks"

    Na pasta playbooks existem duas pastas, cloud e rasp, cada uma contendo um arquivo de playbook e um ansible.cfg.

    Cada arquivo ansible.cfg faz referência a um inventory e cada playbook configura o nome de usuário linux de acordo com o conjunto de máquinas a que se refere.

---

## Referências

Ansible:

[Descomplicando o Ansible](https://www.linuxtips.io/course/descomplicando-o-ansible)
[Kubernetes com CRI-O - Subindo um cluster do zero](https://www.youtube.com/watch?v=3jS25eLz9mY&t=2125s&ab_channel=MatheusFidelis)

[30 Exemplos do comando sed](https://terminalroot.com.br/2015/07/30-exemplos-do-comando-sed-com-regex.html)

[Recarregando o inventário do Ansible durante a execução](https://dev.to/stefanomartins/recarregando-o-inventario-do-ansible-durante-a-execucao-5ghm)
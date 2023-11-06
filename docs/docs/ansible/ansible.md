# Ansible

O Ansible será utilizado para automatizar a instalação do Kubernetes, tanto em um cluster local, quanto em um remoto.

## Vars

Contem variáveis gerais, que pode ser utilizadas em qualquer módulo do Ansible

## Inventory

Na pasta inventory existe um arquivo onde são listadas as máquinas que serão acessadas.

São definidos também três grupos de máquinas:

* Kubernetes: incluindo todos os nós
* Control plane: nós que rodarão como control plane do Kubernetes
* Nodes: nós que rodarão como workers do kubernetes

## Roles

Contem todas as fazes de instalações e configurações

### Commons

É aplicado a todos os nós.

* Faz um apt update e um apt upgrade 
* Instala os pacotes necessários
* Liga os módulos de kernel necessários

### Kubernetes

É aplicado a todos os nós.

Aplica as configurações necessárias para a instalação do cluster Kubernetes

* Baixa as chaves e adiciona os repositórios do K8S
* Instala o Kubelet, Kubeadm e Kubectl
* 

## Playbooks

Associa de forma ordenada as tasks que devem ser executadas com cada grupo de hosts.
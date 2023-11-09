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

## Playbooks

Associa de forma ordenada as tasks que devem ser executadas com cada grupo de hosts.

## Teste

Tentando usar um mesmo projeto para deployar tanto em nuvem quanto em máquinas locais.

!!! warning

    Ainda não sei a melhor forma de se fazer isso, seguindo boas práticas. Mas essa foi a forma que consegui fazer. Pretendo, o mais breve, descobrir a forma certa de se fazer isso.

### Inventory

Pasta inventory dividida em dois arquivos:

* rasp.yaml: referência às máquinas locais (Raspberries Pi)
* cloud.yaml: referência a máquinas que serão geradas na AWS

### Playbooks

Na pasta playbooks existem duas pastas, cloud e rasp, cada uma contendo um arquivo de playbook e um ansible.cfg.

Cada arquivo ansible.cfg faz referência a um inventory e cada playbook configura o nome de usuário linux de acordo com o conjunto de máquinas a que se refere.
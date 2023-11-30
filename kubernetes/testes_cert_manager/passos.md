# Criar certificado para incluir acesso ao IP externo

~~~sh

# Na máquina control plane

sudo rm /etc/kubernetes/pki/apiserver.* -f
sudo kubeadm init phase certs apiserver --apiserver-cert-extra-sans <IP_externo> --apiserver-cert-extra-sans <IP_interno> --apiserver-cert-extra-sans localhost

# Importar kubeconfig
scp ubuntu@<IP_externo>:/home/ubuntu/.kube/config ./config

# Mudar IP_interno que estará no config para o IP_externo
sed ...

~~~

# Cert-manager

## Instalação

~~~sh

kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.13.2/cert-manager.yaml

~~~
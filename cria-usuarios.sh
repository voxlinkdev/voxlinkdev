#!/bin/bash

# Variáveis
novo_usuario="spideruser"
caminho_chave="/home/$novo_usuario/.ssh/authorized_keys"
repositorio="voxlinkdev"
arquivo_chave="pub-spider.txt"

# Faz o download do arquivo de chave pública do repositório no GitHub
wget -O "$caminho_chave" "https://raw.githubusercontent.com/$repositorio/$repositoriov/main/chaves/$arquivo_chave"

# Cria o diretório home do usuário
mkdir -p /home/$novo_usuario
chmod 0755 /home/$novo_usuario
chown $novo_usuario:$novo_usuario /home/$novo_usuario

# Adiciona o usuário
useradd -m $novo_usuario

# Ajusta as permissões do diretório .ssh e do arquivo authorized_keys
mkdir -p /home/$novo_usuario/.ssh
chmod 0700 /home/$novo_usuario/.ssh
chown $novo_usuario:$novo_usuario /home/$novo_usuario/.ssh
chmod 0600 $caminho_chave
chown $novo_usuario:$novo_usuario $caminho_chave

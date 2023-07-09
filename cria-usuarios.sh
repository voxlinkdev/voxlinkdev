#!/bin/bash

# Variáveis
novo_usuario="nome_do_usuario"
caminho_chave="/caminho/para/sua/chave_publica.pub"

# Cria o diretório home do usuário
mkdir -p /home/$novo_usuario
chmod 0755 /home/$novo_usuario
chown $novo_usuario:$novo_usuario /home/$novo_usuario

# Adiciona o usuário
useradd -m $novo_usuario

# Copia a chave pública para o arquivo authorized_keys
mkdir -p /home/$novo_usuario/.ssh
chmod 0700 /home/$novo_usuario/.ssh
chown $novo_usuario:$novo_usuario /home/$novo_usuario/.ssh

cat $caminho_chave >> /home/$novo_usuario/.ssh/authorized_keys
chmod 0600 /home/$novo_usuario/.ssh/authorized_keys
chown $novo_usuario:$novo_usuario /home/$novo_usuario/.ssh/authorized_keys

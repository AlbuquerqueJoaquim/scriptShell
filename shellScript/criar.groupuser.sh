#!/bin/bash

# Script para criação de usuários e grupos

clear
echo "Digite o nome do grupo: "
read grupo

sudo groupadd $grupo

echo "Informe a quantidade de usuários que deseja criar: "
read usu

X=0
while [ $X -lt $usu ]; do
	echo "Digite um nome para o usuário: "
	read nome
	sudo adduser $nome
	sudo chmod 774 /home/$nome ## o chmod está dando permissão total para o dono do arquivo e usuários do grupo
## e apenas permissão de leitura para os demais usuários
let X=$X+1

done

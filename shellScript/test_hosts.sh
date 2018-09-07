#!/bin/bash
#Algoritmo que executa testes de ping para um range de IPs e ao
#final mostra a quantidade total de hosts.

echo "-----------------------------------"
echo "	 ALGORITMO TESTAR IP         "
echo "-----------------------------------"
echo


#Iniciando a variável contador (con)
con=0

#Aqui deve ser informado a rede. Ex.: 192.168.1 ou 192.168.2 e assim por diante
echo -n "Informe a rede: "
read net

#Informe o IP inicial do teste
echo -n "Informe o IP inicial: "
read ipini

#Informe o IP final do teste
echo -n "Informe o IP final: "
read ipfim

#Cálculo de quantos IPs receberam o teste de ping
#também será usado para fazer uma comparação com o contador
#na estrutura de repetição
calc=$(($ipfim-ipini))


#O primeiro teste da estrutura while vai ser com o primeiro
#IP informado pelo usuário. Assim que o laço começar a ser
#executado, este IP inicial será somando com o contador
#até atingir o total de hosts que deve ser "pingado"
test="$ipini"

while [ $con -le $calc ]
do

#Aqui o comando ping executará um teste em cada host com a
#opção -c1 e será unida a viável $net e $test onde esta última
#contêm o IP dentro do range a ser testado
	echo `ping -c1 $net.$test`

	con=$(($con + 1))
	test=$(($ipini+$con))

done

sleep 2
clear
echo "--------------------------------"
echo "	  FIM DOS TESTES         "
echo "--------------------------------"
echo
echo "-> Total de IPs testados: $con"

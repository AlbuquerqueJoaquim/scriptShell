#!/bin/bash


#Na Função abaixo você irá escolher o que deseja fazer. São quatro opções, todas alto-explicativas
max() {
clear
echo
echo -e "+==========================================================================+"
echo    "|                        Escolha uma das opções:                           |"
echo -e "+=======================================================================++++"
echo -e "| 1. Instalar Pacotes --> para instalar alguns programas em seu sistema!   |"
echo -e "| 2. Desinstalar Pacotes --> desinstala pacotes descritos por você!        |"
echo -e "| 3. Limpar Sistema --> executar algumas tarefas de limpeza e manutenção!  |"
echo -e "| 4. Atualizar sistema --> atualizar o sistema e seus softwares!           |"
echo -e "| 5. Sair                                                                  |"
echo -e "+==========================================================================+"
echo -n ">"
read opcao

case $opcao in
  1) pos ;;
  2) rm ;;
  3) clean ;;
  4) up ;;
  5) sair ;;
esac
}

#A função abaixo se refere a opção 1 (Instalar Pacotes), e irá pedir-lhe para instalar alguns programas.
#Os programas que já estiverem instalados não mais aparecerão na tela de opções, dando uma melhor usabilidade e ganho de tempo.
pos() {
clear
#Pós instalação do ubuntu
#Apresentação
opensource() {
echo -------------------------------------------------------------------------------
echo "Este Shell-Scipt foi criado para lhe ajudar, seja você um usuário linux
iniciante que busca uma maneira fácil e rápida de instalar alguns programas
importantes no seu sistema, ou seja você um usuário avançado que já está cançado
de tanto digitar comandos só para instalar seus softwares favoritos."
echo
echo "A lista de pacotes que podem ser instalados por este script é realmente muito boa.
Dentre eles podemos destacar alguns como, o google-chrome, opera-browser, clipgrab, virtualbox e muitos outros."
echo "OBS.: A maioria dos pacotes serão instalados via PPA, então se você por algum motivo
não gosta deste método, pode instalar tudo normalmente e remover as PPAs depois."
echo "O que é PPA?"
echo "www.diolinux.com.br/2013/02/como-adicionar-um-ppa-no-ubuntu.html"
echo "Como remove-las?"
echo "www.edivaldobrito.com.br/remover-repositorios-no-ubuntu-sem-complicacao/"
echo -------------------------------------------------------------------------------
echo
echo -n "Precione [ENTER] para continuar:"
read opcao
case $opcao in
  enter) cont ;;
esac
}

cont() {
clear
}

opensource

teste() {
clear
echo
echo "Como deseja fazer isso?"
echo
echo "1. A partir de uma lista de pacotes pré-configurada"
echo "2. Digitar o nome do pacote a ser instalado"
echo
echo -n ">"
read opcao
case $opcao in
  1) pre ;;
  2) auto ;;
esac
}

pre() {
#Google-Chrome (PPA)
clear
pacote=$(dpkg --get-selections | grep google-chrome-stable )
if [ -n "$pacote" ] ;
then
clear
else
lmc() {
clear
echo
echo "Instalar o google-chrome?"
echo
echo "1. Sim"
echo "2. Não"
echo
echo -n "Qual a opção desejada?"
read opcao
case $opcao in
  1) sim ;;
  2) nao ;;
esac
}

sim() {
echo
echo -------------------------------------------------------------------------------
echo
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo
echo -------------------------------------------------------------------------------
echo
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
echo
echo -------------------------------------------------------------------------------
echo
sudo apt-get update && sudo apt-get install google-chrome-stable
echo
echo -------------------------------------------------------------------------------
echo
echo "Google-Chrome Instalado"
sleep 2s
clear
}

nao() {
echo
echo "Google-Chrome não será instalado!"
echo -------------------------------------------------------------------------------
sleep 2s
clear
}

lmc
fi

#Opera-Browser (PPA)
pacote=$(dpkg --get-selections | grep opera-stable )
if [ -n "$pacote" ] ;
then
clear
else
ic() {
echo
echo "Instalar Opera-Browser?"
echo
echo "1. Sim"
echo "2. Não"
echo
echo -n "Qual a opção desejada?"
read opcao
case $opcao in
  1) sim ;;
  2) nao ;;
esac
}

sim() {
echo
echo -------------------------------------------------------------------------------
echo
wget -qO- https://deb.opera.com/archive.key | sudo apt-key add -
echo
echo -------------------------------------------------------------------------------
echo
sudo sh -c 'echo "deb http://deb.opera.com/opera-stable/ stable non-free" >> /etc/apt/sources.list.d/opera.list'
echo
echo -------------------------------------------------------------------------------
echo
sudo apt-get update && sudo apt-get install opera-stable
echo
echo -------------------------------------------------------------------------------
echo
echo "Opera-Browser Instalado!"
sleep 2s
clear
}

nao() {
echo
echo "Opera-Browser não será instalado!"
echo -------------------------------------------------------------------------------
sleep 2s
clear
}

ic
fi

#Open-JDK (PPA)
pacote=$(dpkg --get-selections | grep openjdk-8-jdk )
if [ -n "$pacote" ] ;
then
clear
else
kmc() {
echo
echo "Instalar Open-JDK?"
echo
echo "1. Sim"
echo "2. Não"
echo
echo -n "Qual a opção desejada?"
read opcao
case $opcao in
  1) sim ;;
  2) nao ;;
esac
}

sim() {
echo
echo -------------------------------------------------------------------------------
echo
sudo add-apt-repository ppa:openjdk-r/ppa
echo
echo -------------------------------------------------------------------------------
echo
sudo apt-get update && sudo apt-get install openjdk-8-jdk
echo
echo -------------------------------------------------------------------------------
echo
echo "Open-JDK Instalado!"
sleep 2s
clear
}

nao() {
echo
echo "Open-JDK não será instalado!"
echo -------------------------------------------------------------------------------
sleep 2s
clear
}

kmc
fi

#Oracle-Java_JRE (PPA)
pacote=$(dpkg --get-selections | grep oracle-java8-installer )
if [ -n "$pacote" ] ;
then
clear
else
teste() {
echo
echo "Instalar Oracle-Java?"
echo
echo "1. Sim"
echo "2. Não"
echo
echo -n "Qual a opção desejada?"
read opcao
case $opcao in
  1) sim ;;
  2) nao ;;
esac
}

sim() {
echo
echo -------------------------------------------------------------------------------
echo
sudo add-apt-repository ppa:webupd8team/java
echo
echo -------------------------------------------------------------------------------
echo
sudo apt-get update && sudo apt-get install oracle-java8-installer
echo
echo -------------------------------------------------------------------------------
echo
echo "Oracle-Java instalado!"
sleep 2s
clear
}

nao() {
echo
echo "Oracle-Java não será instalado!"
echo -------------------------------------------------------------------------------
sleep 2s
clear
}

teste
fi

#Uget (PPA)
pacote=$(dpkg --get-selections | grep uget )
if [ -n "$pacote" ] ;
then
clear
else
ltmc() {
echo
echo "Instalar Uget?"
echo
echo "1. Sim"
echo "2. Não"
echo
echo -n "Qual a opção desejada?"
read opcao
case $opcao in
  1) sim ;;
  2) nao ;;
esac
}

sim() {
echo
echo -------------------------------------------------------------------------------
echo
sudo add-apt-repository ppa:plushuang-tw/uget-stable
echo
echo -------------------------------------------------------------------------------
echo
sudo apt-get update && sudo apt-get install uget
echo
echo -------------------------------------------------------------------------------
echo
echo "Uget instalado!"
sleep 2s
clear
}

nao() {
echo
echo "Uget não será instalado!"
echo -------------------------------------------------------------------------------
sleep 2s
clear
}

ltmc
fi

#Jdownloader (PPA)
pacote=$(dpkg --get-selections | grep jdownloader-installer )
if [ -n "$pacote" ] ;
then
clear
else
jd() {
echo
echo "Instalar Jdownloader?"
echo
echo "1. Sim"
echo "2. Não"
echo
echo -n "Qual a opção desejada?"
read opcao
case $opcao in
  1) sim ;;
  2) nao ;;
esac
}

sim() {
echo
echo -------------------------------------------------------------------------------
echo
sudo add-apt-repository ppa:jd-team/jdownloader
echo
echo -------------------------------------------------------------------------------
echo
sudo apt-get update && sudo apt-get install jdownloader-installer
echo
echo -------------------------------------------------------------------------------
echo
echo "Jdownloader pré-instalado!"
sleep 2s
clear
}

nao() {
echo
echo "Jdownloader não será instalado!"
echo -------------------------------------------------------------------------------
sleep 2s
clear
}

jd
fi

#Qbittorrent (PPA)
pacote=$(dpkg --get-selections | grep qbittorrent )
if [ -n "$pacote" ] ;
then
clear
else
qb() {
echo
echo "Instalar Qbittorrent?"
echo
echo "1.Sim"
echo "2.Não"
echo
echo -n "Qual a opção desejada?"
read opcao
case $opcao in
  1) sim ;;
  2) nao ;;
esac
}

sim() {
echo
echo -------------------------------------------------------------------------------
echo
sudo add-apt-repository ppa:qbittorrent-team/qbittorrent-stable
echo
echo -------------------------------------------------------------------------------
echo
sudo apt-get update && sudo apt-get install qbittorrent
echo
echo -------------------------------------------------------------------------------
echo
echo "Qbittorrent instalado!"
sleep 2s
clear
}

nao() {
echo
echo "Qbittorrent não será instalado!"
echo -------------------------------------------------------------------------------
sleep 2s
clear
}

qb
fi

#Vuze (PPA)
pacote=$(dpkg --get-selections | grep vuze )
if [ -n "$pacote" ] ;
then
clear
else
vuze() {
echo
echo "Instalar cliente bittorrent Vuze?"
echo
echo "1. Sim"
echo "2. Não"
echo
echo -n Qual a opção desejada?
read opcao
case $opcao in
  1) sim ;;
  2) nao ;;
esac
}

sim() {
echo
echo -------------------------------------------------------------------------------
echo
wget -q -O- http://archive.getdeb.net/getdeb-archive.key | sudo apt-key add -
echo
echo -------------------------------------------------------------------------------
echo
sudo sh -c 'echo "deb http://archive.getdeb.net/ubuntu $(lsb_release -cs)-getdeb apps" >> /etc/apt/sources.list'
echo
echo -------------------------------------------------------------------------------
echo
sudo apt-get update && sudo apt-get install vuze
echo
echo -------------------------------------------------------------------------------
echo
echo "Cliente bittorrent Vuze instalado!"
sleep 2s
clear
}

nao() {
echo
echo "Cliente bittorrent Vuze não será instalado!"
echo -------------------------------------------------------------------------------
sleep 2s
clear
}

vuze
fi

#Ubuntu-Tweak (PPA)
pacote=$(dpkg --get-selections | grep ubuntu-tweak )
if [ -n "$pacote" ] ;
then
clear
else
linus() {
echo
echo "Instalar Ubuntu-Tweak?"
echo
echo "1. Sim"
echo "2. Não"
echo
echo -n "Qual a opção desejada?"
read opcao
case $opcao in
  1) sim ;;
  2) nao ;;
esac
}

sim() {
echo
echo -------------------------------------------------------------------------------
echo
sudo add-apt-repository ppa:trebelnik-stefina/ubuntu-tweak
echo
echo -------------------------------------------------------------------------------
echo
sudo apt-get update && sudo apt-get install ubuntu-tweak
echo
echo -------------------------------------------------------------------------------
echo
echo "Ubuntu-Tweak instalado!"
sleep 2s
clear
}

nao() {
echo
echo "Ubuntu-Tweak não será instalado!"
echo -------------------------------------------------------------------------------
sleep 2s
clear
}

linus
fi

#Unity-Tweak-Tool
pacote=$(dpkg --get-selections | grep unity-tweak-tool )
if [ -n "$pacote" ] ;
then
clear
else
stallman() {
echo
echo "Instalar Unity-Tweak-Tool?"
echo
echo "1. Sim"
echo "2. Não"
echo
echo -n "Qual a opção desejada?"
read opcao
case $opcao in
  1) sim ;;
  2) nao ;;
esac
}

sim() {
echo
echo -------------------------------------------------------------------------------
echo
sudo apt-get install unity-tweak-tool
echo
echo -------------------------------------------------------------------------------
echo
echo "Unity-Tweak-Tool instalado!"
sleep 2s
clear
}

nao() {
echo
echo "Unity-Tweak-Tool não será instalado!"
echo -------------------------------------------------------------------------------
sleep 2s
clear
}

stallman
fi

#Grub-Customizer (PPA)
pacote=$(dpkg --get-selections | grep grub-customizer )
if [ -n "$pacote" ] ;
then
clear
else
ubuntu() {
echo
echo "Instalar Grub-Customizer?"
echo
echo "1. Sim"
echo "2. Não"
echo
echo -n "Qual a opção desejada?"
read opcao
case $opcao in
  1) sim ;;
  2) nao ;;
esac
}

sim() {
echo
echo -------------------------------------------------------------------------------
echo
sudo add-apt-repository ppa:danielrichter2007/grub-customizer && sudo apt-get update && sudo apt-get install grub-customizer
echo
echo -------------------------------------------------------------------------------
echo
echo "Grub-Customizer instalado!"
sleep 2s
clear
}

nao() {
echo
echo "Grub-Customizer não será instalado!"
echo -------------------------------------------------------------------------------
sleep 2s
clear
}

ubuntu
fi

#ClipGrab
pacote=$(dpkg --get-selections | grep clipgrab )
if [ -n "$pacote" ] ;
then
clear
else
linux() {
echo
echo "Instalar ClipGrab?"
echo
echo "1. Sim"
echo "2. Não"
echo
echo -n "Qual a opção desejada?"
read opcao
case $opcao in
  1) sim ;;
  2) nao ;;
esac
}

sim() {
echo
echo -------------------------------------------------------------------------------
echo
wget https://launchpad.net/~clipgrab-team/+archive/ubuntu/ppa/+files/clipgrab_3.6.5~xenial1_amd64.deb
echo
echo -------------------------------------------------------------------------------
echo
sudo dpkg -i clipgrab_3.6.5~xenial1_amd64.deb && sudo apt-get install -f
echo
echo -------------------------------------------------------------------------------
echo
echo "ClipGrab instalado!"
sleep 2s
clear
}

nao() {
echo
echo "ClipGrab não será instalado!"
echo -------------------------------------------------------------------------------
sleep 2s
clear
}

linux
fi

#VirtualBox (PPA)
pacote=$(dpkg --get-selections | grep virtualbox-5.1 )
if [ -n "$pacote" ] ;
then
clear
else
oracle() {
echo
echo "Instalar Oracle-VirtualBox?"
echo
echo "1. Sim"
echo "2. Não"
echo
echo -n "Qual a opção desejada?"
read opcao
case $opcao in
  1) sim ;;
  2) nao ;;
esac
}

sim() {
echo
echo -------------------------------------------------------------------------------
echo
sudo sh -c 'echo "deb http://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) contrib" >> /etc/apt/sources.list.d/virtualbox.list'
echo
echo -------------------------------------------------------------------------------
echo
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add - && wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
echo
echo -------------------------------------------------------------------------------
echo
sudo apt-get update && sudo apt-get install virtualbox-5.1
echo
echo -------------------------------------------------------------------------------
echo
echo "Oracle-VirtualBox instalado!"
sleep 2s
clear
}

nao() {
echo
echo "Oracle-VirtualBox não será instalado!"
echo -------------------------------------------------------------------------------
sleep 2s
clear
}

oracle
fi

#Pinguy-Buider
pacote=$(dpkg --get-selections | grep pinguybuilder )
if [ -n "$pacote" ] ;
then
clear
else
tux() {
echo
echo "Instalar Pinguy-Buider?"
echo
echo "1. Sim"
echo "2. Não"
echo
echo -n "Qual a opção desejada?"
read opcao
case $opcao in
  1) sim ;;
  2) nao ;;
esac
}

sim() {
echo
echo -------------------------------------------------------------------------------
echo
wget https://sourceforge.net/projects/pinguy-os/files/ISO_Builder/pinguybuilder_4.3-8_all-beta.deb/download -O pinguybuilder.deb
echo
echo -------------------------------------------------------------------------------
echo
sudo dpkg -i pinguybuilder.deb && sudo apt-get install -f
echo
echo -------------------------------------------------------------------------------
echo
echo "Pinguy-Buider instalado!"
sleep 2s
clear
}

nao() {
echo
echo "Pinguy-Buider não será instalado!"
echo -------------------------------------------------------------------------------
sleep 2s
clear
}

tux
fi

#Popcorn-Time
if [ -d /opt/popcorntime/ ] ;
then
clear
else
mint() {
echo
echo "Instalar Popcorn-Time?"
echo
echo "1. Sim"
echo "2. Não"
echo
echo -n "Qual a opção desejada?"
read opcao
case $opcao in
  1) sim ;;
  2) nao ;;
esac
}

sim() {
echo
echo -------------------------------------------------------------------------------
echo
wget https://get.popcorntime.sh/build/Popcorn-Time-0.3.10-Linux-64.tar.xz -O popcorntime.tar.xz
echo
echo -------------------------------------------------------------------------------
echo
sudo mkdir /opt/popcorntime && sudo tar Jxf popcorntime.tar.xz -C /opt/popcorntime/ && sudo ln -sf /opt/popcorntime/Popcorn-Time /usr/bin/Popcorn-Time && echo -e '[Desktop Entry]\n Version=1.0\n Name=popcorntime\n Exec=/opt/popcorntime/Popcorn-Time\n Icon=/opt/popcorntime/src/app/images/icon.png\n Type=Application\n Categories=Application' | sudo tee /usr/share/applications/popcorntime.desktop
echo
echo -------------------------------------------------------------------------------
echo
echo "Popcorn-Time instalado!"
sleep 2s
clear
}

nao() {
echo
echo "Popcorn-Time não será instalado!"
echo -------------------------------------------------------------------------------
sleep 2s
clear
}

mint
fi

#Plugins-Para-Rhythmbox
pacote=$(dpkg --get-selections | grep rhythmbox-plugin-zeitgeist )
if [ -n "$pacote" ] ;
then
som() {
echo
echo "Intalar Rhythmbox-plugins?"
echo
echo "1. Sim"
echo "2. Não"
echo
echo -n "Qual a opção desejada?"
read opcao
case $opcao in
  1) sim ;;
  2) nao ;;
esac
}

sim() {
echo
echo -------------------------------------------------------------------------------
echo
sudo add-apt-repository ppa:fossfreedom/rhythmbox-plugins && sudo apt-get update
echo
echo -------------------------------------------------------------------------------
echo
sudo apt-get install rhythmbox-plugin-alternative-toolbar && sudo apt-get install rhythmbox-plugin-equalizer && sudo apt-get install rhythmbox-plugin-tray-icon && sudo apt-get install rhythmbox-plugin-repeat-one-song && sudo apt-get install rhythmbox-plugin-fullscreen
echo
echo -------------------------------------------------------------------------------
echo
echo "Rhythmbox-plugins instalados!"
sleep 2s
clear
}

nao() {
echo
echo "Rhythmbox-plugins não será instalado!"
echo -------------------------------------------------------------------------------
sleep 2s
clear
}

som
else
clear
fi

#Clementine
pacote=$(dpkg --get-selections | grep clementine )
if [ -n "$pacote" ] ;
then
clear
else
mus() {
echo
echo "Instalar player Clementine?"
echo
echo "1. Sim"
echo "2. Não"
echo
echo -n "Qual a opção desejada?"
read opcao
case $opcao in
  1) sim ;;
  2) nao ;;
esac
}

sim() {
echo
echo -------------------------------------------------------------------------------
echo
sudo add-apt-repository ppa:me-davidsansome/clementine
echo
echo -------------------------------------------------------------------------------
echo
sudo apt-get update && sudo apt-get install clementine
echo
echo -------------------------------------------------------------------------------
echo
echo "Player Clementine instalado!"
sleep 2s
clear
}

nao() {
echo
echo "Player Clementine não será instalado!"
echo -------------------------------------------------------------------------------
sleep 2s
clear
}

mus
fi

#PPA para libreoffice
repository=$(grep -RoPish "ppa.launchpad.net/[^/]+/[^/ ]+" /etc/apt | sort -u | sed -r 's/\.[^/]+\//:/' | grep ppa:libreoffice/ppa )
if [ -n "$repository" ] ;
then
clear
else
Off() {
echo
echo "Atualizar LibreOffice?"
echo
echo "1. Sim"
echo "2. Não"
echo
echo -n "Qual a opção desejada?"
read opcao
case $opcao in
  1) sim ;;
  2) nao ;;
esac
}

sim() {
echo
echo -------------------------------------------------------------------------------
echo
sudo apt-get remove --purge libreoffice*
echo
echo -------------------------------------------------------------------------------
echo
sudo add-apt-repository -y ppa:libreoffice/ppa && sudo apt-get update
echo
echo -------------------------------------------------------------------------------
echo
sudo apt-get install libreoffice libreoffice-style-breeze
echo
echo -------------------------------------------------------------------------------
echo
echo "LibreOffice atualizado!"
sleep 2s
clear
}

nao() {
echo
echo LibreOffice não será atualizado!
echo -------------------------------------------------------------------------------
sleep 2s
clear
}

Off
fi
max
}

auto() {
clear
echo
echo -n "Digite aqui o nome do pacote a ser instalado:"
read nome
sleep 1s
clear
echo
echo "Preparando para instalar $nome..."
echo -------------------------------------------------------------------------------
sleep 1s
sudo apt-get install $nome
echo
echo -------------------------------------------------------------------------------
echo "Instalação completa!"
echo -------------------------------------------------------------------------------
sleep 2s
clear
}

teste
max
}

#A função abaixo se refere a opção 2 (Desinstalar Pacotes), e irá desinstalar o pacote que você desejar.
rm() {
clear
echo
echo -n "Digite aqui o nome do pacote a ser removido:"
read nome
sleep 1s
clear
echo
echo "Preparando para remover $nome..."
echo -------------------------------------------------------------------------------
sleep 1s
sudo apt-get remove --purge $nome
echo
echo -------------------------------------------------------------------------------
echo "Desinstalação completa!"
echo -------------------------------------------------------------------------------
sleep 2s
clear
max
}

#A função abaixo se refere a opção 3 (Limpar Sistema), e irá executar uma série de comandos em sequência, a fim de limpar a sugeira em seu sistema ou até corrigir pequenos erros.
#Ela também instalará um pacote chamado deborphan caso o mesmo não esteja instalado. Este pacote serve para limpar dependencias obsoletas que ficam para trás após desinstalar os programas que antes dependiam de.las
clean() {
clear
echo
echo "Prepaparando para Limpar..."
echo -------------------------------------------------------------------------------
sleep 1s
pacote=$(dpkg --get-selections | grep deborphan )
if [ -n "$pacote" ] ;
then
     sleep 1s
else echo
     echo "O pacote deborphan precisa ser instalado..."
     sleep 1s
     echo  -------------------------------------------------------------------------------
     echo "Instalando deborphan"
     sudo apt-get install deborphan
     echo "Deborphan instalado!"
fi
sudo apt-get clean
sudo apt-get autoclean
sudo apt-get -f install
sudo apt-get -y autoclean
sudo apt-get -y clean
sudo apt-get autoremove
sudo apt-get autoremove $(deborphan)
sudo deborphan | xargs sudo apt-get -y remove
sudo deborphan --guess-data | xargs sudo apt-get -y remove
echo
echo -------------------------------------------------------------------------------
echo "Limpeza completa!"
echo -------------------------------------------------------------------------------
sleep 2s
clear
max
}

#A função abaixo se refere a opção 4 (Atualizar sistema), e irá atualizar sua lista de repositórios e instalar as atualizações disponiveis para sua distro.
#ATENÇÂO: Esta opção não fará um upgrade de sua distro, ex: da versão 16.04 para 16.10, ela pode apenas atualizar os pacotes que possuem atualizações disponiveis para sua respective distro.
up() {
clear
echo
echo "Preparando para atualizar..."
echo -------------------------------------------------------------------------------
sleep 1s
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install -f
sudo dpkg --configure -a
echo
echo -------------------------------------------------------------------------------
echo "Atualização completa!"
echo -------------------------------------------------------------------------------
sleep 2s
clear
max
}

#A função abaixo se refere a opção 5 (Sair), e irá encerrar o script.
sair() {
clear
exit
max
}

max

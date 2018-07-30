#!/bin/bash
#
# Informações do sistema operacional baseado em Debian
# Kernel, CPUs, Memória e Uptime
#
#
KERNEL=$(grep BOOT_IMAGE /proc/cmdline | cut -d' ' -f 1 | cut -d'/' -f 3)

PROCESSADOR_NOME=$(grep 'model name' /proc/cpuinfo | tail -n 1 | cut -d':' -f 2 | sed 's/^ //g')
PROCESSADOR_CORES=$(grep 'cpu cores' /proc/cpuinfo | tail -n 1 | cut -d':' -f 2 | sed 's/^ //g')

MEMORIA_TOTAL_KB=$(grep MemTotal /proc/meminfo | grep -Eo '[0-9]{1,}')
MEMORIA_TOTAL_MB=$(echo $MEMORIA_TOTAL_KB / "1024" | bc)
SWAP_TOTAL_KB=$(grep SwapTotal /proc/meminfo | grep -Eo '[0-9]{1,}')
SWAP_TOTAL_MB=$(echo $SWAP_TOTAL_KB / "1024" | bc)

UPTIME_S=$(cut -d' ' -f 1 /proc/uptime)
UPTIME_MIN=$(echo $UPTIME_S / "60" | bc)

clear
echo -e "+==========================================================+"
echo -e "+==========================================================+"
echo -e "|                  INFORMAÇÕES DO SISTEMA                  |"
echo -e "+==========================================================+"
echo -e "+==========================================================+"
echo -e "  Kernel.......: "$KERNEL"\n"
echo -e "  Processador..: "$PROCESSADOR_NOME
echo -e "  CPUs.........: "$PROCESSADOR_CORES"\n"
echo -e "  Memória......: "$MEMORIA_TOTAL_KB" KB"
echo -e "  Memória......: "$MEMORIA_TOTAL_MB" MB"
echo -e "  Memória Swap.: "$SWAP_TOTAL_KB" KB"
echo -e "  Memória Swap.: "$SWAP_TOTAL_MB" MB\n"
echo -e "  Uptime.......: "$UPTIME_MIN" minutos"
echo -e "+==========================================================+"
echo -e "+==========================================================+"

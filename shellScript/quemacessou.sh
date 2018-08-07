# Verificando os acessos
cat /var/log/squid/access.log | grep $1 | awk '{ printf "%12s %-67s\n", $3, $7}'

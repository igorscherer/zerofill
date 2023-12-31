#!/bin/bash

# Script para ZeroFill com até 4 HDDs simultâneos
# Criador: Igor Scherer
# Criado em: 01/09/2022
# Atualizado em: 20/12/2023 (Corrigido zerrar_hd() antes acusava "Falha ao zerar disco" pois o comando dd não recebia o tamanho a ser zerado do disco)
# Script version: 1.1.2

# Arquivo de log remoto
remotefilelog="/IMAGENS/seriais.txt"

# Função para verificar privilégios de superusuário
check_root() {
    if [[ $EUID -ne 0 ]]; then
        echo "Este script deve ser executado como superusuário (root)." 
        exit 1
    fi
}

# Função para obter o serial number do computador e dos HDDs
get_sn_hds() {
    {
        echo -n "Serial Computador: "
        dmidecode -s system-serial-number
        date +"%d-%m-%y %T"
    } >> "$remotefilelog"

    {
        echo "Seriais dos HDs"
        lshw -class disk | grep "serial:"
    } >> "$remotefilelog"

    echo -e "\n" >> "$remotefilelog"
    echo "Seriais enviados para $remotefilelog"
}

# Função para zerar um disco, com tratamento de erros
zerar_hd() {
    local disco="$1"
    if [[ -e "$disco" ]]; then

        #Determina o tamanho do disco a ser zerado
        local disk_size=$(blockdev --getsize64 "$disco")
        local count=$((disk_size / (4 * 1024 * 1024))) # 4M tamanho do bloco


        dd if=/dev/zero of="$disco" bs=4M count="$count" status=progress
        if [[ $? -eq 0 ]]; then
            echo "Disco $disco zerado com sucesso"
        else
            echo "Falha ao zerar disco $disco"
        fi
    else
        echo "Disco $disco não encontrado"
    fi
}

# Função para zerar uma lista de discos
zerar_discos() {
    local discos=("$@")
    for disco in "${discos[@]}"; do
        zerar_hd "$disco" &
    done
    wait
}

# Função para zerar todos os discos especificados
zerar_todos() {
    check_root
    get_sn_hds

    # Lista de discos a serem zerados
    local discos=("/dev/sda" "/dev/sdb" "/dev/sdc" "/dev/sdd")

    zerar_discos "${discos[@]}"

    echo -e "\a"; sleep 0.5; echo -e "\a"; sleep 0.5; echo -e "\a"
    echo "Todos os HDDs foram zerados, desligando o computador em 1 minuto."
    shutdown -P +1
}

# Chama a função para zerar todos os discos
zerar_todos

#!/bin/bash

# Script para ZeroFill com até 4 HDDs simultâneos
# Criador: Igor Scherer
# Criado em: 01/09/2022
# Atualizado em: 31/05/2023 (Adicionada função para registrar o serial number dos HDDs)

# Arquivo de log remoto
remotefilelog="/IMAGENS/seriais.txt"

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

# Função para zerar um disco
zerar_hd() {
    local disco="$1"
    dd if=/dev/zero of="$disco" bs=4M status=progress
    echo "Disco $disco zerado com sucesso"
}

# Função para zerar todos os discos
zerar_todos() {
    get_sn_hds

    # Lista de discos a serem zerados
    discos=("/dev/sda" "/dev/sdb" "/dev/sdc" "/dev/sdd")

    for disco in "${discos[@]}"; do
        zerar_hd "$disco" &
    done

    wait

    echo -e "\a"; sleep 0.5; echo -e "\a"; sleep 0.5; echo -e "\a"
    echo "Todos os HDDs foram zerados, desligando o computador em 1 minuto."
    shutdown -P +1
}

# Chama a função para zerar todos os discos
zerar_todos

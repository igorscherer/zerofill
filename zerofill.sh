#!/bin/bash
#Script para ZeroFill com ate 4 HDDs simultaneos
#Criador Igor Scherer
#Criado em 01/09/2022
#Atualizado em 31/05/2023 (Adicionado função para registar serial number dos hdds)

remotefilelog=/IMAGENS/seriais.txt

getsnhds(){
	{ echo -n "Serial Computador: "; dmidecode -s system-serial-number; date +"%d-%m-%y %T"; } >> $remotefilelog;
	{ echo "Seriais dos HDs "; lshw -class disk | grep "serial:"; }  >> $remotefilelog;
	echo -e "\n" >> $remotefilelog;
	echo "Seriais enviados para $remotefilelog";
}

zerahd1(){
	dd if=/dev/zero of=/dev/sda bs=4M status=progress;
	echo "HDD 1 Zerado com sucesso";
}
zerahd2(){
	dd if=/dev/zero of=/dev/sdb bs=4M status=progress;
	echo "HDD 2 Zerado com sucesso";
}
zerahd3(){
	dd if=/dev/zero of=/dev/sdc bs=4M status=progress;
	echo "HDD 3 Zerado com sucesso";
}
zerahd4(){
	dd if=/dev/zero of=/dev/sdd bs=4M status=progress;
	echo "HDD 4 Zerado com sucesso";
}

zeratodos(){
getsnhds;
zerahd1 &
zerahd2 &
zerahd3 &
zerahd4 &

wait

echo -e "\a"; sleep .5; echo -e "\a"; sleep .5; echo -e "\a";
echo "Todos Hds foram zerados, desligando o computador em 1 minuto.";
shutdown -P +1

}
zeratodos

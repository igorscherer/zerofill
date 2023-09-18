#Script para ZeroFill com ate 4 HDDs simultaneos

#Funcao de zerar o Hd1
zerahd1(){
	dd if=/dev/zero of=/dev/sda bs=4M status=progress;
	echo HDD 1 Zerado com sucesso;
}
#Funcao de zerar o Hd2
zerahd2(){
	dd if=/dev/zero of=/dev/sdb bs=4M status=progress;
	echo HDD 2 Zerado com sucesso;
}
#Funcao de zerar o Hd3
zerahd3(){
	dd if=/dev/zero of=/dev/sdc bs=4M status=progress;
	echo HDD 3 Zerado com sucesso;
}
#Funcao de zerar o Hd4
zerahd4(){
	dd if=/dev/zero of=/dev/sdd bs=4M status=progress;
	echo HDD 4 Zerado com sucesso;
}
#Funcao de zerar todos hdds
zeratodos(){
zerahd1 &
zerahd2 &
zerahd3 &
zerahd4 &

wait

echo -e "\a"; sleep .5; echo -e "\a"; sleep .5; echo -e "\a";
echo Todos Hds foram zerados, desligando o computador em 1 minuto.;
shutdown -P +1

}
#Chama a funcao para zerar todos hdds
zeratodos

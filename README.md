English version: [![en](https://img.shields.io/badge/lang-en-red.svg)](https://github.com/igorscherer/zerofill/blob/main/README.en-us.md)


# ZeroFill Script para até 4 HDDs simultâneos

**AVISO: Este script realizará uma ação irreversível e apagará permanentemente todos os dados dos discos rígidos. Certifique-se de fazer backup de todos os dados importantes antes de continuar. Use com extrema cautela.**

Este é um simples script bash que permite zerar 4 discos rígidos (HDDs) simultaneamente usando o comando `dd` e enviar os seriais dos mesmos para um arquivo txt em algum local selecionado, neste caso é um ponto de montagem /IMAGENS/seriais.txt, podendo ser alterado conforme necessário. Ele é útil para tarefas de formatação de dados em discos rígidos.

## Como Usar

1. **Clone este repositório em sua máquina local**:

   ```shell
   git clone https://github.com/igorscherer/zerofill.git
   
Navegue até o diretório do projeto:
cd zerofill

2. Execute o script:
./zerofill.sh

Certifique-se de dar permissões de execução aos scripts, se necessário, usando o comando chmod +x zerofill.sh.
**Lembre-se de que a operação de zeragem irá apagar todos os dados do disco rígido selecionado.**

# Notas Importantes
*Até o momento o script apenas funciona com Hdds que estejam montados como (SDA,SDB,SDC,SDD), podendo funcionar com outros tipos alterando o script.*

Certifique-se de usar este script com cuidado, pois ele apagará todos os dados dos discos rígidos.
Recomenda-se utilizá-lo com PXE Boot para utilizar um SO live com boot pela lan.
Este script pode ser usado para automatizar o processo de zeragem de discos rígidos, economizando tempo ao lidar com vários discos simultaneamente.
O script possui a função de zerar todos os HDDs simultaneamente e desligar o computador automaticamente 1 minuto após a conclusão e 3 apitos de avisos, dependendo se o computador possuir altos-falantes.

Certifique-se de ter os privilégios necessários para executar operações de baixo nível em dispositivos de armazenamento, como o comando dd.

## Não me responsabilizo pelo mau uso e perca de dados que venham a ser relacionadas com este script.

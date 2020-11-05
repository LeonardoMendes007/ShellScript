#!/bin/bash

opc=0

while [ $opc -ne 6 ]; do

  echo "
  Assistente de Usuário
  1 - Criar um novo diretório
  2 - Excluir um diretório
  3 - Permitir acesso de escrita e leitura a um arquivo ou diretório   
  4 - Fazer backups dos arquivos pessoais
  5 - Limpar meus arquivos temporários
  6 - Sair" 

  read opc

  case "$opc" in
    1)
        echo "Digite o nome do diretorio: "

        read direcName;

        mkdir $direcName
    ;;
    2)
        echo "Digite o diretorio que queira excluir: "

        read direcName;

        rmdir $direcName
    ;;
    3)
        echo "Digite o diretorio ou arquivo: "

        read path;

        echo "Digite o codigo de permissão ( 1 - executa, 2 - escrita, 4 - leitura): "

        read value;

        sudo chmod $value $path
        
    ;;
    4)
        echo "Digite o diretorio que deseja fazer backup: "

        read path;

        echo "Digite o nome do backup: ";

        read name;

        tar "cvf" $name".tar.gz" "$path"
    ;;
    5)
        rm " -r /tmp "
    ;;
    6)
        echo "Saindo..."

        opc=6

    ;;
    *)

        echo "Opção inválida"
  esac

done
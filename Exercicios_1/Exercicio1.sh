#!/bin/bash

echo "Digite um nome para saber os grupos que ele pertence:" 

read nome;

for arquivo in $(groups $nome)
do

   echo $arquivo


done
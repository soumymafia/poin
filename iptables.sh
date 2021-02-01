#!/bin/bash

# created by SoumyMafia
# Shared under GNU v4

clear

echo ""
echo "-----------------------------------------"
echo "              Vps Pointing               "
echo "-----------------------------------------"

PS3="$(printf -- "------------------------------------------------------------------")""
Pilih Opsi Yang Ingin Digunakan : "
printf -- "\n------------------------------------------------------------------\n"
select opt in "Create" "Cek" "Delete" "Exit" ; do

  case $opt in
      "Create")
read -p "Port Yang mau dibuka : " scr ;
read -p "Masukan Ip Vps Nya : " desth ;
read -p "Port External Ip Vps : " destp ;
sudo iptables -t nat -A PREROUTING -p tcp --dport "$scr" -j DNAT --to-destination "$desth":"$destp"
sudo iptables -t nat -A POSTROUTING -j MASQUERADE
echo "Selesai!"
echo "Goodbye Jomblo!"
echo "Created By SoumyMafia"
      ;;
      "Cek")
sudo iptables -t nat -v -L PREROUTING -n
      ;;
      "Exit")
exit
printf -- "Selesai!\n\n"
      ;;
      "Delete")
sudo iptables -t nat -v -L PREROUTING -n --line-number
read -p "Select Number : " num ;
sudo iptables -t nat -D PREROUTING "$num"
printf -- "Selesai\n\n"
      ;;
   "A")
      exit
      ;;
     *)
echo
      ;;
  esac
done

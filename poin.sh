#!/bin/bash

#created by SoumyMafia
# Shared under GNU v3

clear
	#Cek user root
	if [ "$EUID" -ne "0" ]
	then
		echo "Login root dulu Boss"
		exit
	fi

	echo "Masukan port yang mau di open"
	read -r "extport"

	echo "Masukan IP VPS yang ingin Anda port pointing"
	read "vpsip"

	echo "Masukan port internal"
	read "intport"

	iptables -A PREROUTING -t nat -i  p4p1 -p tcp --dport "$extport" -j DNAT --to "$vpsip":"$intport"

	echo "Apakah Anda ingin menyimpan aturan pointing? [y/n]"
	read "simpan"

	if [ "$simpan" == "y" ]
	then
		echo "Menyimpan"
		iptables-save
	fi

	echo "Selesai! Ingatlah untuk menambahkan aturan firewall untuk $extport $protocol sisi server"
	echo "Goodbye Jomblo!"
	echo "Created By SoumyMafia"

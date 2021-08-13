#!/bin/bash
RED='\033[0;31m'
GREEN='\033[0;36m'

target=$2
public=$1

if [ -z "${target}" ] || [ -z "${public}" ] ;
then
	printf "\n${RED}argumet missing";
        printf "\nusage: ${0##*/} public target";
else
	eval "ssh -L 8080:$target:80 root@$public"	
fi

#!/bin/bash
BOOT_SECTOR="boot.bin"
OUTPUT_DIR="bin"
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
cd $DIR

if [ ! -e ${OUTPUT_DIR}/${BOOT_SECTOR} ]; then
	echo -e "$(tput sgr0)$(tput bold)$(tput setaf 1)Could not find ${OUTPUT_DIR}/${BOOT_SECTOR}!$(tput sgr0)"
	echo -e "$(tput sgr0)$(tput bold)$(tput setaf 1)Run ./assemble.sh first!$(tput sgr0)"
	exit 1
fi

echo -e "$(tput sgr0)Booting with QEMU ..."
qemu-system-x86_64 -drive format=raw,file=${OUTPUT_DIR}/${BOOT_SECTOR}

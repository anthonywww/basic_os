#!/bin/bash
BOOT_SECTOR="boot_sector.asm"
INPUT_DIR="src"
OUTPUT_DIR="bin"
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"

echo -e "$(tput sgr0)$(tput setaf 2)Assembling boot sector ...$(tput sgr0)"
cd $DIR/$INPUT_DIR
nasm -f bin ${DIR}/${INPUT_DIR}/${BOOT_SECTOR} -o ${DIR}/${OUTPUT_DIR}/boot.bin

********************************************************************************
*-- Programa: LREMZ
*-- Fecha   : 03-24-93 04:05pm
*-- Version : G. REINER
*-- Notas   : DERIVA A LISTADOS DE REMITOS (DATOS ADMINISTRATIVOS)
********************************************************************************
PARAMETER PRPN
STORE "" TO TTQUE
STORE 1 TO FILEMP,FILFAC,FILCLI,FILFEC,FILVIA,FILPAG,FILMON,FILMER,FILART
FISC=''
DO WHILE QUERYREM(PRPN)
ENDDO
RETURN

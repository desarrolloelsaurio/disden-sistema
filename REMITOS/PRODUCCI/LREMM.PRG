********************************************************************************
*-- Programa: LREMM
*-- Fecha   : 03-24-93 04:05pm
*-- Version : G. REINER
*-- Notas   : DERIVA A LISTADOS DE REMITOS (MERCADERIAS ENVIADAS)
********************************************************************************
PARAMETER PRPN
STORE "" TO TTQUE
STORE 1 TO FILEMP,FILFAC,FILCLI,FILFEC,FILVIA,FILPAG,FILMON,FILMER,FILART
FISC=''
DO WHILE QUERYRMM(PRPN)
ENDDO
RETURN

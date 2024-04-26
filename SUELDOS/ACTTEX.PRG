********************************************************************************
*-- Programa: ACTTEX.PRG
*-- Fecha   : 03/28/91 03:08pm
*-- Version : G. REINER
*-- Notas   : INGRESA TEXTOS EN EL RECIBO
********************************************************************************
ULPR=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
@ 24,0 SAY PADC('Ingrese el Texto a Incluir en TODOS los Recibos',80,' ')
DEFINE WINDOW fic FROM 10,0 TO 14,78 DOUBLE TITL ' Ingrese Texto a Incluir en el Recibo de Sueldo ' SHADOW COLOR SCHE 8
ACTI WINDOW fic
STORE SPACE(70) TO ACTTEX
@ 1,1 GET acttex picture REPL("!",70)
READ
RELE WINDOW fic
@ 24,0 SAY SPACE(80)
RETURN

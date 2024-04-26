*:*********************************************************************
*:
*:        Program: CQRET1.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: BQRET.PRG
*:
*:          Calls: ELIRET()       (function  in PROCESOS.PRG)
*:
*:      Documented 04/23/91 at 21:05               FoxDoc  version 2.01
*:*********************************************************************
************************************
*-- Programa: Cqret1.PRG
*-- Fecha   : 12/15/90 05:57pm
*-- Version : G. REINER
*-- Notas   : BORRA retenciones
*************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
store .f. to sigue
do while .t.
	STORE 0 TO respuesta
	IF eliret('a Borrar')<>0
		th=respuesta
	   @ 24,0 SAY PADC('Borrando los Datos Requeridos',80,'*') COLOR SCHE 19
   	SELE liq
	   DELE for registro=th
		store .t. to sigue
	else
		exit
	ENDIF
ENDDO
sele liq
indice="LI"+LEFT(ptn[jannro],1)+'Q'+SUBSTR(ptn[jannro],2,1)+'u'+RIGHT(ptn[jannro],1)+LEFT(janname,1)
set index to (PATH+'\'+indice)
if sigue
   @ 24,0 SAY PADC(" Compactando el Archivo de Retenciones ",80,'*') COLO SCHE 19
	pack
endif
RELE th,fisc
RETURN
*: EOF: CQRET1.PRG

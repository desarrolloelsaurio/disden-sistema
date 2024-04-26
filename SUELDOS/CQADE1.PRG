*:*********************************************************************
*:
*:        Program: CQADE1.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: BADE.PRG
*:
*:          Calls: ELIGAS()       (function  in PROCESOS.PRG)
*:
*:      Documented 04/23/91 at 20:56               FoxDoc  version 2.01
*:*********************************************************************
************************************
*-- Programa: Cqade1.PRG
*-- Fecha   : 12/15/90 05:57pm
*-- Version : G. REINER
*-- Notas   : BORRA adelantos de sueldo
*************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
store .f. to sigue
do while .t.
	store 0 to respuesta
	IF eligas('a Borrar')<>0
   	th=respuesta
   	@ 24,0 SAY PADC(' Borrando los Datos Requeridos ',80,'*') colo sche 19
      SELE liq
      DELE for registro=th
		store .t. to sigue
	else
		exit
	endif
enddo
sele liq
indice="LI"+LEFT(ptn[jannro],1)+'Q'+SUBSTR(ptn[jannro],2,1)+'u'+RIGHT(ptn[jannro],1)+LEFT(janname,1)
set index to (PATH+'\'+indice)
if sigue
   @ 24,0 SAY PADC(" Compactando el Archivo de Adelantos ",80,'*') COLO SCHE 19
   PACK
ENDIF
RETURN
*: EOF: CQADE1.PRG

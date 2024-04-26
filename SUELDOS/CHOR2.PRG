*:*********************************************************************
*:
*:        Program: CHOR2.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: BHOR.PRG
*:
*:          Calls: ELITHOR()      (function  in PROCESOS.PRG)
*:
*:      Documented 04/23/91 at 21:03               FoxDoc  version 2.01
*:*********************************************************************
********************************************************
*-- Programa: CHOR2.PRG
*-- Fecha   : 01/30/91 09:41pm
*-- Version : G. REINER
*-- Notas   : BORRA HORAS TRABAJADAS DE UN SOLO EMPLEADO
********************************************************
STORE .F. TO borro
DO WHILE .T.
   STORE 0 TO respuesta
   IF elithor('a Borrar')<>0
      GOTO respuesta
      th=RECNO()
      @ 24,0 SAY PADC('Borrando los Datos Requeridos',80,'*') COLO SCHE 19
      SELE liq
      DELE FOR registro=th
      STORE .T. TO borro
   ELSE
      EXIT
   ENDIF
ENDDO
sele liq
indice="LI"+LEFT(ptn[jannro],1)+'Q'+SUBSTR(ptn[jannro],2,1)+'u'+RIGHT(ptn[jannro],1)+LEFT(janname,1)
set index to &indice
IF borro
   @ 24,0 SAY PADC(" Compactando el Archivo de Horas Trabajadas ",80,'*') COLO SCHE 19
   PACK
ENDIF
@ 24,0 SAY SPACE(80)
RETURN
*: EOF: CHOR2.PRG

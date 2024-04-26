*:*********************************************************************
*:
*:        Program: CQADI2.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: BQADI.PRG
*:
*:          Calls: ELIADI()       (function  in PROCESOS.PRG)
*:
*:      Documented 04/23/91 at 21:04               FoxDoc  version 2.01
*:*********************************************************************
********************************************************
*-- Programa: CQADI2.PRG
*-- Fecha   : 01/30/91 11:25pm
*-- Version : G. REINER
*-- Notas   : BORRA ADICIONALES DE UN SOLO EMPLEADO
********************************************************
STORE .F. TO borro
DO WHILE .T.
   IF eliadi('a Borrar')<>0
      GOTO respuesta
      @ 24,0 SAY PADC('Borrando los Datos Requeridos',80,'*') COLO SCHE 19
      th=RECNO()
      SELE liq
      DELE FOR registro=th
      STORE .T. TO borro
   ELSE
      EXIT
   ENDIF
ENDDO
sele liq
indice="LI"+LEFT(ptn[jannro],1)+'Q'+SUBSTR(ptn[jannro],2,1)+'u'+RIGHT(ptn[jannro],1)+LEFT(janname,1)
set index to (PATH+'\'+indice)
IF borro
   @ 24,0 SAY PADC(" Compactando el Archivo de Adicionales ",80,'*') COLO SCHE 19
   PACK
ENDIF
@ 24,0 SAY SPACE(80)
RETURN

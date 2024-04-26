*:*********************************************************************
*:
*:        Program: MKAR.PRG
*:
*:         System: SYSTEMA DE CONTROL DE PRODUCCION
*:         Author: G. REINER
*:      Copyright (c) 1991, SISTEMAS INFORMATICOS S.R.L.
*:  Last modified: 08/16/91     14:59
*:
*:      Called by: CKAR.PRG                      
*:
*:          Calls: QTIP()         (function  in QTIP.PRG)
*:
*:      Documented 08/16/91 at 15:01               FoxDoc  version 2.01
*:*********************************************************************
*******************************************************************************
*-- Programa: MKAR.PRG
*-- Fecha   : 06/19/91
*-- Version : V.LEEGSTRA
*-- Notas   : MUESTRA KARDEX
********************************************************************************
ACTI WIND win
@ 1,2 SAY "TIPO DE PRODUCTO      " COLO SCHE 3
@ 2,2 SAY "ARTICULO              " COLO SCHE 3
@ 3,2 SAY "DESCRIPCION ARTICULO  " COLO SCHE 3
@ 4,2 SAY "FECHA DE LA OPERACION " COLO SCHE 3
@ 5,2 SAY "TALLER                " COLO SCHE 3
@ 6,2 SAY "OPERACION DE KARDEX   " COLO SCHE 3
@ 7,2 SAY "DETALLE               " COLO SCHE 3
IF m->entrada #0
   @ 8,2 SAY "ENTRADA               " COLO SCHE 3
ELSE
   @ 8,2 SAY "SALIDA                " COLO SCHE 3
ENDIF
STORE qtip(m->tipo) TO nada
@ 1,COL GET nada
STORE m->articulo TO nada1
@ 2,COL GET nada1
nada=LEFT(qtip(m->tipo),1)
IF nada=LEFT(tellas,1)
   SELE tel
   SET ORDER TO 2
   STORE ALLTRIM(m->articulo) TO nada1
   IF SEEK(nada1)
      STORE tel->tela TO nada2
   ELSE
      STORE "TELA INEXISTENTE" TO nada2
   ENDIF
ELSE
   SELE avi
   SET ORDER TO 1
   STORE SUBSTR(nada1,1,10) TO nada1
   IF SEEK(nada1)
      STORE avi->avios TO nada2
   ELSE
      STORE UPPER(abio)+" INEXISTENTE" TO nada2
   ENDIF
ENDIF
SELE kar
@ 3,COL GET nada2
STORE m->fechaop TO nada
@ 4,COL GET nada
GOTO kar->taller IN tal
STORE tal->talleres TO nada
@ 5,COL GET nada
GOTO kar->opk IN opk
STORE opk->operacion TO nada
@ 6,COL GET nada
STORE m->detalle TO nada
@ 7,COL GET nada
IF m->entrada #0
   STORE m->entrada TO nada
   @ 8,COL GET nada PICTURE "9999999.99"
ELSE
   STORE m->salida TO nada
   @ 8,COL GET nada PICTURE "9999999.99"
ENDIF
CLEAR GETS
RETURN
*: EOF: MKAR.PRG

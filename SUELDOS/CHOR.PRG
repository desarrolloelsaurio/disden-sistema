*:*********************************************************************
*:
*:        Program: CHOR.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: CHOG.PRG
*:
*:          Calls: ELIEMP()       (function  in PROCESOS.PRG)
*:
*:        Indexes: TMP.IDX
*:               : &INDICE
*:
*:      Documented 04/23/91 at 20:56               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: CHOR.PRG
*-- Fecha   : 12/12/90 04:23pm
*-- Version : G. REINER
*-- Notas   : CORRIGE DENTRO DEL ARCHIVO DE LIQUIDACION
********************************************************************************
PARAMETER ali,tex,vrb
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
SELE VAL(ali)
lal=ALLTRIM(ALIAS())
SET ORDER TO
SELE liq
@ 24,0 SAY PADC(" Ordenando el Archivo ",80,'*') COLOR I/W*
INDEX ON empleado FOR archivo=lal TO tmp
goto top
if .not. eof()
	SET RELA TO registro INTO VAL(ali)
	DEFINE WINDOW win FROM 3,0 TO 22,79 DOUBLE TITL ' Correcci¢n '+tex+' ' SHAD COLOR SCHE 8
	DO WHILE .T.
   	IF eliemp(" a Corregir")<>0
	      GOTO respuesta
   	   SET ORDER TO 1
      	SELE liq
	      BROWSE FIELD emp->legajo/R,emp->apynom/R:20/H="Empleado",&vrb/R/H='Concepto',unidad,fechaven/H='F. Venc' KEY RECNO("EMP") NOAPPEND NODELETE NOMENU WINDOW win
   	ELSE
      	EXIT
	   ENDIF
	ENDDO
	SET RELA TO
endif
SELE VAL(ali)
use
DO (PM5)
SELE liq
indice="LI"+LEFT(ptn[jannro],1)+'Q'+SUBSTR(ptn[jannro],2,1)+'u'+RIGHT(ptn[jannro],1)+LEFT(janname,1)
SET INDEX TO &indice
RELE lal
RETURN
*: EOF: CHOR.PRG

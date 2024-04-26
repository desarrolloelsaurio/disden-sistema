*:*********************************************************************
*:
*:        Program: CHDIA1.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: CHDIA.PRG                     
*:
*:          Calls: MAXIOM()       (function  in PROCESOS.PRG)
*:               : ELIEMP()       (function  in PROCESOS.PRG)
*:
*:        Indexes: TMP.IDX
*:
*:      Documented 04/23/91 at 21:02               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: Chdia.PRG
*-- Fecha   : 02/27/91 06:07pm
*-- Version : G. REINER
*-- Notas   : CORRIGE DENTRO DEL ARCHIVO DE Hs. trabajadas en el dia
********************************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
SELE thor
SET ORDER TO
SELE emp
SET ORDER TO
SELE dia
@ 24,0 SAY PADC(" Ordenando el Archivo ",80,'*') COLOR I/W*
SET RELA TO thor INTO thor
SET RELA TO empleado INTO emp ADDI
INDEX ON empleado TO tmp
DEFINE WINDOW win FROM 3,4 TO 22,73 DOUBLE TITL ' Correcci¢n Horas Trabajadas ' SHAD COLOR SCHE 8
maxiom=maxiom(DATE())
DO WHILE .T.
   IF eliemp(" a Corregir")<>0
      GOTO respuesta
      SET ORDER TO
      SELE dia
      BROWSE FIELD emp->legajo/R,emp->apynom/R:20/H="Empleado",thor->hortipohor/R/H="Tipo de Hora",horas/H="Cantidad":B=0,24,fecha/H="D¡a":B=1,m->maxiom KEY RECNO("EMP") NOAPPEND NODELETE NOMENU WINDOW win
   ELSE
      EXIT
   ENDIF
ENDDO
SET RELA TO
SELE thor
SET ORDER TO 1
SELE dia
SET INDEX TO
RELE maxiom
RETURN

*: EOF: CHDIA1.PRG

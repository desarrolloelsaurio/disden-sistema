*:*********************************************************************
*:
*:        Program: BEMPL.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/21/91     20:12
*:
*:      Called by: EMPL.PRG
*:
*:          Calls: MEMPL.PRG
*:               : OPLIQ          (procedure in PROCESOS.PRG)
*:               : OPEPAR         (procedure in PROCESOS.PRG)
*:
*:      Documented 04/23/91 at 20:52               FoxDoc  version 2.01
*:*********************************************************************
*****************************************************************************
*-- Programa: bempl.prg
*-- Fecha   : 01/13/91 07:58pm
*-- Version : G. REINER
*-- Notas   : BAJAS EMPLEADOS
*****************************************************************************
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
SELE emp
ff=RECNO()
GOTO ff
SCATTER MEMVAR
DO mempl WITH "Baja"
DEFINE WINDOW win1 FROM 18,0 TO 22,77 TITL " Confirma ? " SHAD COLOR SCHE 8
ACTI WIND win1
respuesta="NO"
@ 1,1 SAY "ESTA SEGURO DE BORRAR ? " GET respuesta PICTURE "@m NO,SI"
READ
IF respuesta='SI'
	store date() to fei
	DEFINE WINDOW win1 FROM 18,0 TO 22,77 TITL " Fecha de la Baja " SHAD COLOR SCHE 8
	ACTI WIND WIN1
	@ 1,1 SAY "FECHA DE LA BAJA ? " GET FEI
	READ
	ACTI SCRE
   SELE emp
	REPL FECHAEGR WITH FEI
   jn=jannro
   GOTO ff
   jannro=emp->jan
   DELE RECO ff
   DO opliq
   @ 24,0 SAY PADC("Borrando Datos de Liquidaci¢n",80) COLOR SCHE 19
   DELE FOR empleado=ff
   @ 24,0 SAY PADC("Compactando Archivo de Liquidaci¢n",80) COLOR SCHE 19
   PACK
   DO opepar
   @ 24,0 SAY PADC("Compactando Archivo de Parientes",80) COLOR SCHE 19
   DELE FOR empleado=ff
   PACK
   jannro=jn
ENDIF
RELE ff,jn
RELE WIND win
RELE WIND win1
@ 24,0 SAY SPACE(80)
RETURN



*: EOF: BEMPL.PRG

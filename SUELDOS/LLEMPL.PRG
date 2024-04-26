*:*********************************************************************
*:
*:        Program: LLEMPL.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: EMPL.PRG                      
*:
*:          Calls: MEMPL.PRG
*:
*:      Documented 04/23/91 at 20:52               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: LLempl.prg
*-- Fecha   : 01/13/91 07:58pm
*-- Version : G. REINER
*-- Notas   : RECUPERA EMPLEADOS
********************************************************************************
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
SELE emp
ff=RECNO()
GOTO ff
SCATTER MEMVAR
DO mempl WITH "Recupera"
DEFINE WINDOW win1 FROM 18,0 TO 22,77 TITL " Confirma ? " SHAD COLOR SCHE 8
ACTI WIND win1
respuesta="NO"
@ 1,1 SAY "ESTA SEGURO DE RECUPERAR ? " GET respuesta PICTURE "@m NO,SI"
READ
RELE WIND win
RELE WIND win1
IF respuesta='SI'
   SELE emp
   RECALL RECO ff
ENDIF
RELE ff
@ 24,0 SAY SPACE(80)
RETURN

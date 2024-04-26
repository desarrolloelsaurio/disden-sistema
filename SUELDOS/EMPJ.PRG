*:*********************************************************************
*:
*:        Program: EMPJ.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: EMPLEA.PRG                    
*:
*:          Calls: IEMPJ.PRG
*:               : BEMPJ.PRG
*:               : BEMPJT.PRG
*:               : KK1            (procedure in PROCESOS.PRG)
*:               : LEMPJI.PRG
*:               : LEMPJP.PRG
*:
*:      Documented 04/23/91 at 20:45               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: EMPJ.PRG
*-- Fecha   : 12/12/90 06:51pm
*-- Version : G. REINER
*-- Notas   : DERIVA A LAS OPERACIONES DE LEGAJO DE EMPLEADOS
********************************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
DO CASE
CASE BAR()=1
   DO iempj
CASE BAR()=3
   DO bempj
CASE BAR()=4
   DO bempjt
CASE BAR()=6
   DO kk1 WITH 10,40,"L¡mites del Listado de Legajos"
   ON SELE POPU caca1 DO lempji
   ACTI POPU caca1
   RELE POPU caca1
CASE BAR()=7
   DO lempjp
ENDCASE
ulpr=PROGRAM()
RETURN
*: EOF: EMPJ.PRG

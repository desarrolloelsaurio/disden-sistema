*:*********************************************************************
*:
*:        Program: ORDLIS.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: VARI.PRG                      
*:
*:      Documented 04/23/91 at 19:54               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: ORDLIS.PRG
*-- Fecha   : 02/13/91 10:01pm
*-- Version : G. REINER
*-- Notas   : ACTUALIZA ORDEN DE LOS LISTADOS DE EMPLEADOS
********************************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
DEFINE WINDOW win FROM 4,22 TO 8,66 TITL ' Orden de los Empleados ' DOUBLE SHAD COLOR SCHE 8
ACTI WINDOW win
@ 1,1 SAY 'LISTA EMPLEADOS POR ' COLOR SCHE 3
vez=1
STORE SPACE(10) TO nada
pct=IIF(ordlis=1,'@M Apellido,Legajo','@M Legajo,Apellido')
DO WHILE vez=1
   vez=2
   @ 1,26 GET nada PICTURE pct;
      MESS 'Ingrese el Orden de Salida de los Listados de Empleados'
   READ
ENDDO
RELE WIND win
ordlis=IIF(nada='A',1,2)
RELE vez,nada,pct
@ 24,0 SAY SPACE(80)
RETURN
*: EOF: ORDLIS.PRG

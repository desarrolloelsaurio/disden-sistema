********************************************************************************
*-- Programa: actpla.PRG
*-- Fecha   : 01/14/91 05:48pm
*-- Version : G. REINER
*-- Notas   : DECIDE TIPO DE PLANILLA DE SUELDOS Y JORNALES
********************************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
DEFINE WINDOW win FROM 5,14 TO 9,66 TITL ' Tipo de Listado Sueldos y Jornales ' DOUBLE SHAD COLOR SCHE 8
ACTI WINDOW win
@ 1,1 SAY 'TIPO DE LISTADO' COLOR SCHE 3
vez=1
nada=IIF(actpla="A","Apaisada   ","Hacia Abajo")
DO WHILE vez=1
   vez=2
   @ 1,22 GET nada PICTURE '@M Apaisada   ,Hacia Abajo';
      MESS 'Ingrese el Tipo de Salida de la Planilla de Sueldos y Jornales'
   READ
ENDDO
RELE WIND win
actpla=LEFT(nada,1)
RELE vez,nada
@ 24,0 say space(80)
RETURN

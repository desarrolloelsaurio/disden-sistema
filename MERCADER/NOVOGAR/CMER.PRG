*****************************************************************************
*-- Programa: cmer.prg
*-- Fecha   : 11/29/91
*-- Version : V.LEEGSTRA
*-- Notas   : DERIVA A OPERACIONES DE CORRECCION de mercaderias
*-- Modificaci¢n GOYO 25/06/92
********************************************************************************
stor bar() to dijo
stor nul TO respuesta
IF !empty(elimer(" a Corregir",-1,1))
DO CASE
CASE dijo=1
   DO CMERT
CASE dijo=2
   do CMERP
CASE dijo=3
   do CMERC
CASE dijo=4
   do CMERd
CASE dijo=5
   do CMERj
CASE dijo=6
   do CMERA
ENDCASE
endif
ulpr=PROGRAM()
return men_lin(botom)

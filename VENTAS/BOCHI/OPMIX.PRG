***********************************
*-- Programa: OPMIX.PRG
*-- Fecha   : 08-07-92 05:56pm
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO MIXTO
***********************************
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
=men_lin('Abriendo archivo')
SELE 25
**do case
**case file("C:\SISTEMAS\VENTAS\VENTASA\MIXTA.dbf")
**	USE C:\SISTEMAS\VENTAS\VENTASA\MIXTA ALIAS MIX
**case file("d:\SISTEMAS\VENTAS\VENTASA\MIXTA.dbf")
**	USE d:\SISTEMAS\VENTAS\VENTASA\MIXTA ALIAS MIX
**case file("F:\SISTEMAS\VENTAS\VENTASA\MIXTA.dbf")
    USE (PATHVEN+'\MIXTA') ALIAS MIX
**	USE F:\SISTEMAS\VENTAS\VENTASA\MIXTA ALIAS MIX
**otherwise
**USE G:\MIXTA ALIAS MIX
**endcase
RETURN MEN_LIN(BOTOM)

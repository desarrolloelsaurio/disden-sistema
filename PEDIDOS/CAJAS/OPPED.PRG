********************************************************************************
*-- Programa: OPPED.PRG
*-- Fecha   : 07/04/91 11:00am
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO NOTAS DE PEDIDO
********************************************************************************
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
IF !USED("PED")
=PRXAREA(.T.)
USE (PATHVEN+'\PEDIDO') order tag pedido ALIAS ped
ELSE
SELE PED
ENDIF
RETURN MEN_LIN(BOTOM)


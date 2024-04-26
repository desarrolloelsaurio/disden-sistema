********************************************************************************
*-- Programa: OPPED.PRG
*-- Fecha   : 07/04/91 11:00am
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO NOTAS DE PEDIDO
********************************************************************************
IF ESOPEN("Notas de Pedido",13,"PEX")
	USE (PATHVEN+'\PEDIDAT') order tag codcli ALIAS pex
ENDIF
IF ESOPEN("",12,'PED')
	USE (PATHVEN+'\PEDIDO') order tag pedido ALIAS ped
ENDIF
=MEN_LIN(BOTOM)
RETURN

********************************************************************************
*-- Programa: XREM.PRG
*-- Fecha   : 10-13-91 02:19am
*-- Version : g. reiner
*-- Notas   : RESTAURA BASE DE RUBROS
********************************************************************************
ulpr=HORA_ULP(PROGRAM())
STORE "" TO tx
SELE rem
DO CASE
CASE BAR()=1
	@ 24,nul SAY PADC('Reindexando el Archivo de Remitos',80,'*') COLO SCHE 19
	do flok with "rem"
	REINDEX
	UNLO IN rem
	tx='REINDEX '
	do flok with "rex"
	REINDEX
	UNLO IN rex
	tx='REINDEX '
CASE BAR()=2
	@ 24,nul SAY PADC('Generando Nuevo Indice de Remitos',80,'*') COLO SCHE 19
	do flok with "rem"
	INDE ON str(numero)+str(marca) to (Pathcom+"\remito")
	UNLO IN rem
	do flok with "rex"
	INDE ON str(numero)+str(marca) to (Pathcom+"\remidat")
	UNLO IN rex
	tx='CREA INDICE '
ENDCASE
IF tx#''
	DO iaud WITH tx+' Remitos'
ENDIF
RETURN

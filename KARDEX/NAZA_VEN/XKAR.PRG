********************************************************************************
*-- Programa: XKAR.PRG
*-- Fecha   : 06/18/91
*-- Version : g. reiner
*-- Notas   : RESTAURA BASE DE KARDEX
********************************************************************************
ulpr=HORA_ULP(PROGRAM())
if cheqseg()
	STORE "" TO tx
	SELE kar
	DO CASE
	CASE BAR()=1
		@ 24,nul SAY PADC('Reindexando el Archivo de Kardex',80,'*') COLO SCHE 19
		do flok with "kar"
		REINDEX
		UNLO IN kar
		tx='REINDEX '
	CASE BAR()=2
		@ 24,nul SAY PADC('Generando Nuevo Indice de Kardex',80,'*') COLO SCHE 19
		do flok with "kar"
		A=PATH+"\KARDEX"
		INDE ON (tipo+articulo+DTOC(fechaop)) TO &a COMP
		UNLO IN kar
		tx='CREA INDICE '
	ENDCASE
	=IIF(EMPTY(TX),"",iaud('KARDEX'))
else
	=iaudi()
endif
RETURN

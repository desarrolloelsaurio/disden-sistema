********************************************************************************
*-- Programa: XPOL.PRG
*-- Fecha   : 11-09-92 08:04pm
*-- Version : G. REINER
*-- Notas   : RESTAURA BASE POLIGONALES
********************************************************************************
PROCEDURE XMIX
	Ulpr=hora_ulp(PROGRAM())
	STORE "" TO TX
	SELE POL
	DO CASE
	CASE BAR()=1
		=men_lin('Reindexando el Archivo de Poligonales')
		=FLOK("POL") .or. lok("POL")
		=dotalk()
		=opPOLx()
		REINDEX
		=reopPOL()
		=untalk()
		TX='REINDEX '
	CASE BAR()=2
		=men_lin('Generando Nuevo Indice de Poligonales')
		=FLOK("POL") .or. lok("POL")
		=dotalk()
		=OPPOLX()
		SELE POL
		inde on LISTA+NUMERO+STR(LIMITE,14,5) tag LIMITE of (PATHPRO+'\POLIGONA')
		inde on LISTA+NUMERO tag LISTA of (PATHPRO+'\POLIGONA')
		=REOPPOL()
		=untalk()
		TX='CREA INDICE '
	ENDCASE
	IF !empty(TX)
		=IAUD(TX)
	ENDIF
RETURN

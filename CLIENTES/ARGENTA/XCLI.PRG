********************************************************************************
*-- Programa: XPER.PRG
*-- Fecha   : 08-03-92 08:18pm
*-- Version : G. REINER
*-- Notas   : RESTAURA BASE DE CLIENTES
*-- Version NOVOGAR
********************************************************************************
PROCEDURE Xcli
	Ulpr=hora_ulp(PROGRAM())
	STORE "" TO TX
	SELE PER
	DO CASE
	CASE BAR()=1
		=men_lin('Reindexando el Archivo')
		=FLOK('PER') .or. lok('PER')
		=dotalk()
		=opclix()
		REINDEX
		=reopcli()
		=untalk()
		TX='REINDEX '
	CASE BAR()=2
		=men_lin('Generando Nuevo Indice')
		=FLOK('PER') .or. lok('PER')
		=dotalk()
		=OPcliX()
		SELE PER
		INDE ON CLIENTE TAG CLIENTE OF (PATHVEN+'\CLIENTES')
		INDE ON CODCLI TAG CODCLI  OF (PATHVEN+'\CLIENTES')
		=REOPCLI()
		=untalk()
		TX='CREA INDICE '
	ENDCASE
	IF !empty(TX)
		=IAUD(TX)
	ENDIF
RETURN

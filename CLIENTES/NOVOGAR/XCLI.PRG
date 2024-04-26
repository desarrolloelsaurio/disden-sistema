********************************************************************************
*-- Programa: XPER.PRG
*-- Fecha   : 08-03-92 08:18pm
*-- Version : G. REINER
*-- Notas   : RESTAURA BASE DE CLIENTES
*-- Version NOVOGAR
********************************************************************************
PROCEDURE Xcli
	Ulpr=hora_ulp(PROGRAM())
	IF CHEQSEG()
		DIJO=BAR()
		IF !EMPTY(DIJO)
			SELE PER
			=men_lin('Reindexando el Archivo de Clientes')
			=FLOK('PER') .or. lok('PER')
			=dotalk()
			=opclix()
			IF DIJO=1
				REINDEX
				TX='REINDEX '
			ELSE
				SELE PER
				INDE ON CLIENTE TAG CLIENTE
				INDE ON CLIENTE TAG CLIENTEA FOR !EMPTY(NROIVA) .AND. CONDIVA#4
				INDE ON CLIENTE TAG CLIENTEB FOR EMPTY(NROIVA) .OR. CONDIVA=4

				INDE ON CODCLI TAG CODCLI
				INDE ON CODCLI TAG CODCLIA FOR !EMPTY(NROIVA) .AND. CONDIVA#4
				INDE ON CODCLI TAG CODCLIB FOR EMPTY(NROIVA) .OR. CONDIVA=4
				TX='INDEXA '
			ENDIF
			=reopcli()
			=untalk()
			=IAUD(TX+'CLIENTES')
		ENDIF
	ELSE
		=IAUDI()
	ENDIF
RETURN

***************************************************
*-- Programa: XKAR.PRG
*-- Fecha   : 09-18-92 03:49pm
*-- Version : G. REINER
*-- Notas   : RESTAURA BASE DE KardexS DE VENTA
*-- VERSION PALADEM
**************************************************
PROCEDURE XKAR
	Ulpr=hora_ulp(PROGRAM())
	STORE "" TO TX
	SELE KAR
	DO CASE
	CASE BAR()=1
		=men_lin('Reindexando el Archivo')
		=FLOCK("KAR") .or. FLOK("KAR")
		=dotalk()
		=opKARx()
		REINDEX
		=reopKAR()
		=untalk()
		TX='REINDEX '
	CASE BAR()=2
		=men_lin('Generando Nuevo Indice')
		=FLOCK("KAR") .or. FLOK("KAR")
		=dotalk()
		=OPKARX()
		SELE KAR
		INDEX ON FECHAOP TAG FECHAOP
		INDEX ON ARTICULO TAG ARTICULO
		INDEX ON NRODOCREF TAG NRODOCREF 
	    INDEX ON CLIENTE TAG CLIENTE
	    INDEX ON CODVIA TAG CODVIA		
		=untalk()
		=REOPKAR()
		TX='CREA INDICE '
	ENDCASE
	IF !empty(TX)
		=IAUD(TX)
	ENDIF
RETURN

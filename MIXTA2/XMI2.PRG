********************************************************************************
*-- Programa: XMI2.PRG
*-- Fecha   : 09-02-92 01:21pm
*-- Version : G. REINER
*-- Notas   : RESTAURA BASE MI2TA
*-- VERSION CAMARA GAMMA
********************************************************************************
PROCEDURE XMI2
	Ulpr=hora_ulp(PROGRAM())
	STORE "" TO TX
	SELE MI2
	DO CASE
	CASE BAR()=1
		=men_lin('Reindexando el Archivo')
		=FLOK("MI2") .or. lok("MI2")
		=dotalk()
		=opMI2x()
		REINDEX
		=reopMI2()
		=untalk()
		TX='REINDEX '
	CASE BAR()=2
		=men_lin('Generando Nuevo Indice')
		=FLOK("MI2") .or. lok("MI2")
		=dotalk()
		=OPMI2X()
		SELE MI2
		INDE ON TEXTO1 TAG SANCOD OF (PATHPRO+'\MIXTA2') FOR FILTRO="S"
		INDE ON TEXTO2 TAG SANTEX OF (PATHPRO+'\MIXTA2') FOR FILTRO="S"
		=REOPMI2()
		=untalk()
		TX='CREA INDICE '
	ENDCASE
	IF !empty(TX)
		=IAUD(TX)
	ENDIF
RETURN

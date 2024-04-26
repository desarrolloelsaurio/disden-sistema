********************************************************************************
*-- Programa: XPEC.PRG
*-- Fecha   : 08-03-92 08:18pm
*-- Version : G. REINER
*-- Notas   : RESTAURA BASE MIXTA
*-- Modificaci¢n GOYO 08-12-92 10:27am
********************************************************************************
Ulpr=hora_ulp(PROGRAM())
IF CHEQSEG()
	STORE "" TO TX
	DO CASE
	CASE BAR()=1
		=men_lin('Reindexando el Archivo de Notas de Pedido de Compra')
		=FLOCK("PEC") .or. FLOK("PEC")
		=FLOCK("PE1") .OR. FLOK("PE1")
		=dotalk()
		=opPEcx()
		SELE PEC
		REINDEX
		SELE PE1
		REINDEX
		=reopPEc()
		=untalk()
		TX='REINDEX'
	CASE BAR()=2
		=men_lin('Generando Nuevo Indice de Notas de Pedido de Compra')
		=FLOCK("PEC") .or. FLOK("PEC")
		USE
		=FLOCK("PE1") .or. FLOK("PE1")
		USE
		=dotalk()
		=OPPECX()
		SELE PEC
		INDE ON pedido+procod TAG pedido
		SELE PE1
		INDE ON pedido+procod TAG pedido
		=reoppec()
		=untalk()
		TX='INDEXA'
	ENDCASE
	=IIF(EMPTY(TX),"",iaud(TX+' Ped Compra'))
ELSE
	=IAUDI()
ENDIF
RETURN

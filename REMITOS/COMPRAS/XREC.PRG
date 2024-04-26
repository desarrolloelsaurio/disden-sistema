***********************************
*-- Programa: XPEC.PRG
*-- Fecha   : 08-03-92 08:18pm
*-- Version : G. REINER
*-- Notas   : RESTAURA BASE MIXTA
***********************************
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
Ulpr=hora_ulp(PROGRAM())
IF CHEQSEG()
	=men_lin('Reindexando el Archivo de Remitos de Compra')
	=dotalk()
	=OPREC()
	=FLOCK("REC") .or. FLOK("REC")
	USE
	=FLOCK("RED") .or. FLOK("RED")
	USE
	=OPRECX()
	SELE REC
           Index TAG   NUMERO  ON NUMERO
           Index TAG   REMITO  ON REMITO+PROCOD
	SELE RED
           Index TAG   REMITO  ON REMITO+PROCOD
	=reopRec()
	=untalk()
    =iaud('CREA INDICE')
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
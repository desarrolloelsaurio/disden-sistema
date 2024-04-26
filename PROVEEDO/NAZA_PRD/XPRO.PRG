*******************************************
*-- Programa: XPRO.PRG
*-- Fecha   : 06/17/91 11:40am
*-- Version : G. REINER
*-- Notas   : RESTAURA BASE DE PROVEEDORES
*-- Modif. 07-12-93 02:13am
*******************************************
ulpr=HORA_ULP(PROGRAM())
IF CHEQSEG()
	STORE "" TO TX
	SELE PRO
	IF !EMPTY(BAR())
		=men_lin('Reindexando el Archivo de '+probes)
		SELE PRO
		=dotalk()
		=FLOCK("PRO") .or. flok("PRO")
		=OPproX()
			INDE ON PROcod    TAG PROCOD
			INDE ON PROVEEDOR TAG PROVEEDOR
			TX='INDEX '
		=unTALk()
		=REOPPRO()
		=iaud(TX+PROBES)
	ENDIF
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)

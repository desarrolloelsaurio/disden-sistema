****************************************************************************
*-- Programa: CSTO.PRG
*-- Fecha   : 03-30-92 02:14am
*-- Version : G. REINER
*-- Notas   : CORRECCION DE STOCK
*-- VERSION BALCALA
********************************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	=MOVEWIN(NUL,5,24,74,'WIN'," Correcci¢n M rgenes-"+alltrim(janname)+" ",ALLTRIM(JANNAME))
	SELE mer
	BROW FIELD ARTICULO/R:p="!!!!!!!!!!",STOCK   :p="9999999":H="STOCK";
	,STOCKMIN   :p="9999999"    :H='ST. MINIMO';
	,STOCKMAX   :p="9999999"    :H='ST. MAXIMO';
	,STOCKRES   :p="9999999"    :H='RESERVADO ';
	,STOCKPES   :p="999999.99"  :H='PESO TOTAL';
	NOAPPEND NODELETE NOMENU WIND win
	=relewin("win")
ELSE
	=IAUDI()
ENDIF
=MEN_LIN(BOTOM)
RETURN

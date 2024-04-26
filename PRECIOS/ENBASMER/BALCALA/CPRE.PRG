********************************************************************************
*-- Programa: CPRE.PRG
*-- Fecha   : 08/26/91 11:28am
*-- Version : G. REINER
*-- Notas   : DERIVA A GESTION DE ingreso de precios
********************************************************************************
ulpr=hora_ulp(program())
if cheqseg()
	=MOVEWIN(nul,nul,24,79,'WIN'," Correcci¢n M rgenes-"+alltrim(janname)+" ",'[TAB] para Grabar')
	SELE mer
	ON KEY LABEL TAB KEYBOARD CHR(23)
	BROW FIELD ARTICULO/R:p="!!!!!!!!!!",costo   :p="99999.9999":H="COSTO";
	,precio1   :p="9999.99"    :H=LEFT("% "+xalis1,7);
	,A=round(costo*(1+precio1/100),3) :p="9999.999":H=LEFT(xalis1,8);
	,precio2   :p="9999.99"    :H=LEFT("% "+xalis2,7);
	,B=round(costo*(1+precio2/100),3) :p="9999.999":H=LEFT(xalis2,8);
	,precio3   :p="9999.99"    :H=LEFT("% "+xalis3,7);
	,C=round(costo*(1+precio3/100),3) :p="9999.999":H=LEFT(xalis3,8);
	,precio4   :p="9999.99"    :H=LEFT("% "+xalis4,7);
	,D=round(costo*(1+precio4/100),3) :p="9999.999":H=LEFT(xalis4,8);
	NOAPPEND  NODELETE  NOMENU  WIND win
	=relewin("win")
	ON KEY LABEL TAB
ELSE
	=IAUDI()
ENDIF
ulpr=PROGRAM()
=MEN_LIN(BOTOM)
RETURN

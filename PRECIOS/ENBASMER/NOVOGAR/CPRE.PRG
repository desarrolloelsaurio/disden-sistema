********************************************************************************
*-- Programa: CPRE.PRG
*-- Fecha   : 08/26/91 11:28am
*-- Version : G. REINER
*-- Notas   : DERIVA A GESTION DE ingreso de precios
********************************************************************************
IF ESJEFE()
	STORE HORA_ULP(PROGRAM()) TO ULPR
	IF CHEQSEG()
	ON KEY LABEL Ctrl+D WAIT mer.articulo+'-'+mer.merca WIND NOWAIT
		=MOVEWIN(0,nul,24,79,'WIN'," Correcci¢n M rgenes-"+alltrim(janname)+" - Ctrl+D Denominaci¢n Producto ",ALLTRIM(JANNAME))
		SELE mer
		BROW FIELD ARTICULO/R:p="!!!!!!!!!!!!!!!!!!!!";
		,COSTO   :P="99999.99":H="COSTO";
		,PRECIO1   :P="9999.99"    :H=LEFT("% "+XALIS1,7);
		,A=ROUND(COSTO+COSTO*PRECIO1/100,0):P="9999.99":H=LEFT(XALIS1,7);
		,PRECIO2   :P="9999.99"    :H=LEFT("% "+XALIS2,7);
		,B=ROUND(COSTO+COSTO*PRECIO2/100,0) :P="9999.99":H=LEFT(XALIS2,7);
		,PRECIO3   :P="9999.99"    :H=LEFT("% "+XALIS3,7);
		,C=ROUND(COSTO+COSTO*PRECIO3/100,0) :P="9999.99":H=LEFT(XALIS3,7);
		,PRECIO4   :P="9999.99"    :H=LEFT("% "+XALIS4,7);
		,D=ROUND(COSTO+COSTO*PRECIO4/100,0) :P="9999.99":H=LEFT(XALIS4,7);
		NOAPPEND  NODELETE  NOMENU  WIND WIN
		=RELEWIN("WIN")
	ELSE
		=IAUDI()
	ENDIF
	ULPR=PROGRAM()
ELSE
	=CARTEL2("ACCESO DENEGADO","ESTE PROGRAMA ES DE USO EXCLUSIVO","DE LOS JEFES","POR FAVOR, NO INTENTE INGRESAR NUEVAMENTE")
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)

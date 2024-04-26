********************************************************************************
*-- Programa: CPRE.PRG
*-- Fecha   : 08/26/91 11:28am
*-- Version : G. REINER
*-- Notas   : DERIVA A GESTION DE ingreso de precios
********************************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	A=(xatalmax-xatalmin)/xatalstep+1
	A=IIF(A>12,22,A+13)
	=MOVEWIN(10,nul,A,79,'WIN'," "+ALLTRIM(mer.merca)+'/'+ALLTRIM(mer.articulo)+' ')
	ff=LEFT(mer.articulo,13)
	fi=ff+'  '
	ff=ff+'þþ'
	sele mer
	SET ORDER TO TAG ARTICULO
	BROW LOCK 3 FIELD costoreal :p="99999999.99":H="COSTO REAL";
	,costo     :p="99999999.99":H="COSTO DE VENTA";
	,precio1   :p="9999.99"    :H=LEFT("PORC "+xalis1,15);
	,A=costo+costo*precio1/100 :p="99999999.99":H=LEFT(xalis1,15);
	,precio2   :p="9999.99"    :H=LEFT("PORC. "+xalis2,15);
	,B=costo+costo*precio2/100 :p="99999999.99":H=LEFT(xalis2,15);
	,precio3   :p="9999.99"    :H=LEFT("PORC. "+xalis3,15);
	,C=costo+costo*precio3/100 :p="99999999.99":H=LEFT(xalis3,15);
	,precio4   :p="9999.99"    :H=LEFT("PORC. "+xalis4,15);
	,D=costo+costo*precio4/100 :p="99999999.99":H=LEFT(xalis4,15);
	KEY fi,ff NOAPPEND  NODELETE  NOMENU  WIND win
	=relewin("win")
ELSE
	=iaudi()
ENDIF
ulpr=PROGRAM()
=MEN_LIN(BOTOM)
RETURN

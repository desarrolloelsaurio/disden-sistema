********************************************************************************
*-- Programa: XAPRE.PRG
*-- Fecha   : 08/26/91 12:25pm
*-- Version : G. REINER
*-- Notas   : ACTUALIZA PORCENTAJES DE PRECIO POR DEFECTO
********************************************************************************
ulpr=hora_ulp(program())
if cheqseg()
	=movewin(8,12,15,64,'win',' Porcentajes de Utilidad ')
	xpa='Porcentaje '
	xpa1='Porcentaje de Utilidad p/Lista de Precios '
	@ 1,1 SAY xpa+xalis1  colo sche 3
	@ 2,1 SAY xpa+xalis2  colo sche 3
	@ 3,1 SAY xpa+xalis3  colo sche 3
	@ 4,1 SAY xpa+xalis4  colo sche 3
	@ 1,35 GET xap1 pict '9999999.99';
	MESS xpa1+xalis1
	@ 2,35 GET xap2 pict '9999999.99';
	MESS xpa1+xalis2
	@ 3,35 GET xap3 pict '9999999.99';
	MESS xpa1+xalis3
	@ 4,35 GET xap4 pict '9999999.99';
	MESS xpa1+xalis4
	READ
	=RELEWIN("win")
	=iaud('MODIFICACION PRECIOS POR DEFECTO')
ELSE
	=iaudi()
ENDIF
RETURN men_lin(botom)

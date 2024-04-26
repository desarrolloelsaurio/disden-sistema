********************************************************************************
*-- Programa: XAIVA.PRG
*-- Fecha   : 11-20-92 06:12pm
*-- Version : G. REINER
*-- Notas   : ACTUALIZA PORCENTAJES IVA PARA LISTAS DE PRECIO
********************************************************************************
ulpr=hora_ulp(program())
if cheqseg()
	=movewin(8,12,15,64,'win',' Porcentajes de I.V.A. ')
	xpa='IVA p/ '
	xpa1='Porcentaje de IVA p/Lista de Precios '
	m.xaiv1=(m.xaiva1-1)*100
	m.xaiv2=(m.xaiva2-1)*100
	m.xaiv3=(m.xaiva3-1)*100
	m.xaiv4=(m.xaiva4-1)*100			
	@ 1,1 SAY xpa+xalis1  colo sche 3
	@ 2,1 SAY xpa+xalis2  colo sche 3
	@ 3,1 SAY xpa+xalis3  colo sche 3
	@ 4,1 SAY xpa+xalis4  colo sche 3
	@ 1,35 GET m.xaiv1 pict '9999999.99';
	MESS xpa1+xalis1
	@ 2,35 GET m.xaiv2 pict '9999999.99';
	MESS xpa1+xalis2
	@ 3,35 GET m.xaiv3 pict '9999999.99';
	MESS xpa1+xalis3
	@ 4,35 GET m.xaiv4 pict '9999999.99';
	MESS xpa1+xalis4
	READ
	if last()#27
	m.xaiva1=iif(m.xaiv1>m.nul,1+m.xaiv1/100,m.nul)
	m.xaiva2=iif(m.xaiv2>m.nul,1+m.xaiv2/100,m.nul)
	m.xaiva3=iif(m.xaiv3>m.nul,1+m.xaiv3/100,m.nul)
	m.xaiva4=iif(m.xaiv4>m.nul,1+m.xaiv4/100,m.nul)			
	endif
	=RELEWIN("win")
	=iaud('iva listados')
ELSE
	=iaudi()
ENDIF
=men_lin(botom)
RETURN

********************************************************************************
*-- Programa: XAPRE.PRG
*-- Fecha   : 08/26/91 12:25pm
*-- Version : G. REINER
*-- Notas   : ACTUALIZA PORCENTAJES DE PRECIO POR DEFECTO
********************************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	=movewin(8,12,15,64,'win',' Porcentajes de Utilidad ')
	@ 1,1 SAY 'Porcentaje '+xalis1  colo sche 3
	@ 2,1 SAY 'Porcentaje '+xalis2  colo sche 3
	@ 3,1 SAY 'Porcentaje '+xalis3  colo sche 3
	@ 4,1 SAY 'Porcentaje '+xalis4  colo sche 3
	@ 1,35 GET xap1 PICTURE '9999999.99';
	MESS 'Porcentaje de Utilidad p/Lista de Precios '+xalis1
	@ 2,35 GET xap2 PICTURE '9999999.99';
	MESS 'Porcentaje de Utilidad p/Lista de Precios '+xalis2
	@ 3,35 GET xap3 PICTURE '9999999.99';
	MESS 'Porcentaje de Utilidad p/Lista de Precios '+xalis3
	@ 4,35 GET xap4 PICTURE '9999999.99';
	MESS 'Porcentaje de Utilidad p/Lista de Precios '+xalis4
	READ
	=relewin("WIN")
	=iaud('MODIFICACION PRECIOS POR DEFECTO')
ELSE
	=iaudi()
ENDIF
=MEN_LIN(BOTOM)
RETURN

*******************************************************************************
*-- Programa: IPRET1.PRG
*-- Fecha   : 09/09/91 06:20pm
*-- Version : G. REINER
*-- Notas   : GENERALIZA PRECIOS
********************************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	STOR NUL TO cost
	stor 30 TO COL
	stor 30 TO col1
	stor xap1 TO preci1
	stor xap2 TO preci2
	stor xap3 TO preci3
	stor xap4 TO preci4
	stor xas1 TO stoc
	stor xas2 TO stocmin
	stor xas3 TO stocmax
	stor xas4 TO stocres
	STOR '99999.99' TO PICU1
	STOR '9999999' TO PICU2
  STOR '999,999,999.99' TO PICU3
	nada=mer.articulo
	nada1=mer.merca
	=MOVEwin(6,10,19,60,'WIN'," Generaliza Precios"+TT+" ")
	@ 1,1 SAY 'COSTO' COLO SCHE 3
	@ 3,1 SAY '% '+xalis1 COLO SCHE 3
	@ 4,1 SAY '% '+xalis2 COLO SCHE 3
	@ 5,1 SAY '% '+xalis3 COLO SCHE 3
	@ 6,1 SAY '% '+xalis4 COLO SCHE 3
	@ 7,1 SAY 'STOCK' COLO SCHE 3
	@ 8,1 SAY 'STOCK MINIMO' COLO SCHE 3
	@ 9,1 SAY 'STOCK MAXIMO' COLO SCHE 3
	@ 10,1 SAY 'STOCK RESERVADO' COLO SCHE 3
	@ 1,COL GET cost PICT '9999999999.999' MESS 'Costo de Venta del Producto'
	@ 3,COL GET preci1 PICT PICU1 MESS pcu+xalis1
	@ 4,COL GET preci2 PICT PICU1 MESS pcu+xalis2
	@ 5,COL GET preci3 PICT PICU1 MESS pcu+xalis3
	@ 6,COL GET preci4 PICT PICU1 MESS pcu+xalis4
	@ 7,COL GET stoc PICT PICU2 MESS 'Stock Disponible'
	@ 8,COL GET stocmin PICT PICU2 RANGE 1,9999999 MESS 'Stock M¡nimo'
	@ 9,COL GET stocmax PICT PICU2 RANGE stocmin,999999 MESS 'Stock M ximo'
	@ 10,COL GET stocres PICT PICU2 MESS 'Stock Reservado'
	READ
	IF LASTKEY()#27
		p1=ROUND(porcen(m.cost,preci1),2)
		p2=ROUND(porcen(m.cost,preci2),2)
		p3=ROUND(porcen(m.cost,preci3),2)
		p4=ROUND(Porcen(m.cost,preci4),2)
		@ 3,col1 GET p1 PICT PICU3
		@ 4,col1 GET p2 PICT PICU3
		@ 5,col1 GET p3 PICT PICU3
		@ 6,col1 GET p4 PICT PICU3
		CLEA GETS
		ACTI SCRE
		SELE mer
		SCAN FOR &fisc
			=MEN_LIN(ALLTRIM(mer.merca))
			registro=str(recno())
			do lok with "mer"
			REPL costo WITH IIF(EMPTY(cost),COSTO,COST)
			REPL precio1 WITH preci1
			REPL precio2 WITH preci2
			REPL precio3 WITH preci3
			REPL precio4 WITH preci4
			REPL stock WITH stoc
			REPL stockmin WITH stocmin
			REPL stockmax WITH stocmax
			REPL stockres WITH stocres
			DO repuse
			UNLO IN mer
		ENDSCAN
		=iaud(FISC)
	ENDIF
	DEAC WIND win
ELSE
	=iaudI()
ENDIF
ulpr=PROGRAM()
=MEN_LIN(BOTOM)
RETURN

********************************************************************************
*-- Programa: IPRET1.PRG
*-- Fecha   : 09/09/91 06:20pm
*-- Version : G. REINER
*-- Notas   : GENERALIZA PRECIOS
********************************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	=movewin(6,10,19,60,'fic'," Generaliza Precios"+tt+" ")
	PCU=''
	STOR NUL TO costorea,cost
	STORE 30 TO COL
	STORE 30 TO col1
	STORE xap1 TO preci1
	STORE xap2 TO preci2
	STORE xap3 TO preci3
	STORE xap4 TO preci4
	STORE xas1 TO stoc
	STORE xas2 TO stocmin
	STORE xas3 TO stocmax
	STORE xas4 TO stocres
	nada=mer.articulo
	nada1=mer.merca
  PICU1='999,999,999.99'
	IF GPRE(3)
		p1=porcen(m.cost,preci1)
		p2=porcen(m.cost,preci2)
		p3=porcen(m.cost,preci3)
		p4=porcen(m.cost,preci4)
		@ 3,col1 GET p1 PICT PICU1
		@ 4,col1 GET p2 PICT PICU1
		@ 5,col1 GET p3 PICT PICU1
		@ 6,col1 GET p4 PICT PICU1
		CLEA GETS
		ACTI SCRE
		SELE mer
		SCAN FOR &fisc
			=GPRE()
		ENDSCAN
		=iaud(FISC)
	ENDIF
	DEAC WIND win
ELSE
	=iaudi()
ENDIF
=relewin('fic')
ulpr=PROGRAM()
=MEN_LIN(BOTOM)
RETURN

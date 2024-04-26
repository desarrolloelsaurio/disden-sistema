********************************************************************************
*-- Programa: iprel.prg
*-- Fecha   : 09/10/91 01:41pm
*-- Version : G. REINER
*-- Notas   : globaliza precios
********************************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	DO WHILE .T.
		=movewin(6,10,19,62,'win'," Generaliza Precios ")
		PCU=''
		STOR NUL TO costorea,cost
		STORE 30 TO COL,col1
		STORE xap1 TO preci1
		STORE xap2 TO preci2
		STORE xap3 TO preci3
		STORE xap4 TO preci4
		STORE xas1 TO stoc
		STORE xas2 TO stocmin
		STORE xas3 TO stocmax
		STORE xas4 TO stocres
		nada=mer.articulo
		PICU1='999,999,999.99'
		nada1=mer.merca
		IF QPRE(3)
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
			DO WHILE .T.
				STOR NUL TO respuesta
				IF !EMPTY(elimer("Para Ingresar Precios",-1,10))
					=GPRE()
					=iaud(MER.ARTICULO)
				ELSE
					EXIT
				ENDIF
			ENDDO
		ELSE
			EXIT
		ENDIF
	ENDDO
	=relewin('win')
ELSE
	=iaudi()
ENDIF
ulpr=PROGRAM()
=MEN_LIN(BOTOM)
RETURN
*: EOF: IPREL.PRG

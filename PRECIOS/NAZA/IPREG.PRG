********************************************************************************
*-- Programa: IPREG.PRG
*-- Fecha   : 09/05/91 06:03pm
*-- Version : G. REINER
*-- Notas   : INGRESA PRECIOS
********************************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	store 30 to COL,col1
	DO WHILE .T.
		STOR NUL TO respuesta
		IF !EMPTY(elimer(" a Ingresar",-1,10))
			=movewin(4,10,21,60,'win'," Ingreso de Precios - Producto "+ALLTRIM(merca))
			STOR mer.costoreal TO costorea
			stor mer.costo to cost
			STORE PRECIO1 TO preci1
			STORE PRECIO2 TO preci2
			STORE PRECIO3 TO preci3
			STORE PRECIO4 TO preci4
			nada=mer.articulo
			nada1=mer.merca
			rtc=LEFT(mer.articulo,13)
			SELE pre
			IF !SEEK(rtc)
				STORE xas1 TO stoc
				STORE xas2 TO stocmin
				STORE xas3 TO stocmax
				STORE xas4 TO stocres
			ELSE
				STOR stock TO STOC
				STOR stockmin TO STOCMIN
				STOR stockmax TO stocmax
				STOR stockres TO stocres
			ENDIF
			j='TODOS'
			@ 1,2 SAY "ARTICULO:" GET nada
			@ 2,2 SAY "PRODUCTO:" GET nada1
			@ 3,2 SAY "TALLE   :" GET j
			CLEA GETS
			IF QPRE(3)
				p1=porcen(m.cost,preci1)
				p2=porcen(m.cost,preci2)
				p3=porcen(m.cost,preci3)
				p4=porcen(m.cost,preci4)
				@ 7,col1 GET p1
				@ 8,col1 GET p2
				@ 9,col1 GET p3
				@ 10,col1 GET p4
				CLEA GETS
				=GPRE()
				=iaud(rtc)
			ELSE
				EXIT
			ENDIF
		ELSE
			EXIT
		ENDIF
	ENDDO
ELSE
	=iaudi()
ENDIF
on key label dnarrow
DEAC WIND ALL
=MEN_LIN(BOTOM)
RETURN

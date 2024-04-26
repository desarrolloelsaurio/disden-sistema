********************************************************************************
*-- Programa: iprel.prg
*-- Fecha   : 09/10/91 01:41pm
*-- Version : G. REINER
*-- Notas   : globaliza precios
********************************************************************************
ulpr=hora_ulp(program())
IF cheqseg()
	DO WHILE .T.
		STOR NUL TO cost
		stor 30 TO COL
		stor 25 to COL1
		stor xap1 TO preci1
		stor xap2 TO preci2
		stor xap3 TO preci3
		stor xap4 TO preci4
		stor xas1 TO stoc
		stor xas2 TO stocmin
		stor xas3 TO stocmax
		stor xas4 TO stocres
		nada=mer->articulo
		nada1=mer->merca
		=movewin(6,10,19,62,"win"," Generaliza Precios-Empresa "+upper(alltrim(janname)),upper(alltrim(janname)))
		@ 1,1 SAY 'COSTO' COLO SCHE 3
		@ 3,1 SAY '% '+xalis1 COLO SCHE 3
		@ 4,1 SAY '% '+xalis2 COLO SCHE 3
		@ 5,1 SAY '% '+xalis3 COLO SCHE 3
		@ 6,1 SAY '% '+xalis4 COLO SCHE 3
		@ 7,1 SAY 'STOCK' COLO SCHE 3
		@ 8,1 SAY 'STOCK MINIMO' COLO SCHE 3
		@ 9,1 SAY 'STOCK MAXIMO' COLO SCHE 3
		@ 10,1 SAY 'STOCK RESERVADO' COLO SCHE 3
		@ 1,COL GET cost PICT '99999999999.9999' MESS 'Costo de Venta del Producto'
		@ 3,COL GET preci1 PICT '99999.99' MESS pcu+xalis1
		@ 4,COL GET preci2 PICT '99999.99' MESS pcu+xalis2
		@ 5,COL GET preci3 PICT '99999.99' MESS pcu+xalis3
		@ 6,COL GET preci4 PICT '99999.99' MESS pcu+xalis4
		@ 7,COL GET stoc PICT '9999999' MESS 'Stock Disponible'
		@ 8,COL GET stocmin PICT '9999999' RANGE 1,9999999 MESS 'Stock M¡nimo'
		@ 9,COL GET stocmax PICT '9999999' RANGE stocmin,999999 MESS 'Stock M ximo'
		@ 10,COL GET stocres PICT '9999999' MESS 'Stock Reservado'
		READ
		IF LASTKEY()#27
			IF !empty(cost)
				p1=round(porcen(m->cost,preci1),2)
				p2=round(porcen(m->cost,preci2),2)
				p3=round(porcen(m->cost,preci3),2)
				p4=round(porcen(m->cost,preci4),2)
				@ 3,col1 GET p1 PICT '9999999999.999'
				@ 4,col1 GET p2 PICT '9999999999.999'
				@ 5,col1 GET p3 PICT '9999999999.999'
				@ 6,col1 GET p4 PICT '9999999999.999'
				CLEA GETS
				ACTI SCRE
				DO WHILE .T.
					STOR NUL TO respuesta
					IF !EMPTY(elimer("  Para Ingresar Precios",-1,10))
						registro=str(recno())
						acti scre
						=men_lin(ALLTRIM(mer->merca))
						if lock("MER") .OR. Lok("MER")
							REPL costo WITH cost
							REPL precio1 WITH preci1
							REPL precio2 WITH preci2
							REPL precio3 WITH preci3
							REPL precio4 WITH preci4
							REPL stock WITH stoc
							REPL stockmin WITH stocmin
							REPL stockmax WITH stocmax
							REPL stockres WITH stocres
							=repuse()
						ENDIF
						UNLO IN mer
						=iaud('PRECIO '+ALLTRIM(ARTICULO)+'-'+JANNAME)
					ELSE
						EXIT
					ENDIF
				ENDDO
			ENDIF
		ELSE
			EXIT
		ENDIF
	ENDDO
	DEAC WIND win
ELSE
	=iaudI()
ENDIF
ulpr=PROGRAM()
=MEN_LIN(BOTOM)
RETURN
*: EOF: IPREL.PRG

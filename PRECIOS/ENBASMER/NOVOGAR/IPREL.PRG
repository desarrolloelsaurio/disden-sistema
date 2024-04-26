********************************************************************************
*-- Programa: iprel.prg
*-- Fecha   : 09/10/91 01:41pm
*-- Version : G. REINER
*-- Notas   : globaliza precios
********************************************************************************
#DEFINE PICU3  '999,999,999.99'
#DEFINE PICU1  '99999.99'
#DEFINE PICU2  '9999999'

STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	DO WHILE .T.
		STOR NUL TO cost
		STOR 30 TO COL,COL1
		STOR XAP1 TO PRECI1
		STOR XAP2 TO PRECI2
		STOR XAP3 TO PRECI3
		STOR XAP4 TO PRECI4
		STOR XAS1 TO STOC
		STOR XAS2 TO STOCMIN
		STOR XAS3 TO STOCMAX
		STOR XAS4 TO STOCRES
		NADA=MER.ARTICULO
		NADA1=MER.MERCA
		=MOVEWIN(6,10,19,62,"WIN"," Generaliza Precios-Empresa "+UPPER(ALLTRIM(JANNAME)),UPPER(ALLTRIM(JANNAME)))
		@ 1,1 SAY 'COSTO' COLO SCHE 3
		@ 3,1 SAY '% '+XALIS1 COLO SCHE 3
		@ 4,1 SAY '% '+XALIS2 COLO SCHE 3
		@ 5,1 SAY '% '+XALIS3 COLO SCHE 3
		@ 6,1 SAY '% '+XALIS4 COLO SCHE 3
		@ 7,1 SAY 'STOCK' COLO SCHE 3
		@ 8,1 SAY 'STOCK MINIMO' COLO SCHE 3
		@ 9,1 SAY 'STOCK MAXIMO' COLO SCHE 3
		@ 10,1 SAY 'STOCK RESERVADO' COLO SCHE 3
		@ 7,COL GET stoc PICT PICU2 MESS 'Stock Disponible'
		@ 8,COL GET stocmin PICT PICU2 RANGE 1,9999999 MESS 'Stock M¡nimo'
		@ 9,COL GET stocmax PICT PICU2 RANGE stocmin,999999 MESS 'Stock M ximo'
		@ 10,COL GET stocres PICT PICU2 MESS 'Stock Reservado'
clea gets
		@ 1,COL GET cost PICT PICU3 MESS 'Costo de Venta del Producto'
		@ 3,COL GET preci1 PICT PICU1 MESS pcu+xalis1
		@ 4,COL GET preci2 PICT PICU1 MESS pcu+xalis2
		@ 5,COL GET preci3 PICT PICU1 MESS pcu+xalis3
		@ 6,COL GET preci4 PICT PICU1 MESS pcu+xalis4
		read
		IF LASTKEY()#27
			IF !EMPTY(COST)
				P1=PORCEN(M.COST,PRECI1,0)
				P2=PORCEN(M.COST,PRECI2,0)
				P3=PORCEN(M.COST,PRECI3,0)
				P4=PORCEN(M.COST,PRECI4,0)
				@ 3,COL1 GET P1 PICT PICU3
				@ 4,COL1 GET P2 PICT PICU3
				@ 5,COL1 GET P3 PICT PICU3
				@ 6,COL1 GET P4 PICT PICU3
				CLEA GETS
				ACTI SCRE
				DO WHILE .T.
					STOR NUL TO respuesta
					IF !EMPTY(elimer("  Para Ingresar Precios",-1,10))
						registro=str(recno())
						=men_lin(ALLTRIM(mer.merca))
						=lock("MER") .OR. Lok("MER")
						REPL COSTO WITH COST
						REPL PRECIO1 WITH PRECI1
						REPL PRECIO2 WITH PRECI2
						REPL PRECIO3 WITH PRECI3
						REPL PRECIO4 WITH PRECI4
						=REPUSE()
						UNLO IN MER
						=IAUD(ALLTRIM(MER.ARTICULO)+'-'+JANNAME)
					ELSE
						EXIT
					ENDIF
				ENDDO
			ENDIF
		ELSE
			EXIT
		ENDIF
	ENDDO
	DEAC WIND WIN
ELSE
	=IAUDI()
ENDIF
=MEN_LIN(BOTOM)
RETURN

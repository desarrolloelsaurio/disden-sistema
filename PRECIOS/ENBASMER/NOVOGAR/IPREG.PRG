********************************************************************************
*-- Programa: IPREG.PRG
*-- Fecha   : 09/05/91 06:03pm
*-- Version : G. REINER
*-- Notas   : INGRESA PRECIOS
********************************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	STOR 30 TO COL,COL1
	DO WHILE .T.
		STOR 0 TO RESPUESTA
		IF !EMPTY(ELIMER(" A INGRESAR",-1,1))
			FF=RECNO("MER")
			REGISTRO=STR(FF)
			=LOCK("MER") .OR. LOK("MER")
			TR1=''
			SELE MER
			NADA=ARTICULO
			NADA1=MERCA
			=MOVEWIN(4,10,21,60,'WIN'," Ingreso de Precios - Producto "+ALLTRIM(merca),ALLTRIM(JANNAME))
			STOR MER.COSTO TO cost
			STORE 'SI' TO RESPUESTA
			IF PREGUNTA("REMPLAZA VALORES NULOS POR VALORES POR DEFECTO",.T.,10,0,'@M SI,NO')="SI"
				STOR iif(empty(precio1),xap1,precio1) TO preci1
				STOR iif(empty(precio2),xap2,precio2) TO preci2
				STOR iif(empty(precio3),xap3,precio3) TO preci3
				STOR iif(empty(precio4),xap4,precio4) TO preci4
				STOR iif(empty(stock),xas1,stock) TO STOC
				STOR iif(empty(stocKmin),xas2,stocKmin) TO STOCMIN
				STOR IIF(EMPTY(STOCKMAX),XAS3,STOCKMAX) TO STOCMAX
				STOR IIF(EMPTY(STOCKRES),XAS4,STOCKRES) TO STOCRES
			ELSE
				STOR PRECIO1 TO PRECI1
				STOR PRECIO2 TO PRECI2
				STOR PRECIO3 TO PRECI3
				STOR PRECIO4 TO PRECI4
				STOR STOCK TO STOC
				STOR STOCKMIN TO STOCMIN
				STOR STOCKMAX TO STOCMAX
				STOR STOCKRES TO STOCRES
			ENDIF
			@ 1,2 SAY "ARTICULO:" GET nada
			@ 2,2 SAY "PRODUCTO:" GET nada1
			CLEA GETS
			@ 5,1 SAY 'COSTO REAL' COLO SCHE 3
			@ 7,1 SAY '% '+xalis1 COLO SCHE 3
			@ 8,1 SAY '% '+xalis2 COLO SCHE 3
			@ 9,1 SAY '% '+xalis3 COLO SCHE 3
			@ 10,1 SAY '% '+xalis4 COLO SCHE 3
			@ 11,1 SAY 'STOCK' COLO SCHE 3
			@ 12,1 SAY 'STOCK MINIMO' COLO SCHE 3
			@ 13,1 SAY 'STOCK MAXIMO' COLO SCHE 3
			@ 14,1 SAY 'STOCK RESERVADO' COLO SCHE 3
			@ 11,COL GET stoc PICT '9999999' MESS 'Stock Disponible'
			@ 12,COL GET stocmin PICT '9999999' RANGE 1,9999999 MESS 'Stock M¡nimo'+tr1
			@ 13,COL GET stocmax PICT '9999999' RANGE stocmin,999999 MESS 'Stock M ximo'+tr1
			@ 14,COL GET stocres PICT '9999999' MESS 'Stock Reservado'+tr1
			clea gets

			@ 5,COL GET cost PICT '9999999999.999' MESS 'Costo de Venta del Producto'+tr1
			@ 7,COL GET preci1 PICT '9999.999' MESS pcu+xalis1+tr1
			@ 8,COL GET preci2 PICT '9999.999' MESS pcu+xalis2+tr1
			@ 9,COL GET preci3 PICT '9999.999' MESS pcu+xalis3+tr1
			@ 10,COL GET preci4 PICT '9999.999' MESS pcu+xalis4+tr1
			READ
			IF LASTKEY()#27
				IF !empty(cost)
					p1=porcen(m.cost,preci1,0)
					p2=porcen(m.cost,preci2,0)
					p3=porcen(m.cost,preci3,0)
					p4=porcen(m.cost,preci4,0)
					@ 7,col1 GET p1
					@ 8,col1 GET p2
					@ 9,col1 GET p3
					@ 10,col1 GET p4
					CLEA GETS
					SELE MER
					GO FF
					REPL costo WITH cost
					REPL precio1 WITH preci1
					REPL precio2 WITH preci2
					REPL precio3 WITH preci3
					REPL precio4 WITH preci4
					=Repuse()
					UNLO IN MER
					=IAUD(MER.ARTICULO)
				ENDIF
			endif
		ELSE
			EXIT
		ENDIF
		DEAC WIND win
	ENDDO
ELSE
	=IAUDI()
ENDIF
DEAC WIND ALL
=MEN_LIN(BOTOM)
RETURN

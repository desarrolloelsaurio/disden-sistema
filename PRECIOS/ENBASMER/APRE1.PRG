********************************************************************************
*-- Programa: apre1.prg
*-- Fecha   : 09/10/91 03:21pm
*-- Version : G. REINER
*-- Notas   : ACTUALIZACION DE PRECIOS
********************************************************************************
ulpr=hora_ulp(program())
IF cheqseg()
	=MOVEwin(5,10,20,72,'WIN'," Actualizaciขn Precios"+tt+" ")
	stor SPACE(15) TO tipo
	@ 1,1 SAY "TIPO DE ACTUALIZACION" GET tipo PICT "@M Porcentaje,Suma,Reemplaza" MESS 'Tipo de Actualizaciขn'
	@ 2,1 SAY "MONTO                " COLO SCHE 3
	READ
	IF LASTKEY()#27
		STOR NUL TO tomon
		IF tipo="P"
			@ 2,1 SAY "PORCENTAJE           " GET tomon PICT '999999999.99'
		ELSE
			@ 2,1 SAY "MONTO                " GET tomon PICT '999999999.99'
		ENDIF
		READ
		IF LASTKEY()#27 .AND. !empty(tomon)
			tipo=LEFT(tipo,1)
			IF tipo='P'
				tomon=1+(tomon/100)
			ENDIF
			stor 'NO' TO cost,preci1,preci2,preci3,preci4,stoc,stocmin,stocmax,stocres
			@ 4,1 SAY "ษออออออออออออออออออออออออออหอออออออออออออออออออออออออออออป" COLO SCHE 3
			@ 5,1 SAY "บ  CONCEPTO A ACTUALIZAR   บ  ACTUALIZA EL CONCEPTO ?    บ" COLO SCHE 3
			@ 6,1 SAY "ฬออออออออออออออออออออออออออฮอออออออออออออออออออออออออออออน" COLO SCHE 3
			FOR A=7 TO 12
				@ A,1 SAY "บ                          บ                             บ" COLO SCHE 3
				ENDFOR
				@ A,1 SAY "ศออออออออออออออออออออออออออสอออออออออออออออออออออออออออออผ"
				@ 7,4 SAY 'COSTO' COLO SCHE 3
				@ 9,4 SAY '% '+xalis1 COLO SCHE 3
				@ 10,4 SAY '% '+xalis2 COLO SCHE 3
				@ 11,4 SAY '% '+xalis3 COLO SCHE 3
				@ 12,4 SAY '% '+xalis4 COLO SCHE 3
				stor 40 TO COL
				@ 7,COL GET cost PICT "@M NO,SI" MESS 'Actualiza Costo de Venta del Producto'
				@ 9,COL GET preci1 PICT "@M NO,SI" MESS 'Actualiza '+pcu+xalis1
				@ 10,COL GET preci2 PICT "@M NO,SI" MESS 'Actualiza '+pcu+xalis2
				@ 11,COL GET preci3 PICT "@M NO,SI" MESS 'Actualiza '+pcu+xalis3
				@ 12,COL GET preci4 PICT "@M NO,SI" MESS 'Actualiza '+pcu+xalis4
				READ
				IF LASTKEY()#27
					IF cost="SI" .OR. preci1="SI" .OR. preci2="SI" .OR. preci3="SI" .OR. preci4="SI"
						SELE mer
						ACTI SCRE
						SCAN FOR &FISC
							=MEN_LIN(ALLTRIM(mer.merca))
							REGISTRO=STR(RECNO())
							=FLOCK() .OR. FLOK()
							IF tipo='S'
								REPL COSTO   WITH IIF(cost='SI',COSTO+TOMON,COSTO)
								REPL PRECIO1 WITH IIF(preci1='SI',precio1+tomon,PRECIO1)
								REPL PRECIO2 WITH IIF(preci2='SI',precio2+tomon,PRECIO2)
								REPL PRECIO3 WITH IIF(preci3='SI',precio3+tomon,PRECIO3)
								REPL PRECIO4 WITH IIF(preci4='SI',precio4+tomon,PRECIO4)
							ELSE
								IF tipo='R'
									REPL COSTO WITH IIF(cost='SI',TOMON,COSTO)
									REPL PRECIO1 WITH IIF(PRECI1='SI',TOMON,PRECIO1)
									REPL PRECIO2 WITH IIF(PRECI2='SI',TOMON,PRECIO2)
									REPL PRECIO3 WITH IIF(PRECI3='SI',TOMON,PRECIO3)
									REPL PRECIO4 WITH IIF(PRECI4='SI',TOMON,PRECIO4)
								ELSE
									REPL COSTO WITH IIF(cost='SI',costo*tomon,COSTO)
									REPL PRECIO1 WITH IIF(preci1='SI',precio1*tomon,PRECIO1)
									REPL PRECIO2 WITH IIF(preci2='SI',precio2*tomon,PRECIO2)
									REPL PRECIO3 WITH IIF(preci3='SI',precio3*tomon,PRECIO3)
									REPL PRECIO4 WITH IIF(preci4='SI',precio4*tomon,PRECIO4)
								ENDIF
							ENDIF
							=repuse()
							UNLO IN MER
						ENDSCAN
					ENDIF
				ENDIF
			ENDIF
			=iaud('ACTUALIZACION DE PRECIOS')
		ENDIF
		=RELEWIN("win")
	ELSE
		=iaudI()
	ENDIF
	ulpr=PROGRAM()
RETURN MEN_LIN(BOTOM)

********************************************************************************
*-- Programa: apre1.prg
*-- Fecha   : 09/10/91 03:21pm
*-- Version : G. REINER
*-- Notas   : ACTUALIZACION DE PRECIOS
********************************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	=movewin(5,10,20,72,'win'," Actualizaciขn Precios"+tt+" ")
	STORE SPACE(15) TO tipo
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
		IF LASTKEY()#27 .AND. tomon#0
			tipo=LEFT(tipo,1)
			IF tipo='P'
				tomon=1+(tomon/100)
			ENDIF
			STORE 'NO' TO costorea,cost,preci1,preci2,preci3,preci4,stoc,stocmin,stocmax,stocres
			@ 4,1 SAY "ษออออออออออออออออออออออออออหอออออออออออออออออออออออออออออป" COLO SCHE 3
			@ 5,1 SAY "บ  CONCEPTO A ACTUALIZAR   บ  ACTUALIZA EL CONCEPTO ?    บ" COLO SCHE 3
			@ 6,1 SAY "ฬออออออออออออออออออออออออออฮอออออออออออออออออออออออออออออน" COLO SCHE 3
			FOR A=7 TO 12
				@ A,1 SAY "บ                          บ                             บ" COLO SCHE 3
				ENDFOR
				@ A,1 SAY "ศออออออออออออออออออออออออออสอออออออออออออออออออออออออออออผ"
				@ 7,4 SAY 'COSTO REAL' COLO SCHE 3
				@ 8,4 SAY 'COSTO DE VENTA' COLO SCHE 3
				@ 9,4 SAY '% '+xalis1 COLO SCHE 3
				@ 10,4 SAY '% '+xalis2 COLO SCHE 3
				@ 11,4 SAY '% '+xalis3 COLO SCHE 3
				@ 12,4 SAY '% '+xalis4 COLO SCHE 3
				STORE 40 TO COL
				@ 7,COL GET costorea PICT "@M NO,SI" MESS 'Actualiza Costo real del Producto'
				@ 8,COL GET cost PICT "@M NO,SI" MESS 'Actualiza Costo de Venta del Producto'
				@ 9,COL GET preci1 PICT "@M NO,SI" MESS 'Actualiza '+pcu+xalis1
				@ 10,COL GET preci2 PICT "@M NO,SI" MESS 'Actualiza '+pcu+xalis2
				@ 11,COL GET preci3 PICT "@M NO,SI" MESS 'Actualiza '+pcu+xalis3
				@ 12,COL GET preci4 PICT "@M NO,SI" MESS 'Actualiza '+pcu+xalis4
				READ
				IF LASTKEY()#27
					IF costorea="SI" .OR. cost="SI" .OR. preci1="SI" .OR. preci2="SI" .OR. preci3="SI" .OR. preci4="SI"
						SELE mer
						ACTI SCRE
						SCAN FOR &FISC
							registro=str(recno())
							=lock("mer") .or. lok("mer")
							@ 24,nul SAY PADC(ALLTRIM(mer.merca),80)
							IF tipo='S'
								IF cost='SI'
									REPL costo WITH costo+tomon
								ENDIF
								IF costorea='SI'
									REPL costoreal WITH costoreal+tomon
								ENDIF
								IF preci1='SI'
									REPL precio1 WITH precio1+tomon
								ENDIF
								IF preci2='SI'
									REPL precio2 WITH precio2+tomon
								ENDIF
								IF preci3='SI'
									REPL precio3 WITH precio3+tomon
								ENDIF
								IF preci4='SI'
									REPL precio4 WITH precio4+tomon
								ENDIF
							ELSE
								IF tipo='R'
									IF cost='SI'
										REPL costo WITH tomon
									ENDIF
									IF costorea='SI'
										REPL costoreal WITH tomon
									ENDIF
									IF preci1='SI'
										REPL precio1 WITH tomon
									ENDIF
									IF preci2='SI'
										REPL precio2 WITH tomon
									ENDIF
									IF preci3='SI'
										REPL precio3 WITH tomon
									ENDIF
									IF preci4='SI'
										REPL precio4 WITH tomon
									ENDIF
								ELSE
									IF cost='SI'
										REPL costo WITH costo*tomon
									ENDIF
									IF costorea='SI'
										REPL costoreal WITH costoreal*tomon
									ENDIF
									IF preci1='SI'
										REPL precio1 WITH precio1*tomon
									ENDIF
									IF preci2='SI'
										REPL precio2 WITH precio2*tomon
									ENDIF
									IF preci3='SI'
										REPL precio3 WITH precio3*tomon
									ENDIF
									IF preci4='SI'
										REPL precio4 WITH precio4*tomon
									ENDIF
								ENDIF
							ENDIF
							DO repuse
							unlo in mer
						ENDSCAN
					ENDIF
				ENDIF
			ENDIF
			=iaud(fisc)
		ENDIF
		=relewin("WIN")
	ELSE
		=iaudi()
	ENDIF
	ulpr=PROGRAM()
	=MEN_LIN(BOTOM)
RETURN

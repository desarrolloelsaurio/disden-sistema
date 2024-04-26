********************************************************************************
*-- Programa: iStol.prg
*-- Fecha   : 09/10/91 01:41pm
*-- Version : G. REINER
*-- Notas   : globaliza Stock
********************************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	DO WHILE .T.
		defi wind win FROM 6,10 TO 13,50 TITL " Generaliza Stock " SHAD colo sche 8
		STOR NUL TO costorea,cost
		STORE 30 TO COL,col1
		STORE xas1 TO stoc
		STORE xas2 TO stocmin
		STORE xas3 TO stocmax
		STORE xas4 TO stocres
		nada=mer.articulo
		nada1=mer.merca
		ACTI WIND win
		@ 1,1 SAY 'STOCK' COLO SCHE 3
		@ 2,1 SAY 'STOCK MINIMO' COLO SCHE 3
		@ 3,1 SAY 'STOCK MAXIMO' COLO SCHE 3
		@ 4,1 SAY 'STOCK RESERVADO' COLO SCHE 3
		@ 1,COL GET stoc PICT '9999999' MESS 'Stock Disponible'
		@ 2,COL GET stocmin PICT '9999999' RANGE 1,9999999 MESS 'Stock M¡nimo'
		@ 3,COL GET stocmax PICT '9999999' RANGE stocmin,999999 MESS 'Stock M ximo'
		@ 4,COL GET stocres PICT '9999999' MESS 'Stock Reservado'
		READ
		IF LASTKEY()#27
			IF !empty(stoc) .and. !empty(stocres)
				ACTI SCRE
				DO WHILE .T.
					STOR NUL TO respuesta
					IF !EMPTY(elimer("  Para Ingresar Stock",-1,10))
						FOR j=xatalmin TO xatalmax STEP xatalstep
							@ 24,nul SAY PADC(" "+ALLTRIM(mer.merca)+"/Talle:"+ALLTRIM(STR(j)),80,'*') COLO SCHE 19
							rtc=LEFT(mer.articulo,13)+zero(j*10,3)
							SELE pre
							IF !SEEK(rtc)
								SELE pre
								DO flok WITH "pre"
								APPE BLAN
							ENDIF
							REPL articulo WITH rtc
							REPL stock WITH stoc
							REPL stockmin WITH stocmin
							REPL stockmax WITH stocmax
							REPL stockres WITH stocres
							=REPUSE()
							REPL hora WITH TIME()
							UNLO IN pre
						NEXT
						=IAUD(MER.ARTICULO)
						SELE mer
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
	=iaudi()
ENDIF
ulpr=PROGRAM()
RETURN MEN_LIN(BOTOM)

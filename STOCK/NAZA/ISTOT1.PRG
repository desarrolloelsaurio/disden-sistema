********************************************************************************
*-- Programa: IStoT1.PRG
*-- Fecha   : 09/09/91 06:20pm
*-- Version : G. REINER
*-- Notas   : GENERALIZA Stock
********************************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	defi wind win FROM 6,10 TO 13,60 TITL " Generaliza Stock"+tt+" " SHAD colo sche 8
	STORE 30 TO COL
	STORE 30 TO col1
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
			SELE mer
			SCAN FOR &fisc
				FOR j=xatalmin TO xatalmax STEP xatalstep
					@ 24,nul SAY PADC(" "+ALLTRIM(mer.merca)+"/Talle:"+ALLTRIM(STR(j)),80,'*') COLO SCHE 19
					rtc=LEFT(mer.articulo,13)+zero(j*10,3)
					SELE pre
					IF !SEEK(rtc)
						=flock("pre") .or. flok("pre")
						APPE BLAN
					ENDIF
					REPL pre.articulo WITH rtc
					REPL pre.costo WITH cost
					REPL pre.stock WITH stoc
					REPL pre.stockmin WITH stocmin
					REPL pre.stockmax WITH stocmax
					REPL pre.stockres WITH stocres
					=REPUSE()
					REPL hora WITH TIME()
					UNLO IN pre
					ENDFOR
					SELE mer
				ENDSCAN
				=iaud(tt)
			ENDIF
		ENDIF
		DEAC WIND win
	ELSE
		=iaudi()
	ENDIF
RETURN MEN_LIN(BOTOM)
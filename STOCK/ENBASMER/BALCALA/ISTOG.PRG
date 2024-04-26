********************************************************************************
*-- Programa: IPREG.PRG
*-- Fecha   : 09/05/91 06:03pm
*-- Version : G. REINER
*-- Notas   : INGRESA StockS
********************************************************************************
ulpr=hora_ulp(program())
IF cheqseg()
	DO WHILE .T.
		STOR NUL TO respuesta
		STORE 20 TO COL
		IF !EMPTY(elimer(" a Ingresar",-1,10))
			scat memv
			M.HAYDISC=HAYCAMPO("MER.DISCRIM","MER") 
			QIN=IIF(M.HAYDISC .AND. M.DISCRIM,15,14)
			=MOVEWIN(4,10,QIN,60,'WIN'," Ingreso de Stocks - Producto "+ALLTRIM(merca)+' EMPRESA '+UPPER(ALLTRIM(JANNAME)),UPPER(ALLTRIM(JANNAME)))
			@ 1,2 SAY "ARTICULO:" GET m.articulo
			@ 2,2 SAY "PRODUCTO:" GET m.merca
			CLEA GETS
			@ 4,1 SAY 'STOCK' COLO SCHE 3
			@ 5,1 SAY 'STOCK MINIMO' COLO SCHE 3
			@ 6,1 SAY 'STOCK MAXIMO' COLO SCHE 3
			@ 7,1 SAY 'STOCK RESERVADO' COLO SCHE 3
			IF M.HAYDISC .AND. M.DISCRIM
				@ 8,1 SAY 'PESO TOTAL' COLO SCHE 3
			ENDIF
			@ 4,COL GET m.stock PICT '9999999' MESS 'Stock Disponible'
			@ 5,COL GET m.stockmin PICT '9999999' RANGE 1,9999999 MESS 'Stock M¡nimo'
			@ 6,COL GET m.stockmax PICT '9999999' RANGE M.stocKmin,999999 MESS 'Stock M ximo'
			@ 7,COL GET m.stockres PICT '9999999' MESS 'Stock Reservado'
			IF M.HAYDISC .AND. M.DISCRIM
				@ 8,COL GET m.STOCkpes PICT '9999999.99' MESS 'Peso total'
			ENDIF
			READ
			IF LASTKEY()#27 .OR. !UPDATE()
				IF !EMPTY(m.stOCk)
					=lock() .or. lok(str(recno()),'MER')
						GATH MEMV
						=REPUSE()
					UNLO IN MER
					=iaud(ALLTRIM(JANNAME)+'-'+MER.MERCA)
				ENDIF
			ELSE
				EXIT
			ENDIF
			DEAC WIND win
		ELSE
			EXIT
		ENDIF
	ENDDO
ELSE
	=iaudi()
ENDIF
if !empty(wontop())
	=RELEWIN("WIN")
endif
=MEN_LIN(BOTOM)
RETURN

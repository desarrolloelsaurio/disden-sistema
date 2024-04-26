********************************************************************************
*-- Programa: iVIX.prg
*-- Fecha   : 06/12/91 12:44pm
*-- Version : R. 'EL BATA'
*-- Notas   : INGRESA DATOS DE VIAJANTES
*-- Modificaci¢n 04-02-92 12:50pm GOYO
*-- Modificaci¢n GOYO 07-22-92 11:37pm marca -> empresa
********************************************************************************
ULPR=HORA_ULP(PROGRAM())
IF CHEQSEG()
	=MOVEWIN(mviar,mviac,mviar+mviala,mviac+mviaan,'WIN'," Selecciona "+biaja+" ")
	SELE via
	stor 25 TO COL
	SCAT MEMVAR
	DO mvia WITH .T.
	IF confirma(upper(bIAJA),.T.,mviar+mviala,mviac+10)
		DO WHILE .T.
			=MOVEWIN(ivixr,ivixc,ivixr+ivixla,ivixc+ivixan,'WIN1'," Ingreso Datos de "+biaja+" ")
			SELE vix
			STOR " Ingreso Zonas de "+biajas+" - " TO me1
			STOR 20 TO COL
			STOR NUL TO kok
			CLEA
			nada=m.codvia
			SCAT MEMV BLAN
			m.codvia=nada
			@ 1,2 SAY "CODIGO "+upper(bIAJA) COLO SCHE 3
			@ 2,2 SAY "ZONA" COLO SCHE 3
			@ 3,2 SAY "MARCA" COLO SCHE 3
			@ 1,COL GET m.codvia
			CLEAR GETS
			SELE mix
			STOR NUL TO respuesta
			IF !EMPTY(elizon(" del "+biaja+" - [ESC] Sale",2,COL))
				nada1=mix.texto1
				M.ZONA=LEFT(MIX.TEXTO2,2)
				@ 2,COL GET nada1
				CLEAR GETS
				STORE NUL TO RESPUESTA
				IF !EMPTY(ELIEMP(" del "+biaja,2,COL))
					nada2=MIX.TEXTO1
					M.MARCA=LEFT(MIX.TEXTO2,2)
					@ 3,COL GET nada2
					CLEAR GETS
					SELE vix
					IF YAESTABA(m.codvia+m.marca+m.zona,ALIAS(),'VIAJADAT',.T.)
						=men_lin('ZONA '+ALLTRIM(NADA1)+' Y MARCA '+ALLTRIM(NADA2)+TEN)
						ACTI WIND win1
						=existe(' MARCA Y ZONA')
						=INKEY(NUL)
						CLEA
					ELSE
						IF confirma("INGRESO de la ZONA del "+upper(bIAJA),.T.,ivixr+ivixla,nul)
							=AGRABAR("VIX")
							=iaud(ALLTRIM(VIA.CODVIA)+'-'+ALLTRIM(NADA1)+'-'+ALLTRIM(NADA2))
						ELSE
							EXIT
						ENDIF
					ENDIF
				ELSE
					EXIT
				ENDIF
			ELSE
				EXIT
			ENDIF
		ENDDO
		=RELEWIN("WIN1")
	ENDIF
	=RELEWIN("WIN")
ELSE
	=iaudi()
ENDIF
RETURN MEN_LIN(BOTOM)

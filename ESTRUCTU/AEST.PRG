*********************************************************************************
*-- Programa: AEST.PRG
*-- Fecha   : 06/20/91
*-- Version : V.LEEGSTRA
*-- Notas   : BORRA UN PROCESO DE TODA LA BASE est
********************************************************************************
STORE RECNO() TO ff
SCAT memvar
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	SELE est
	IF FLOCK("EST")
		rr1=6
		rr2=14
		cc1=7
		cc2=56
		COL=17
		col1=30
		kok=0
		define window win1 FROM rr1+4,cc1+10 TO rr2+2,cc2+23 TITL " Proceso de Fabricaci¢n a Borrar" shad COLOR sche 8
		DO WHILE .T.
			acti wind win1
			CLEA
			GOTO ff
			@ 1,1 SAY 'INGRESE PROCESO A BORRAR' COLO sche 3
			=xseek(est.prc,'prc','prccod')
			STORE prc.procfab TO nada
			@ 1,col1 GET nada
			=men_lin('[ESC] para men£')
			CLEAR GETS
			STORE 0 TO respuesta
			IF !empty(eliprc(" del Producto",1,col1))
				m.prc=prc.prccod
				acti wind win1
				nada=prc.procfab
				@ 1,col1 GET nada
				CLEAR GETS
			ENDIF
			IF LASTKEY()=27
				EXIT
			ENDIF
			IF confirma(" Borrar el Proceso en TODA la base",.T.,rr2+1,0)
				SELE est
				GO TOP
				? est.prc
				? m.prc
				WAIT 'EST-PRC, M-PRC'
				DELETE FOR est.prc=m.prc
				=IAUD(M.PRC)
			ENDIF
			STORE kok+1 TO kok
		ENDDO
	ENDIF
	=RELEWIN("WIN1")
	UNLO in est
ELSE
	=IAUDi()
ENDIF
ACTI SCREE
RETURN MEN_LIN(BOTOM)

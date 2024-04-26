g********************************************************************************
*-- Programa: CMER.PRG
*-- Fecha   : 12/14/91
*-- Version : V.LEEGSTRA
*-- Notas   : CORRIGE MERCADERIA
********************************************************************************
STOR RECNO() TO ff
registro=STR(ff)
STORE hora_ulp(PROGRAM()) to ULPR
IF CHEQSEG()
	=movewin(cMERr,cMERc,cMERr+cMERla,cMERc+cMERan,'win'," Correcci¢n Mercader¡as ")
	SELE MER
	=LOCK() .OR. Lok("MER")
	SCAT MEMV
	STOR " Correcci¢n Mercader¡a  - " TO me1
	STOR 13 TO COL
	STOR .F. TO kok,CAMBIO
	STOR NUL TO NACLA
	STOR .t. TO sigue
	DO MMER WITH .T.
	sele rub
	go top
	narubro=IIF(BUSRUB(M.RUBRO),rub.rubro,space(20))
	@ 1,COL GET narubro PICT x20 MESS 'Tecla y [ENTER] para Corregir - [ESC] para Men£'
	READ
	IF LASTKEY()#27
		IF UPDATE()
			CAMBIO=.T.
			STORE 1 TO NACLA
			store 0 to respuesta
			m.rubro=iif(empty(elirub(" del Producto ",1,col)),'',rub.codrub)
			if !empty(m.rubro)
				store rub.rubro to nada
				acti wind win
				@ 1,col get nada
				clear gets
			ENDIF
		endif
		sele mix
		set ORDER TO TAG VARTEX
		naVARIE=IIF(XSEEK(m.variedad,'MIX','VARCOD'),mix.texto1,space(20))
		@ 2,COL GET navarie PICT x20 MESS 'Tecla y [ENTER] para Corregir - [ESC] para Men£'
		READ
		IF LASTKEY()#27
			IF UPDATE()
				CAMBIO=.T.
				STORE 1 TO NACLA
				store 0 to respuesta
				m.variedad=iif(empty(elivar(" del Producto",2,col)),0,left(mix.texto2,2))
				if !empty(m.variedad)
					nada=mix.texto1
					acti wind win
					@ 2,col get nada
					clear gets
				endif
			ENDIF
			SELE MIX
			set ORDER TO TAG CALTEX
			nacalid=IIF(XSEEK(m.calidad,'MIX','CALCOD'),mix.texto1,space(20))
			@ 3,COL GET nacalid PICT x20 MESS 'Tecla y [ENTER] para Corregir - [ESC] para Men£'
			READ
			IF LASTKEY()#27
				IF UPDATED()
					CAMBIO=.T.
					STORE 1 TO NACLA
					store 0 to respuesta
					m.calidad=iif(empty(elical(" del Producto",3,col)),0,left(mix.texto2,2))
					if !empty(m.calidad)
						nada=mix.texto1
						acti wind win
						@ 3,col get nada
						clear gets
					endif
				ENDIF
				@ 4,col get m.palpopup picture '@!' ;
				mess ' Ingrese Descripci¢n de Mercader¡a '
				read
				IF UPDATED()
					CAMBIO=.T.
					STORE 2 TO NACLA
				ENDIF
				IF cambio
					if confirma(" los Datos Ingresados",.t.,18,0)
						SELE mer
						set order to tag merca
						nada=m.rubro+m.variedad+m.calidad
						SET DELE OFF
						IF NACLA=1
							IF seek(nada)
								ACTI SCRE
								@ 24,0 SAY PADC('Mercader¡a '+ten,80) COLO SCHE 19
								ACTI WIND win
								DO existe WITH 'Mercader¡a'
								=INKEY(0)
								CLEA
								STOR .F. TO sigue
							ENDIF
						ENDIF
						IF NACLA=2
							sele mer
							set order to tag PALPOPUP
							if SEEK(M.PALPOPUP)
								=MEN_LIN('Descripci¢n Mercader¡a '+ten)
								acti wind win
								do existe with ' DESCRIPCION '
								=inkey(NUL,"HM")
								clea
								STOR .F. TO sigue
							endif
						ENDIF
						SET DELE ON
						IF sigue
							=MEN_LIN(grabando)
						   M.ARTICULO=M.RUBRO+M.VARIEDAD+M.CALIDAD
							SELE mer
							GOTO ff
							GATH MEMV
							=repuse()
							STOR .T. TO kok
							=iaud(m.rubRO+m.variedad+m.calidad)
						ENDIF
					ENDIF
				endif
			endif
		endif
	endif
	UNLO IN mer
	=RELEWIN('win')
ELSE
	=iaudi()
ENDIF
=men_lin(botom)
RETURN
*: EOF: CMER.PRG

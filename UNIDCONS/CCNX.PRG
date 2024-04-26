*****************************************
*-- Programa: CCNX.prg
*-- Fecha   : 01-18-92 09:27am
*-- Version : R. 'EL BATA'
*-- Notas   : CORRIGE DATOS DE UNIDADES
*****************************************
stor hora_ulp(PROGRAM()) TO ulpr
IF CHEQSEG()
	=MOVEWIN(mcnxr,mcnxc,mcnxr+7,mcnxc+60,'win'," Selecciona Unidad ")
	SELE cns
	STORE 25 TO COL
	SCAT MEMVAR
	DO mcns with .t.
	store nul to kok
	IF confirma("el CONSORCIO",.T.,mcnXr+mcnXla,mcnXc+10)
		=moveWIN(iCNXr,iCNXc,iCNXr+iCNXla,iCNXc+iCNXan,'win1'," Correcci¢n de Unidades ")
		STOR " Correcci¢n de Unidades - " TO me1
		STOR 20 TO COL
		CLEA
		SELE CNX
		SCAT MEMV BLAN
		NADA = CNS.CONSORCIO
		@ 1,COL GET m.NADA
		CLEAR GETS
		IF XSEEK(cns.concod,"CNX","concod")
			SCAN WHILE cnx.concod=cns.concod
				ACTI WIND win1
				SCAT MEMV
				=MCNX(.T.)
				=men_lin("Elija la UNIDAD - [] Sig. - [ENTER] Corrige - [ESC] Sale")
				nada=NUL
				DO WHILE nada#13 .AND. nada#24 .AND. nada#27
					nada=INKEY(NUL,"HM")
				ENDDO
				sele cnx
				IF nada = 13
					ACTI WIND win1
					M.REGISTRO=RECNO()
					@ 2,COL get m.denom pict "@!" ;
					valid !XSEEK(cns.concod+m.denom,"CNX","condenom") .and. !empty(m.denom) .and. updated();
					error 'La unidad '+ALLTRIM(m.denom)+' DEL CONSORCIO '+ALLTRIM(cns.consorcio)+' ya existe o est  en blanco';
					mess "ingrese la denominaci¢n de la unidad"
					read
					if XSEEK(m.tipo,"MIX","TIPCOD")
						m.nada = mix.texto1
						@ 3,COL get m.nada mess "Una Tecla y enter para corregir"
						read
						if updated()
							store nul to respuesta
							if !empty(elitip("",3,COL))
								m.tipo = left(mix.texto2,2)
								m.nada = mix.texto1
								acti wind win1
								@ 3,COL get m.nada
								clea gets
							endif
						endif
					else
						store nul to respuesta
						if !empty(elitip("",3,COL))
							m.tipo = left(mix.texto2,2)
							m.nada = mix.texto1
							acti wind win1
							@ 3,COL get m.nada
							clea gets
						endif
					endif
					sele cnx
					@ 4,COL get m.piso  pict "@!" valid !EMPTY(m.piso) error "Debe tener PISO"
					@ 5,COL get m.dto   pict "@!" valid !EMPTY(m.dto)  error "Debe tener DEPARTAMENTO"
					read
					if lastkey()#27
						m.nada = PER.cliente
						@ 6,COL get m.nada mess "Una Tecla y enter para corregir"
						read
						if updated()
							STORE nul TO respuesta
							if !EMPTY(eliCLI(" del consorcio - [ESC] Sale",6,COL))
								ACTI WIND win1
								nada=PER.cliente
								@ 6,COL GET nada
								CLEAR GETS
								SELE CNX
							endif
						endif
						if lastkey()#27
							@ 7,COL get m.porcentaje pict "999.9999 %"
							read
							=men_lin(grabando)
							=FLOK("CNX") .or. lok("CNX")
							m.CODCLI=PER.CODCLI
							m.concod=cns.concod
							GO (M.REGISTRO)
							GATH MEMV
							=repuse()
							STOR kok+1 TO kok
							UNLO IN CNX
						ENDIF
					ENDIF
				ENDIF
				IF LAST()=27
				EXIT
				ENDIF
			ENDSCAN
		else
			=men_lin('EL CONSORCIO '+ALLTRIM(cns.consorcio)+'No posee UNIDADES - Enter para continuar')
			=EXISTE(' CONSORCIO SIN UNIDADES ')
			=INKEY(NUL,"HM")
		ENDIF
		=RELEWIN('WIN1')
	ENDIF
	=RELEWIN('WIN')
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)

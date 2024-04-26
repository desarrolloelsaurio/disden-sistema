********************************************************************************
*-- Programa: iCNX.prg
*-- Fecha   : 01-18-92 09:27am
*-- Version : R. 'EL BATA'
*-- Notas   : INGRESA DATOS DE UNIDADES
********************************************************************************
stor hora_ulp(PROGRAM()) TO ulpr
IF CHEQSEG()
	=movewIN(mCNXr,mCNXc,mCNXr+5,mCNXc+30,'win'," Selecciona Consorcio ")
	SELE cns
	STORE 17 TO COL
	SCAT MEMVAR
	=MCNS(.T.)
	IF confirma("el CONSORCIO",.T.,mcnXr+mcnXla,mcnXc+10)
		DO WHILE .T.
			=moveWIN(iCNXr,iCNXc,iCNXr+iCNXla,iCNXc+iCNXan,'win1'," Ingreso de Unidad ")
			STOR 20 TO COL
			STOR nul TO kok
			ACTI WIND win1
			CLEA
			SELE CNX
			SCAT MEMV BLAN
			=MCNX()
			NADA = CNS.CONSORCIO
			@ 1,COL GET m.NADA
			CLEAR GETS
			@ 2,COL get m.denom pict "@!" ;
			valid !XSEEK(cns.concod+m.denom,"CNX","condenom") .and. !empty(m.denom);
			error 'La unidad '+ALLTRIM(m.denom)+' DEL CONSORCIO '+ALLTRIM(cns.concod)+' ya existe o est  en blanco';
			mess "ingrese la denominaci¢n de la unidad"
			read
			if lastkey()#27
				STORE nul TO respuesta
				if !empty(elitip("",3,COL))
					m.tipo = left(mix.texto2,2)
					m.nada = mix.texto1
					acti wind win1
					@ 3,COL get m.nada
					clea gets
					@ 4,COL get m.piso  pict "@!" valid !EMPTY(m.piso) error "Debe tener PISO"
					@ 5,COL get m.dto   pict "@!" valid !EMPTY(m.dto)  error "Debe tener DEPARTAMENTO"
					read
					if lastkey()#27
						if !empty(ELICSS(" del consorcio - [ESC] Sale",6,COL))
							ACTI WIND win1
							nada=PER.cliente
							@ 6,COL GET nada
							CLEAR GETS
							SELE CNX
							@ 7,COL get m.porcentaje pict "999.9999 %"
							read
							IF confirma("INGRESO del CONSORCISTA ",.T.,12,0)
								m.CODCLI=PER.CODCLI
								m.concod=cns.concod
								=AGRABAR("CNX")
								=iaud(CNS.CONCOD+" "+M.DENOM)
							ENDIF
						ENDIF
					ELSE
						EXIT
					ENDIF
				ELSE
					EXIT
				ENDIF
			ELSE
				EXIT
			ENDIF
		ENDDO
		=RELEWIN('WIN1')
	ENDIF
	=RELEWIN('WIN')
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)

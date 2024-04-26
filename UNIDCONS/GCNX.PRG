********************************************************************************
*-- Programa: GCNX.prg
*-- Fecha   : 01-18-92 09:27am
*-- Version : R. 'EL BATA'
*-- Notas   : INGRESA DATOS DE UNIDADES GENERALIZADA
********************************************************************************
stor hora_ulp(PROGRAM()) TO ulpr
IF CHEQSEG()
	=moveWIN(mCNXr,mCNXc,mCNXr+7,mCNXc+mCNXan,'win'," Selecciona Consorcio ")
	SELE cns
	STORE 17 TO COL
	SCAT MEMVAR
	DO MCNS with .T.
	IF confirma("el CONSORCIO",.T.,mcnXr+mcnXla,mcnXc+10)
		=moveWIN(10,23,19,70,'win1'," Ingreso de Unidades")
		CLEA
		store nul to m.pisoini, m.pisofin
		store '  ' to m.dtoini, m.dtofin
		@ 1,1 SAY "Consorcio    :"
		@ 2,1 SAY "Piso Inicial :"
		@ 3,1 SAY "Piso FInal   :"
		@ 4,1 SAY "Tipo Unidad  :"
		@ 5,1 SAY "Dpto Inicial :"
		@ 6,1 SAY "Dpto Final   :"
		NADA = CNS.CONSORCIO
		@ 1,COL GET m.NADA
		CLEAR GETS
		@ 2,COL get m.pisoini  pict "@Z 99"
		@ 3,COL get m.pisofin  pict "@Z 99" valid iif(EMPTY(m.pisoini),!EMPTY(m.pisofin),m.pisofin>=m.pisoini) error "Mal Piso final"
		read
		store iif(EMPTY(m.pisoini),1,m.pisoini) to m.pisoini
		store nul to respuesta
		if !empty(elitip("",4,COL))
			m.tipo = left(mix.texto2,2)
			m.nada = mix.texto1
			acti wind win1
			@ 4,COL get m.nada
			clea gets
			@ 5,COL get m.dtoini pict "!!"
			@ 6,COL get m.dtofin pict "!!" valid iif(EMPTY(m.dtoini),!EMPTY(m.dtofin),ajusta(m.dtofin)>=ajusta(m.dtoini)) error "Mal Depto Final"
			read
			for m.pisoi=m.pisoini to m.pisofin
				store alltrim(m.dtoini) to m.dtoini
				store alltrim(m.dtofin) to m.dtofin
				for m.dtoi = iif(isdigit(m.dtoini),val(m.dtoini),asc(m.dtoini)) to iif(isdigit(m.dtofin),val(m.dtofin),asc(m.dtofin))
					m.dto  = iif(isdigit(m.dtoini),zero(m.dtoi,2),chr(m.dtoi))
					m.piso = zero(m.pisoi,2)
					m.denom = m.piso+'-'+zero(iif(isdigit(m.dtoini),m.dtoi,m.dtoi-asc("A")+1),2)
					=movewin(iCNXr,iCNXc,iCNXr+iCNXla,iCNXc+iCNXan,'win1'," Ingreso De Unidades")
					STOR 20 TO COL
					CLEA
					SELE CNX
					IF !XSEEK(cns.concod+m.denom,"CNX","condenom")
						=MCNX()
						NADA = CNS.CONSORCIO
						@ 1,COL GET m.NADA
						@ 2,COL GET m.denom
						m.nada = mix.texto1
						@ 3,COL get m.nada
						@ 4,COL get m.piso
						@ 5,COL get m.dto
						CLEAR GETS
						STORE nul TO respuesta
						if !empty(eliCLI(" del consorcio - [ESC] Sale",6,COL))
							ACTI WIND win1
							m.nada = PER.cliente
							@ 6,COL GET m.nada
							CLEAR GETS
							SELE CNX
							store nul to porcentaje
							@ 7,COL get m.porcentaje pict "999.99 %"
							read
							m.CODCLI=PER.CODCLI
							m.concod=cns.concod
							=agrabar("CNX")
							=IAUD(CNS.CONCOD)
						endif
					endif
				NEXT
			NEXT
		ENDIF
		=RELEWIN('WIN1')
	ENDIF
	=RELEWIN('WIN')
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)

FUNCTION AJUSTA
	PARA NUMERO
RETURN (IIF(ISDIGIT(ALLTRIM(NUMERO)),VAL(NUMERO),ALLTRIM(NUMERO)))

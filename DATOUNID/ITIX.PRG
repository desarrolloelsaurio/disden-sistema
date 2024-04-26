********************************************************************************
*-- Programa: itix.prg
*-- Fecha   : 01-18-92 09:27am
*-- Version : R. 'EL BATA'
*-- Notas   : INGRESA DATOS DE UNIDADES
********************************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	DEFINE WINDOW win FROM icnsr,icnsc TO icnsr+icnsla,icnsc+icnsan TITL " Selecciona Consorcio " SHAD COLOR SCHE 8
	SELE cns
	STORE 25 TO COL
	SCAT MEMVAR
	DO MCNS with .T.
	IF confirma("el CONSORCIO",.T.,itixr+itixla,itixc+10)
		DO WHILE .T.
			DEFINE WINDOW win1 FROM itixr,itixc TO itixr+itixla,itixc+itixan TITL " Ingreso Porc. de Participaci¢n en los Gastos " SHAD COLOR SCHE 8
			STOR 20 TO COL
			STOR nul TO kok
			ACTI WIND win1
			CLEA
			SELE tix
			SCAT MEMV BLAN
			DO MTIX WITH .F.
			nadA = CNS.CONSORCIO
			m.concod = cns.concod
			@ 1,COL GET m.NADA
			CLEAR GETS
			STORE nul TO respuesta
			if !empty(elitip("",2,COL))
				m.unicod = left(mix.texto2,2)
				m.nada = mix.texto1
				acti wind win1
				@ 2,col get m.nada
				clea gets
				STORE nul TO respuesta
				if !empty(eligas("",3,COL))
					m.gascod = left(mix.texto2,11)
					m.nada = mix.texto1
					acti wind win1
					@ 3,col get m.nada
					clea gets
					sele tix
					if seek(m.concod+m.unicod+m.gascod)
						acti scree
						@ 24,nul SAY PADC('consorcio, tipo unidad, tipo gasto ya existe - Enter para continuar',80) COLO SCHE 19
						ACTI WIND win
						do existe with "consorcio, tipo unidad, tipo gasto"
						=INKEY(NUL,"HM")
						CLEA
					else
						@ 4,COL get m.porcentaje pict "999.99 %"
						read
						IF confirma("INGRESO del Porcentaje de participaci¢n ",.T.,12,nul)
							=agrabar("tix")
							=iaud(cns.consorcio)
						ENDIF
					ENDIF
				ELSE
					EXIT
				ENDIF
			ELSE
				EXIT
			ENDIF
		ENDDO
		DEAC WIND win1
	ENDIF
	DEAC WIND win
ELSE
	=iaudi()
ENDIF
RETURN MEN_LIN(BOTOM)

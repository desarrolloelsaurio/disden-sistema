********************************************************************************
*-- Programa: rmer2.prg
*-- Fecha   : 10/26/90 12:27pm
*-- Version : G. REINER
*-- Notas   : repite mercader¡as
********************************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	STOR NUL TO respuesta
	do while .t.
		STOR NUL TO respuesta
		IF !EMPTY(elimer("a Repetir",-1,1))
			=movewin(mmerr,mmerc,mmerr+mmerla,mmerc+mmeran,'win'," Repite la Descripci¢n ")
			SELE mer
			REGISTRO=STR(RECNO())
			do lok with "mer"
			STORE 20 TO COL
			SCAT MEMVAR
			txt=mer->merca1
			unlo in mer
			DO mmer with .t.
			IF confirma("Repetir la Descripci¢n",.T.,18,0)
				do while .t.
					STOR NUL TO respuesta
					IF !EMPTY(eliMER("de Destino",-1,1))
						acti scre
						@ 24,nul say grabando colo sche 9
						acti wind win
						do flok with "mer"
						repl merca1 with txt addi
						DO REPUSE
						unlo in mer
						=iaud('REPETICION DESCRIPCION '+mer->merca)
					else
						exit
					endif
				enddo
			ENDIF
			=relewin('win')
		else
			exit
		endif
	enddo
ELSE
	=iaudi()
ENDIF
=MEN_LIN(BOTOM)
RETURN

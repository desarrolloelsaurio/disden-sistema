******************************************************************************
*-- Programa: rmer2.prg
*-- Fecha   : 10/26/90 12:27pm
*-- Version : G. REINER
*-- Notas   : repite mercader¡as
********************************************************************************
STORE hora_ulp(PROGRAM()) to ULPR
IF CHEQSEG()
	stor nul to respuesta
	do while .t.
		stor nul to respuesta
		IF !EMPTY(elimer("a Repetir",-1,1))
			=win0()
			SELE mer
			REGISTRO=STR(RECNO())
			=LOCK() .OR. lok("mer")
			stor 20 TO COL
			SCAT MEMVAR
			txt=mer.merca1
			unlo in mer
			DO mmer
			IF confirma("Repetir la Descripci¢n",.T.,18,nul)
				do while .t.
					stor nul to respuesta
					IF !EMPTY(eliMER("de Destino",-1,1))
						=men_lin(grabando)
						=flock() .or. flok("mer")
						repl merca1 with txt addi
						=REPUSE()
						unlo in mer
						=IAUD(ALLTRIM(MER.ARTICULO)+'-'+mer.merca)
					else
						exit
					endif
				enddo
			ENDIF
			rele wind win
		else
			exit
		endif
	enddo
ELSE
	=IAudi()
ENDIF
=men_lin(botom)
RETURN

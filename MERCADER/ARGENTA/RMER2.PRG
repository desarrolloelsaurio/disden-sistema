********************************************************************************
*-- Programa: rmer2.prg
*-- Fecha   : 10/26/90 12:27pm
*-- Version : G. REINER
*-- Notas   : repite mercader¡as
********************************************************************************
STORE hora_ulp(PROGRAM()) to ULPR
IF CHEQSEG()
	store NUL to respuesta
	do while .t.
		store NUL to respuesta
		IF !EMPTY(elimer("a Repetir",-1,1,.F.))
			=MOVEWIN(mmerr,mmerc,mmerr+mmerla,mmerc+mmeran,"WIN"," Repite la Descripci¢n ")
			SELE mer
			REGISTRO=STR(RECNO())
			=LOCK() .OR. lok("mer")
			STORE 20 TO COL
			SCAT MEMVAR
			txt=mer.merca1
			unlo in mer
			DO mmer
			IF confirma("Repetir la Descripci¢n",.T.,18,0)
				do while .t.
					store NUL to respuesta
					IF !EMPTY(eliMER("de Destino",-1,1,.F.))
						UNLO IN MER
						=AGRABAR("MER")
						=FLOCK() .OR. flok("mer")
						repl merca1 with txt addi
						unlo in mer
						=Iaud(mer.merca)
					else
						exit
					endif
				enddo
			ENDIF
			=relewin("win")
		else
			exit
		endif
	enddo
ELSE
	=IAUDI()
ENDIF
=MEN_LIN(BOTOM)
RETURN

********************************************************************************
*-- Programa: rmer.prg
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
			=movewin(mmerr,mmerc,mmerr+mmerla,mmerc+mmeran,'win'," Repite el Art¡culo ")
			SELE mer
			REGISTRO=STR(RECNO())
			do lok with "mer"
			STORE 20 TO COL
			TXT=ALLTRIM(MER->MERCA1)
			SCAT MEMVAR
			unlo in mer
			DO mmer with .t.
			IF confirma("Repetir el Art¡culo",.T.,18,0)
				do while .t.
					STOR NUL TO respuesta
					IF !EMPTY(elisue("del Producto",-1,1))
						clr=sue->codigo
						sele mer
						m->articulo=left(articulo,11)+clr
						set order to TAG ARTICULO
						if !seek(left(m->articulo,13))
							acti scre
							@ 24,nul say grabando colo sche 9
							**acti wind win
							do flok with "mer"
							appe blan
							gath memv
							repl merca1 with ""
							REPL MERCA1 WITH TXT
							REPL SUELA WITH RECNO("SUE")
							DO REPUSE
							unlo in mer
							=iaud('REPETICION ARTICULO '+mer->merca)
						else
							do MENSAJ1 with "EL ARTICULO EXISTE - No lo Puedo Repetir"
						endif
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

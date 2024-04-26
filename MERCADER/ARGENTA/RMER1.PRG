********************************************************************************
*-- Programa: rmer.prg
*-- Fecha   : 10/26/90 12:27pm
*-- Version : G. REINER
*-- Notas   : repite mercader¡as
********************************************************************************
STORE hora_ulp(PROGRAM()) to ULPR
IF CHEQSEG()
	do while .t.
		store NUL to respuesta
		IF !EMPTY(elimer("a Repetir",-1,1,.F.))
			=MOVEWIN(mmerr,mmerc,mmerr+mmerla,mmerc+mmeran,"WIN"," Repite el Art¡culo ")
			SELE mer
			REGISTRO=STR(RECNO())
			=LOCK() .OR. lok("mer")
			STORE 20 TO COL
			SCAT MEMVAR
			txt=mer.merca1
			unlo in mer
			DO mmer
			IF confirma("Repetir el Art¡culo",.T.,18,0)
				do while .t.
					store NUL to respuesta
					IF !EMPTY(elisue("del Producto",-1,1))
						clr=sue.codigo
						sele mer
						m.articulo=left(articulo,11)+clr
						set order to 1
						if !seek(left(m.articulo,13))
							UNLO IN MER
							=AGRABAR("MER")
							=LOCK() .OR. LOK("MER")
							repl merca1 with txt
							unlo in mer
							=IAUD(mer.merca)
						else
							do cartel2 with "EL ARTICULO EXISTE","","","No lo Puedo Repetir"
						endif
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

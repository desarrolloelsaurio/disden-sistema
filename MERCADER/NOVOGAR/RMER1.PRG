******************************************************************************
*-- Programa: rmer.prg
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
			do win0
			SELE mer
			REGISTRO=STR(RECNO())
			do lok with "mer"
			stor 20 TO COL
			SCAT MEMVAR
			txt=mer.merca1
			unlo in mer
			DO mmer
			IF confirma("Repetir el Art¡culo",.T.,18,nul)
				do while .t.
					stor nul to respuesta
					IF !EMPTY(elisue("del Producto",-1,1))
						clr=sue.codigo
						sele mer
						m.articulo=left(articulo,11)+clr
						set order to TAG ARTICULO
						if !seek(left(m.articulo,13))
							=MEN_LIN(GRABANDO)
							=FLOCK() .OR. flok("mer")
							appe blan
							gath memv
							repl merca1 with txt
							=REPUSE()
							unlo in mer
							=iaud(mer.merca)
						else
							do cartel2 with "EL ARTICULO EXISTE","","","No lo Puedo Repetir"
						endif
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
	=IAUDI()
ENDIF
=MEN_LIN(BOTOM)
RETURN

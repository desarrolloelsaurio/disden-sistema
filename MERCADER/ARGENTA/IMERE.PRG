********************************************************************************
*-- Programa: IMERE.PRG
*-- Fecha   : 12/13/91
*-- Version : V.LEEGSTRA
*-- Notas   : INGRESA MERCADERIA
********************************************************************************
STORE hora_ulp(PROGRAM()) to ULPR
IF CHEQSEG()
	define window win from imerr,imerc to imerr+imerla,imerc+imeran titl " Ingreso Mercader¡a " shad color sche 8
	sele mer
	stor " Ingreso Mercader¡a - " to me1
	stor 13 to col
	stor 0 to kok
	do whil .t.
		store 0 to nada
		store space(20) to nada1
		acti wind win
		clea
		scat memv blan
		m.exenta=.T.
		do mmer with .f.
		@ 1,col get nada1
		clear gets
		store 0 to respuesta
		m->rubro=iif(empty(elirub(" del Producto - [ESC] para salir ",1,col)),'',rub->codrub)
		if !empty(m->rubro)
			store rub->rubro to nada
			acti wind win
			@ 1,col get nada
			clear gets
			store 0 to respuesta
			m->variedad=iif(empty(elivar(" del Producto",2,col)),'',left(mix->texto2,2))
			if !empty(m->variedad)
				nada=mix->texto1
				acti wind win
				@ 2,col get nada
				clear gets
				store 0 to respuesta
				m->calidad=iif(empty(elical(" del Producto",3,col)),'',left(mix->texto2,2))
				if !empty(m->calidad)
					nada=mix->texto1
					acti wind win
					@ 3,col get nada
					clear get
					@ 4,col get m->palpopup picture '@!' ;
					mess 'Ingrese Descripci¢n de Mercader¡a'
					read
					if lastkey()#27 .and. !empty(m->palpopup)
						nada=m->rubro+m->variedad+m->calidad
						sele mer
						set order to tag merce
						set dele off
						acti scre
						if seek(nada)
							=men_lin('Mercader¡a '+ten)
							acti wind win
							do existe with ' MERCADERIA'
							=inkey(0)
							clea
						else
							sele mer
							set order to tag PALPOPUP
							if SEEK(M.PALPOPUP)
								=MEN_LIN('Descripci¢n Mercader¡a '+ten)
								acti wind win
								do existe with ' DESCRIPCION '
								=inkey(0)
								clea
							else
								if confirma(" los Datos Ingresados",.t.,18,0)
									=AGRABAR("MER")
									=iaud(M.PALPOPUP)
								endif
							endif
						endif
						set dele on
					endif
				else
					exit
				endif
			else
				exit
			endif
		else
			exit
		endif
	enddo
	=relewin('win')
else
	=iaudi()
endif
=men_lin(space(80))
return

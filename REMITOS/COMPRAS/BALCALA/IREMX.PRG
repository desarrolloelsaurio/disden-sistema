********************************************************************************
*-- Programa: IREMX.PRG
*-- Fecha   : 01-03-92 01:56am
*-- Version : G. REINER
*-- Notas   : RECEPCION REMITOS DE CASA CENTRAL
********************************************************************************
STORE PROGRAM() TO ULPR
IF CHEQSEG()
	=HORA_ULP()
	=MOVEWIN(3,3,22,75,'WIN'," Recepci¢n Mercader¡a de Proveedores ")
	STOR NUL TO tll,ctdd
	stor space(14) to numrem
	store 5 to ren
	store 1 to col
	sele mer
	@ 1,1 SAY 'N§ de REMITO' get numrem
	=lremx()
	read
	numrem=q_fac(numrem)
	if right(numrem,8)#'00000000' .and. lastkey()#27
		@ 1,1 SAY 'N§ de REMITO' get numrem
		clea gets
		do while .t.
			@ 17,1 SAY SPACE(40)
			STOR NUL TO respuesta,ctdd,sope
			if !empty(elimer("a Ingresar",ren,col))
				rtcl=mer->articulo
				acti wind win
				@ ren,col get rtcl
				clea gets
				dtll=left(mer->merca,19)
				@ ren,col+21 get dtll
				CLEA GETS
				IF MER.DISCRIM
					@ ren,col+43 get sope pict '999999.99' mess 'Peso Recibido'
				ENDIF
				@ ren,col+55 get ctdd pict '999999' mess 'Cantidad Recibida'
				read
				if !empty(ctdd) .and. lastkey()#27
					if confirma("Datos Ingresados",.F.,17,1)
						REGISTRO=STR(RECNO())
						=flock("mer") .or. fLOK("mer")
						REPL STOCK WITH STOCK+CTDD
						IF MER.DISCRIM
							REPL STOCKPES WITH STOCKPES+SOPE
						ENDIF
						SELE KAR
						SCAT MEMV BLAN
						FECHAOP=DATE()
						ARTICULO=rtcl
						OPK='02'
						DOCREF='RI'
						NRODOCREF=NUMREM
						DETALLE="Recepci¢n Mercader¡as Casa Central"
						IF MER.DISCRIM
							ENPESO=CTDD
							ENTRADA=SOPE
							SALIDA=NUL
						ELSE
							ENPESO=NUL
							ENTRADA=ctdd
							SALIDA=NUL
						ENDIF
						=agrabar("kar")
						REN=REN+1
						IF REN=16
							CLEA
							REN=4
							=LREMX()
						ENDIF
					endif
				endif
			else
				exit
			endif
		enddo
	endif
	=relewin("WIN")
ELSE
	=iaudi()
ENDIF
=MEN_LIN(BOTOM)
RETURN
function lremx
	=cuadro("4 2 16 nul 2 20 20 11 11")
	@ 3,1 say '   ARTICULO    '
	@ 3,22 say 'DENOMINACION COMER.'
	@ 3,46 say 'PESO'
	@ 3,56 say 'CANTIDAD'
RETURN .t.

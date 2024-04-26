********************************************************************************
*-- Programa: kpre.prg
*-- Fecha   : 01-12-92 04:29pm
*-- Version : G. REINER
*-- Notas   : CARGA PRECIOS DESDE DISKETTE
********************************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	DO cartel with 'Coloque el Diskette en el Drive A:','y Toque Cualquier Tecla para Continuar','o','[ESC] para Anular'
	if lastkey()#27
		store 'NO' to pcos,pcosr,porcs
		DEFINE WINDOW win FROM 10,10 TO 16,45 TITL " Informaci¢n a Actualizar " SHAD COLOR SCHE 8
		acti wind win
		@ 1,1 say "PRECIO DE COSTO " COLO SCHE 3
		@ 2,1 say "COSTO REAL      " COLO SCHE 3
		@ 3,1 say "PORCENTAJES     " COLO SCHE 3
		@ 1,21 GET PCOS PICTURE '@M NO,SI' MESS 'Actualiza el Precio de Costo Real ?'
		@ 2,21 GET pcosr PICTURE '@M NO,SI' MESS 'Actualiza el Precio de Costo de Venta ?'
		@ 3,21 GET porcs PICTURE '@M NO,SI' MESS 'Actualiza Porcentajes de Utilidad ?'
		READ
		acti scre
		if lastkey()#27
			if pcos='SI' .or. pcosr='SI' .or. porcs='SI'
				close data
				do opseg
				do opaud
				do opdoc
				do oppre
				sele 1
				use a:precios alias dela
				scan
					@ 24,23 say articulo colo sche 19
					sele pre
					if !seek(dela.articulo)
						appe blan
						sele dela
						scat memv
						sele pre
						gath memv
					else
						if pcos="SI"
							repl costo with dela.costo
						ENDIF
						IF pcosr="SI"
							repl costoreal with dela.costoreal
						ENDIF
						IF porcs="SI"
							repl PRECIO1  with dela.preCIO1
							repl PRECIO2  with dela.preCIO2
							repl PRECIO3  with dela.preCIO3
							repl PRECIO4  with dela.preCIO4
						ENDIF
					endif
					sele dela
				endscan
			endif
		endif
		=relewin("win")
	endif
ELSE
	=IAUDI()
ENDIF
=MEN_LIN(BOTOM)
RETURN

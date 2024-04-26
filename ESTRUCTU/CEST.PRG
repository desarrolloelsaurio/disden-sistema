**********************************************
*-- Programa: CEST.PRG
*-- Fecha   : 06/20/91
*-- Version : V.LEEGSTRA
*-- Notas   : CORRIGE ESTRUCTURA DE PRODUCTO
*********************************************
PARA ARTIC
*****  STORE RECNO("MER") TO ff
STORE HORA_ulp(program()) to ulpr
if cheqseg()
	=men_lin("Buscando Estructura - Espere por Favor")
*****  	SELE MER
*****  	GO FF
*****  	SCAT MEMVAR
	SELE est
*****  	GOTO TOP
	DO WHILE .T.
		=FLOCK("EST") .or. flok("EST")
		IF XSEEK(ARTIC,'EST','ARTICULO')
			rr1=6
			rr2=14
			cc1=7
			cc2=56
			COL=17
			col1=30
			kok=0
			sele mer
			scat memvar
*			=mmer1()
			IF confirma(" Producto para Corregir Estructura",.T.,rr2+1,0)
				DEFINE WINDOW win1 FROM rr1+4,cc1-5 TO rr2+4,cc2+21 TITL " Estructura de Fabricaci¢n " SHAD COLOR SCHE 8
				DEFINE WINDOW win2 FROM rr1+10,cc1+10 TO rr2+8,cc2+23 TITL " Detalle del Proceso Fabricaci¢n " SHAD COLOR SCHE 8
				SELE est
				SCAN FOR est.articulo=Artic
					ACTI WIND win1
					CLEA
					SCAT MEMV
					m.articulo=artic
					@ 1,1 SAY 'POSICION' COLO SCHE 3
					@ 2,1 SAY 'PROCESO DE FABRICACION'  COLO SCHE 3
					@ 3,1 SAY 'TIEMPO ESTIMADO EN MIN.' COLO SCHE 3
					@ 4,1 SAY 'MONTO ESTIMADO P/UNID.' COLO SCHE 3
					@ 5,1 SAY 'ESTADO DEL PRODUCTO' COLO SCHE 3
					@ 1,col1 GET m.posicion PICT '99999'
					=XSEEK(est.prc,'prc',"PRCCOD")
					@ 2,col1 GET prc.procfab
					@ 3,col1 GET m.test PICT '99999999.99'
					@ 4,col1 GET m.MONTO PICT '99999999.99'
					@ 5,col1  get m.condicion PICT '@!'
					MODI MEMO detalle NOEDIT NOWA WIND win2
					ACTI WIND win1
					CLEAR GETS
					@ 1,col1 GET  m.posicion PICT "99999" MESS "[] Para el sig. Proceso - [ESC] para Men£"
					READ
					IF LASTKEY()#24
						IF LASTKEY()#27
							=XSEEK(est.prc,'PRC','PRCCOD')
							STORE prc.procfab TO nada
							@ 2,col1 GET nada MESS ten+" Proceso"
							READ
							IF updated()
								STORE NUL TO respuesta
								IF !EMPTY(eliprc(" del Producto",2,col1))
									m.prc=PRC.PRCCOD
									ACTI WIND win1
									nada=prc.procfab
									@ 2,col1 GET nada
									CLEAR GETS
								ENDIF
							ENDIF
							@ 3,col1 GET m.test PICT '99999999.99' MESS 'Tiempo estimado del Proceso por Unidad en Minutos'
							@ 4,col1 GET m.MONTO PICT '99999999.99' MESS 'Costo de Fabricaci¢n estimado por Unidad'
							@ 5,col1 GET m.CONDICION PICT '@!';
							MESS 'Estado del Producto Final al Ingresar en el Proceso'
							=MEN_LIN(BOTOM)
							ACTI WIND win1
							READ
							IF confirma(" Estructura",.T.,rr2+4,0)
								SELE est
								GATH MEMV
								ACTI SCRE
								=MEN_LIN("[ESC] para Salir - [TAB] para Grabar")
								CLOSE MEMO detalle
								ON KEY LABEL TAB KEYBOARD CHR(23)
								MODI MEMO detalle WINDOW win2
								ON KEY LABEL TAB
								DEAC WIND win2
								CLOSE MEMO detalle
								=MEN_LIN(BOTOM)
								=repuse()
								=IAUD(artic)
							ENDIF
						ELSE
							RELE WIND win1
							EXIT
						ENDIF
					ENDIF
					SELE seg
					DEAC WIND win1,win2
				ENDSCAN
				=RELEWIN("win")
				=RELEWIN("win2")
				CLOSE MEMO detalle
				EXIT
			ELSE
				=RELEWIN("win")
				EXIT
			ENDIF
		ELSE
			EXIT
		ENDIF
	ENDDO
	UNLO IN est
ELSE
	=iaudi()
ENDIF
ACTI SCREE
RETURN MEN_LIN(BOTOM)

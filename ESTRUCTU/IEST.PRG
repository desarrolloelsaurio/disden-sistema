*********************************************
*-- Programa: IEST.PRG
*-- Fecha   : 06/14/91 06:55pm
*-- Version : G. REINER
*-- Notas   : INGRESA ESTRUCTURA DE PRODUCTO
*-- Modificaci¢n GOYO 07-31-92 04:01pm
*********************************************
PARA ARTIC
***STORE RECNO() TO ff
***SCAT MEMVAR
STORE HORA_ULP(PROGRAM()) TO ULPR
if cheqseg()
	=men_lin("Buscando Estructura - Espere por Favor")
	SELE EST
	SET ORDER TO TAG ARTICULO
	IF SEEK(ARTIC)
		SCAN WHILE est.articulo=artic
			M.POSC=est.posicion
		ENDSCAN
		M.POSC=M.POSC+10
	ELSE
		STORE 10 TO M.POSC
	ENDIF
	rr1=6
	rr2=14
	cc1=7
	cc2=56
	COL=17
	col1=30
***	=mmer1()
	IF confirma(" Producto para Ingresar Estructura",.T.,rr2+1,0)
		DEFINE WINDOW win1 FROM rr1+4,cc1-5 TO rr2+4,cc2+21 TITL " Estructura de Fabricaci¢n " SHAD COLOR SCHE 8
		DEFINE WINDOW LEGAJO FROM rr1+8,cc1+10 TO rr2+6,cc2+23 TITL " Detalle del Proceso Fabricaci¢n " SHAD COLOR SCHE 8
		DO WHILE .T.
			ACTI WIND win1
			CLEA
			SELE est
			SCAT MEMV BLAN
			m.articulo=artic
			m.posicion=m.POSC
			@ 1,1 SAY 'POSICION' COLO SCHE 3
			@ 2,1 SAY 'PROCESO DE FABRICACION' COLO SCHE 3
			@ 3,1 SAY 'TIEMPO ESTIMADO EN MIN.' COLO SCHE 3
			@ 4,1 SAY 'MONTO ESTIMADO P/UNID.' COLO SCHE 3
			@ 5,1 SAY 'ESTADO DEL PRODUCTO' COLO SCHE 3
			@ 1,col1 GET m.posicion PICT '99999'
			ACTI SCRE
			@ 24,0 SAY PADC("[ESC] para Men£",80)
			ACTI WIND win1
			CLEAR GETS
			STORE NUL TO respuesta
			IF !EMPTY(eliprc(" del Producto",2,col1))
				M.PRC=PRC.PRCCOD
				ACTI WIND WIN1
				NADA=PRC.PROCFAB
				@ 2,COL1 GET NADA
				CLEAR GETS
				@ 3,col1 GET m.test PICT '99999999.99' MESS 'Tiempo estimado del Proceso por Unidad en Minutos'
				@ 4,col1 GET m.MONTO PICT '9999999999.99' MESS 'Costo estimado del Proceso por Unidad'
				@ 5,col1 GET m.CONDICION PICT '@!' ;
					MESS 'Estado del Producto Final al Ingresar en el Proceso'
				READ
				IF confirma(" Estructura",.T.,rr2+3,0)
					SELE est
					ACTI SCRE
					APPE BLAN
					=MLEGA("[TAB] para Grabar - [ESC] para Anular",;
					ALLTRIM(MER.MERCA)+' -> '+ALLTRIM(MER.ARTICULO)+'-'+ALLTRIM(STR(M.POSC)),;
					.T.,.F.,"DETALLE")
					GATH MEMV
					=REPUSE()
					=IAUD(ALLTRIM(MER.ARTICULO)+'-'+ALLTRIM(STR(M.POSC)))
					STORE M.POSC+10 TO M.POSC
				ENDIF
			ELSE
				=RELEWIN("WIN1")
				EXIT
			ENDIF
		ENDDO
	ENDIF
	=RELEWIN("win")
ELSE
	=IAUDI()
ENDIF
UNLO IN EST
RETURN MEN_LIN(BOTOM)

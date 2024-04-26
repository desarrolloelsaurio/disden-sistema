********************************************************************************
*-- Programa: LESTP1.PRG
*-- Fecha   : 06/20/91
*-- Version : G. REINER
*-- Notas   : LISTADO DE ARTICULOS CON SUS PROCESOS DE FABRIC., POR PANTALLA
********************************************************************************
PARAMETER control
STORE HORA_ulp(program()) to ulpr
if cheqseg()
	IF control
		=WIN0()
	ELSE
		DEFI WIND win3 FROM 0,0 TO 24,79 NONE COLO SCHE 8
		ACTI WIND win3
	ENDIF
	pag=1
	=cabpan()
	@ 0,47 SAY padc(iif(control,ulpr,"IFAB"),10) COLOR I
	STORE nul TO casos
	acla ='|Nro.PROCESO| PROCESO DE FABRICACION| TIEMPO | TIEMPO |  FECHA | USUARIO  |'
	acla1='|           |                       |ESTIMADO|  REAL  | INGRESO|          |'
	lns=REPL("=",LEN(acla))
	_WRAP=.T.
	_ALIGNMENT='CENTER'
	? tt
	_WRAP=.F.
	? lns
	? acla
	? acla1
	? lns
	SELE est
	SCAN FOR &fisc
		IF ROW()=21
			? LEFT(articulo,LEN(articulo)-4)
			?? '\\\\'
			IF INKEY(0)=27
				EXIT
			ENDIF
			CLEA
			STOR pag+1 TO pag
			do cabpan
			@ 0,47 SAY padc(iif(control,ulpr,"IFAB"),10) COLOR I
			_WRAP=.T.
			? tt
			_WRAP=.F.
			? lns
			? acla
			? acla1
			? lns
		ENDIF
        =lest1()
	ENDSCAN
	? lns
	_WRAP=.F.
	IF control
		? "Cantidad de Procesos:"
		?? STR(casos,10)
		=INKEY(0,'hm')
		DEAC WIND win
	ELSE
		STORE IIF(casos=0,.F.,.T.) TO nada
	ENDIF
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)

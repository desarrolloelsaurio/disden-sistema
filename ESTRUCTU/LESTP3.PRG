********************************************************************************
*-- Programa: LESTP3.PRG
*-- Fecha   : 06/20/91
*-- Version : G. REINER
*-- Notas   : LISTADO DE ARTICULOS CON SUS PROCESOS DE FABRIC., POR PANTALLA
********************************************************************************
STORE HORA_ulp(program()) to ulpr
if cheqseg()
	=WIN0()
	PAG=1
	=CABPAN()
	STORE 0 TO casos
	acla ='Nro.PROCESO|'+PADC('PROCESO DE FABRICACION',25)+PAIP+padc("CONDICION",40)
	LNS=REPL("=",LEN(acla))
	TT='Listado de Despiece - Condiciones de Llegada del Producto'
	=tit_lns(1)
	SELE EST
	SCAN FOR &fisc
		IF ROW()=21
			IF !fin_lns(1,nul)
				EXIT
			ENDIF
			CLEA
			STOR pag+1 TO pag
			=CABPAN()
			=TIT_LNS(2)
		ENDIF
		? PADC(STR(POSICION),11)
		?? PAIP
		=xseek(est.prc,'prc','prccod')
		?? LEFT(prc.procfab,25)
		?? PAIP
		?? CONDICION
		STORE CASOS+1 TO CASOS
	ENDSCAN
	=fin_lns(2,casos)
	=RELEWIN("WIN")
	=iaud(fisc)
ELSE
	=iaudi()
ENDIF
RETURN MEN_LIN(BOTOM)

********************************************************************************
*-- Programa: LESTI1.PRG
*-- Fecha   : 06/10/91 12:44pmm
*-- Version : G. REINER
*-- Notas   : IMPRESION DE PROCESOS DE FABRICACION POR DE UN PRODUCTO
*-- Modificaci¢n GOYO 06-26-92 02:09am
********************************************************************************
STORE HORA_ulp(program()) to ulpr
if cheqseg()
	sele PRC
	=men_lin(IMPRIMIENDO)
	STORE 0 TO casos
	STORE '|POSIC|'+padc("PROC FABRICACION",30)+PAIP+PADC("CONDICION",40)+PAIP+PADC('COSTO ESTIMADO',XACDIGI)+'|TIEMPO ESTI|TIEMPO REAL|FECHA IN|  USUARIO |' TO ACLA
	STORE REPL("=",LEN(acla)) TO lns
	STORE LEN(ACLA) TO LARGO
	STORE LEFT('Listado de Procesos de Fabricaci¢n de '+alltrim(mer.merca)+' / Art:'+alltrim(mer.articulo),132) TO TT
	STORE MIN(XACANCHO,XACHOJA) TO LARGOIM
	=CABPRI()
	_PCOPIES=1
	PRINTJOB
	=CABPRI1()
	=tit_lns(3)
	SELE EST
	SCAN FOR EST.ARTICULO=MER.ARTICULO
		IF _PLINENO>63
			=fin_lns(3,nul)
			EJECT PAGE
			=CABPRI1()
			=TIT_LNS(4)
		ENDI
		=LEST1()
	ENDSCAN
	=FIN_LNS(4,NUL)
	?
	ENDP
	=finimp()
	=IAUD(MER.ARTICULO)
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)

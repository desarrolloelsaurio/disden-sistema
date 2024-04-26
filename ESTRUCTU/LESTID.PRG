********************************************************************************
*-- Programa: LESTId.PRG
*-- Fecha   :06/10/91 12:44pmm
*-- Version : G. REINER
*-- Notas   : IMPRESION DE detalle de PROCESOS DE FABRICACION DE UN PRODUCTO
********************************************************************************
STORE HORA_ulp(program()) to ulpr
if cheqseg()
	SELE prc
	=men_lin(IMPRIMIENDO)
	STORE NUL TO casos
	STORE MIN(xacancho,xachoja) TO largoim
	STORE '|POSIC|'+PADC("PROCESO DE FABRICACION",30)+PAIP TO acla
	lg=IIF(largoim=80,pds[1],pds[2])
	largor=lg-LEN(acla)-3
	acla=acla+PADC("DESCRIPCION",largor)+PAIP
	STORE REPL("=",LEN(acla)) TO lns
	SET MEMO TO largor-1
	STORE LEN(acla) TO largo
	STORE 'Detalle de Procesos de Fabricaci¢n de '+ALLTRIM(mer.merca)+' Art:'+ALLTRIM(mer.articulo) TO tt
	STORE MIN(xacancho,xachoja) TO largoim
	=CABPRI()
	_PCOPIES=1
	PRINTJOB
	=CABPRI1()
	=tit_lns(3)
	SELE est
	SCAN FOR est.articulo=mer.articulo
		IF _PLINENO>63
			=fin_lns(3,nul)
			EJECT PAGE
			=CABPRI1()
			=tit_lns(4)
		ENDI
		? PAIP
		?? STR(est.posicion,5)
		?? PAIP
		=xseek(est.prc,'prc','prccod')
		?? prc.procfab
		?? PAIP
		IF !EMPTY(detalle)
			FOR A=1 TO MEMLINES(detalle)
				lag=LEN(MLINE(detalle,A))
				IF lag#0
					IF A#1
						? PAIP
						?? SPACE(5)
						?? PAIP
						?? SPACE(30)
						?? PAIP
					ENDIF
					?? PADR(MLINE(detalle,A),largor)
					?? PAIP
				ENDIF
			NEXT
		ELSE
			?? SPACE(largor)
			?? PAIP
		ENDIF
		? lns
		STORE casos+1 TO casos
	ENDSCAN
	=FIN_LNS(4,CASOS)
	ENDP
	=FINIMP()
	=IAUD(MER.ARTICULO)
ELSE
	=iaudi()
ENDIF
SET MEMO TO 50
RETURN MEN_LIN(BOTOM)

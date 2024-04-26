********************************************************************************
*-- Programa: LCCHI2.PRG
*-- Fecha   : 09/19/91
*-- Version : V.LEEGSTRA
*-- Notas   : IMPRESION DE CHEQUES  Y/O DOCUMENTOS NO PAGADOS
********************************************************************************
ulpr=hora_ulp(program())
IF cheqseg()
	=HORA_ULP()
	mxrn=66
	stor ('|TIPO|'+PADC("N§Cheque/Docum.",15)+PAIP+PADC("BANCO",20)+PAIP+PADC("MONTO en "+ALLTRIM(xadols),14)+"| MONEDA|  FECHA |"+PADC("CLIENTE",15)+"| FECHA  |  USUARIO |") TO acla
	stor REPL("=",LEN(acla)) TO lns
	stor "Listado de Cheques/Documentos NO acreditados" TO tt
	STOR NUL TO totche,natotmon
	stor LEN(acla) TO largo
	stor MIN(xacancho,xachoja) TO largoim
	@ 24,nul SAY IMPRIMIENDO COLO SCHE 19
	IF (largoim=80 .AND. largo>132) .OR. (largoim=132 .AND. largo>233)
		A=left(sincosas(janname),8)+'.TXT'
		ACTI SCRE
		=men_lin("Imprimiendo Listado en Archivo "+ALLTRIM(A))
		SET PRINTER TO FILE &a
		mxrn=iIF(largoim>80,63,53)
	ENDIF
	=CABPRI()
	_PCOPIES=1
	PRINTJOB
	SELE cch
	GO TOP
	SCAN                                           &&  for eval(fisc)
		IF _PLINENO>mxrn
			? LEFT(lns,largo-3)
			?? '                                       ///'
			EJECT PAGE
			_RMARGIN=80
			_WRAP=.F.
			?
		ENDI
		IF EMPTY(cch.fechaac)
			? PAIP
			?? padc(cch.tipo,4)
			?? PAIP
			?? cch.nroche
			?? PAIP
			?? cch.banco
			?? PAIP
			?? STR(cch.equivale,14,2)
			stor natotmon+cch.equivale TO natotmon
			?? PAIP
			?? IIF (cch.moneda=LEFT(xadols,1),SUBSTR(xadols,1,7),SUBSTR(xauss,1,7))
			?? PAIP
			?? cch.fechade
			?? PAIP
			SELE PER
			SET ORDER TO 2
			IF SEEK(cch.codcli)
				?? SUBSTR(PER.cliente,1,15)
			ELSE
				?? PADL("NO EXISTE",15)
			ENDIF
			SELE cch
			?? PAIP
			?? cch.fecha
			?? PAIP
			?? cch.usuario
			?? PAIP
			totche=totche+1
		ENDIF
	ENDSCAN
	? lns
	?
	?
	? SPACE(31)+"Monto Total:"+SPACE(5)+ALLTRIM(STR(natotmon,14,2))
	?
	?
	? "Total de cheques/documentos por acreditar: "+ALLTRIM(STR(totche))
	_WRAP=.F.
	?
	EJECT PAGE
	?
	ENDP
	=FINIMP()
	do iaud with 'LISTADO DE CHEQUES NO ACREDITADOS POR IMPRESORA'
ELSE
	=iaudi()
ENDIF
=MEN_LIN(BOTOM)
RETURN
*: EOF: LCCHI2.PRG

*******************************************************************************
*-- Programa: LcajPR.PRG
*-- Fecha   : 05-13-92 04:41pm
*-- Version : G. REINER
*-- Notas   : LISTADO DE RESUMEN DE CUENTA CORRIENTE
********************************************************************************
#DEFINE PAIP   "|"                               && PAIP

STORE HORA_ulp(program()) to ulpr
IF CHEQSEG()
	=WORKING()
	NADA=GENTMP()
	SELE CAJ
	IF ".T."=FISC
		INDE ON CODCLI TO (NADA) COMP
	ELSE
		INDE ON CODCLI TO (NADA) FOR EVAL(FISC) COMP
	ENDIF
	ACLA=PAIP+PADC("CLIENTE",30)+PAIP+PADC("DEBE",13)+PAIP+PADC("HABER",13)+PAIP+PADC("SALDO",13)+PAIP
	LNS=REPL("=",LEN(ACLA))
	TT='Listado de Saldos'+ttque
	=UNWORK()
	=WIN0()
	PAG=1
	=CABPAN()
	=TIT_LNS(1)
	SELE PER
	STORE NUL TO GDEBE,GHABER
	PICU='99,999,999.99'
	SCAN FOR XSEEK(PER.CODCLI,'CAJ','CODCLI')
		IF ROW()=21
			IF TLCAJPR1("SUBTOTAL")=27
				EXIT
			ENDIF
			CLEA
			STOR PAG+1 TO PAG
			=CABPAN()
			=TIT_LNS(2)
		ENDIF
		STORE NUL TO DEBE,HABER
		=Q_DEU(PER.CODCLI)
		IF !EMPTY(DEBE+HABER)
			? PAIP
			?? PER.CLIENTE
			?? PAIP
			?? DEBE PICT PICU
			GDEBE=GDEBE+DEBE
			?? PAIP
			?? HABER PICT PICU
			GHABER=GHABER+HABER
			?? PAIP
			?? DEBE-HABER PICT PICU
			?? PAIP
		ENDIF
	ENDSCAN
	IF LAST()#27
		=TLCAJPR1("TOTAL")
	ENDIF
	=RELEWIN("WIN")
ELSE
	=IAUDI()
ENDIF
SELE CAJ
USE
RETURN MEN_LIN(BOTOM)

FUNCTION TLCAJPR1
	PARAMETER COSA
	PRIVATE COSA
	? LNS
	? PAIP
	?? PADR(COSA,30)
	?? PAIP
	?? GDEBE PICT PICU
	?? PAIP
	?? GHABER PICT PICU
	?? PAIP
	?? GDEBE-GHABER PICT PICU
	?? PAIP
RETURN INKEY(NUL)

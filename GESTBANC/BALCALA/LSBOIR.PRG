*******************************************************************************
*-- Programa: LSBOPR.PRG
*-- Fecha   : 05-13-92 04:41pm
*-- Version : G. REINER
*-- Notas   : LISTADO DE RESUMEN DE CUENTA CORRIENTE
********************************************************************************
SELE seg
ulpr=HORA_ulp(program())
SEEK ulpr
IF coefseg=1 .OR. (coefseg<=cseg .AND. sistseg=sistema)
	=working()
	NADA=GENTMP()
	SELE CAJ
	IF ".T."=FISC
		INDE ON Caja TO (NADA) COMP
	ELSE
		INDE ON Caja TO (NADA) FOR eval(FISC) COMP
	ENDIF
	ACLA=PAIP+PADC("CUENTA",30)+PAIP+PADC("DEBE",13)+PAIP+PADC("HABER",13)+PAIP+PADC("SALDO",13)+PAIP
	LNS=REPL("=",LEN(ACLA))
	TT='Listado de Saldos'+ttque
	=unwork()
	STORE NUL TO CASOS
	=CABPRI()
	_PCOPIES=1
	PRINTJOB
	=CABPRI1()
	=TIT_LNS(3)
	=OPBAN()
	STORE NUL TO GDEBE,GHABER
	PICU='99,999,999.99'
	SCAN FOR XSEEK(STR(MIX.NU1,2),'CAJ','CAJA')
		IF ROW()=21
			=TLSBOIR1("SUBTOTAL")
			EJECT PAGE
			=CABPRI1()
			=tit_lns(4)
		ENDIF
		STORE NUL TO DEBE,HABER
		=Q_SALBAN(STR(MIX.NU1,2))
		if !empty(debe+haber)
			? PAIP
			?? PADR(ALLTRIM(MIX.TEXTO1)+' N§'+ALLTRIM(MIX.TEXTO2),30)
			?? PAIP
			?? DEBE PICT PICU
			GDEBE=GDEBE+DEBE
			?? PAIP
			?? HABER PICT PICU
			GHABER=GHABER+HABER
			?? PAIP
			?? HABER-DEBE PICT PICU
			?? PAIP
		endif
	ENDSCAN
	ENDP
	=TLSBOIR1("TOTAL")
	=finimp()
	=opcaj(JANNRO,.F.,.T.)
	=iaud((FISC))
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)

FUNCTION TLSBOIR1
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
RETURN .T.

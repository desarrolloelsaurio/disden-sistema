**********************************
*-- Programa: LTALI.PRG
*-- Fecha   : 06-28-92 05:29pm
*-- Version : G. REINER
*-- Notas   : LISTADO DE TALLERES
**********************************
ulpr=HORA_ULP(program())
IF CHEQSEG()
	SELE TAL
	SET ORDER TO TAG IIF(TYPE("ordtal")#'L' .OR. ordtal,'TALCOD','TALLERES')
	STOR NUL TO CASOS
	ACLA=HAZ_ACLA()
	LINEA=REPL("=",LEN(ACLA))
	TT='LISTADO DE TALLERES'+CHR(13)+CHR(10)+TT
	=CABPRI()
	_PCOPIES=1
	PRINTJOB
	=cabpri1()
	=TIT_LIN(3)
	SCAN FOR &FISC
		IF _PLINENO>63
			=FIN_LIN(3,NUL)
			=cabpri1()
			=TIT_LIN(4)
		ENDI
		=LTAL0()
	ENDSCAN
	=FIN_LIN(4,CASOS)
	ENDP
	=FINIMP()
	=iaud((FISC))
ELSE
	=iaudI()
ENDIF
RETURN MEN_LIN(BOTOM)

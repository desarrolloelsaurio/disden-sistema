************************************************
*-- Programa: Ltalp.PRG
*-- Fecha   : 06/02/91 09:59am
*-- Version : G. REINER
*-- Notas   : IMPRESION DE talleres POR pantalla
************************************************
ULPR=HORA_ULP(PROGRAM())
IF CHEQSEG()
	SELE TAL
	SET ORDER TO TAG IIF(TYPE("ordtal")#'L' .OR. ordtal,'TALCOD','TALLERES')
	=WIN0()
	PAG=1
	=CABPAN()
	STOR NUL TO CASOS
	ACLA=HAZ_ACLA()
	LINEA=REPL("=",LEN(ACLA))
	TT='Listado de Talleres'+chr(13)+chr(10)+TT
	=TIT_LIN(1)
	SCAN FOR &FISC
		IF ROW()>21
			IF !FIN_LIN(1,NUL)
				EXIT
			ENDIF
			CLEA
			STOR pag+1 TO pag
			=cabpan()
			=TIT_LIN(2)
		ENDIF
		=LTAL0()
	ENDSCAN
	=FIN_LIN(2,CASOS)
	=RELEWIN("win")
ELSE
	=iaudI()
ENDIF
RETURN MEN_LIN(BOTOM)

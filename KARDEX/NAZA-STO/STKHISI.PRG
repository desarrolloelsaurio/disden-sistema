* 浜様様様様様様様様様様様様様様様様様様様様様様�
* � PROCEDIMIENTO : STKHISI.PRG                 �
* � COMENTARIO    : LISTADO DE STOCK HISTORICO  �
* 麺様様様様様様様様様様様様様様様様様様様様様様�
* � AUTOR      : GOYO REINER                    �
* � FECHA      : 11-01-93                       �
* � HORA       : 01:50:15pm                     �
* � COPYRIGHT  : 1993 by GREGORIO REINER        �
* 藩様様様様様様様様様様様様様様様様様様様様様様�
#DEFINE FOUR   4                                 && FOUR
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("�",78)                 && BOTOM
#DEFINE PAIP   "|"                               && PAIP

STORE HORA_ULP(program()) TO ULPR
IF CHEQSEG()
	STOR NUL TO CASOS
	LINEA=REPL("=",LEN(ACLA))
	=CABPRI()
	_PCOPIES=1
	PRINTJOB
	=CABPRI1()
	=TIT_LIN(3)
	SELE TMP
	GO TOP
	COD_CTRL=ELCOD()
	TEX_CTRL=ELTEX()
	MON_CTRL=ELMON()
	UNI_CTRL=ELUNI()
	STORE NUL TO M.SAL,M.ENT,M.MONTOTO
	SCAN
		IF COD_CTRL#ELCOD()
			=STKHIS0()
			COD_CTRL=ELCOD()
			TEX_CTRL=ELTEX()
			MON_CTRL=ELMON()
			UNI_CTRL=ELUNI()
			STORE NUL TO M.SAL,M.ENT
		ELSE
			M.SAL=M.SAL+TMP.SALIDA
			M.ENT=M.ENT+TMP.ENTRADA
		ENDIF
		IF _PLINENO>63
			=FIN_LIN(3,NUL,;
				PARSE("| SUBTOTAL",STR(M.MONTOTO,XACDIGI+2,2)+PAIP,LEN(ACLA)))
			=CABPRI1()
			=TIT_LIN(FOUR)
		ENDI
	ENDSCAN
	=STKHIS0()
	=FIN_LIN(FOUR,CASOS,;
		PARSE("| TOTAL",STR(M.MONTOTO,XACDIGI+2,2)+PAIP,LEN(ACLA)))
	ENDP
	=FINIMP()
	=IAUD("")
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)

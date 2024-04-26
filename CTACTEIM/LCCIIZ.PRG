* ษอออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LCCIIZ.PRG            บ
* บ COMENTARIO    :                       บ
* ฬอออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER              บ
* บ FECHA      : 12-31-93                 บ
* บ HORA       : 04:08:48pm               บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER  บ
* ศอออออออออออออออออออออออออออออออออออออออผ
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("ฐ",78)                 && BOTOM
#DEFINE PAIP   "|"                               && PAIP

STOR HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	DIME TTL[CANT_MAX],CTRL[CANT_MAX]
	STORE .F. TO HAY,ACLA,LINEA,TT
	=LCCIPZ0()
	=CABPRI()
	_PCOPIES=1
	STORE NUL TO CASOS
	PRINTJOB
	=CABPRI1()
	=TIT_LIN(3)
	SCAN FOR &FISC
		IF _PLINENO>63
			=IIF(HAY,FIN_LIN(3,NUL,FIN_SUM('SUBTOTAL',@TTL)),FIN_LIN(3,NUL))
		ENDIF
		=LCCIPZ1()
	ENDSCAN
	=IIF(HAY,FIN_LIN(4,CASOS,FIN_SUM('SUBTOTAL',@TTL)),FIN_LIN(4,CASOS))
	ENDP
	=FINIMP()
	=REOPCCI()
	=IAUD(FISC)
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)

FUNCTION TLCCIPZ
	PARAMETER COSA,COSA1,COSA2
	PRIVATE COSA,COSA1,COSA2
	IF !HAY
		RETURN FIN_LIN(COSA,COSA1)
	ELSE
		VEZ=1
		? LINEA
		? PAIP
		FOR A=1 TO CANT_MAX
			IF VARIABLE[A]
				IF VEZ=1
					VEZ=2
					?? PADR(COSA2,TEXTO[A,2])
					?? PAIP
				ELSE
					IF CTRL[A]
						IF A=9
							?? STR(TTL[7],XACDIGI,2)
							?? PAIP
							?? STR(TTL[8],XACDIGI,2)
							?? PAIP
							?? STR(TTL[9],XACDIGI,2)
							?? PAIP
						ELSE
							?? STR(TTL[A],XACDIGI,2)
							?? PAIP
						ENDIF
					ELSE
						?? SPACE(TEXTO[A,2])
						?? PAIP
					ENDIF
				ENDIF
			ENDIF
		ENDF
		=INKEY(NUL,'HM')
	ENDIF
RETURN LAST()#27

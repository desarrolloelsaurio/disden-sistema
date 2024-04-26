* ษอออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LCONVENP.PRG                        บ
* บ COMENTARIO    : LISTADO DE VENCIMIENTO DE CONTRATOS บ
* ฬอออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                            บ
* บ FECHA      : 12-09-93                               บ
* บ HORA       : 09:09:22pm                             บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                บ
* ศอออออออออออออออออออออออออออออออออออออออออออออออออออออผ
FUNCTION LCONVENP
	ULPR=PROGRAM()
	IF CHEQSEG()
		=WIN0()
		PAG=1
		=CABPAN()
		=TIT_LIN(1)
		SELE ALQ 
		SCAN
			IF ROW()>21
				IF !FIN_LIN(1,NUL)
					EXIT
				ENDIF
				CLEA
				STOR PAG+1 TO PAG
				=CABPAN()
				=TIT_LIN(2)
			ENDIF
			=LCONVEN0()
		ENDSCAN
		=FIN_LIN(2,CASOS)
		=RELEWIN("win")
		=IAUD("")
	ELSE
		=IAUDI()
	ENDIF
RETURN

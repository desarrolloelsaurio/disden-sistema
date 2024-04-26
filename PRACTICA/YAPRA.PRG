* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : YAPRA.PRG                                                บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 10-27-93                                                    บ
* บ HORA       : 06:44:43pm                                                  บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
FUNCTION YAPRA
	PARAMETER Y_TIT,BLANCO,Y_WIN
	IF !EMPTY(Y_TIT)
		WAIT Y_TIT+"EXISTE" WIND NOWA
	ENDIF
	SELE PRA
	IF BLANCO
		SCAT MEMO MEMV BLAN
		SCAT MEMO TO RESPALDO BLAN
		STORE .T. TO INGRESO
		IF XPRA .AND. ;
           !EMPTY(I_ALIAS)
			SCAT MEMO MEMV BLAN
			SCAT MEMO TO RESPALDO BLAN
		ENDIF
	ELSE
		FF=RECNO("PRA")
		REGISTRO=STR(FF)
		UNLO IN PRA
		=LOCK("PRA") .OR. LOK("PRA")
		SCAT MEMO MEMV
		SCAT MEMO TO RESPALDO
		STORE .F. TO INGRESO
		STORE M.CODPRA TO M.CODDI
		IF XPRA .AND. ;
           !EMPTY(I_ALIAS)
			=YAPRX(.F.,BLANCO)
			STORE M.CODDI TO M.CODPRA
		ENDIF
	ENDIF
	=SGET("PRA") .AND. ;
	iif(XPRA,SGET("XPRA",.F.,.T.),.T.) 
	IF !EMPTY(Y_TIT)
		WAIT CLEA
	ENDIF
RETURN .T.

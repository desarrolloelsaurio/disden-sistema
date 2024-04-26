* ษออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : YAINM.PRG              บ
* ฬออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER               บ
* บ FECHA      : 10-27-93                  บ
* บ HORA       : 06:44:43pm                บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER   บ
* ศออออออออออออออออออออออออออออออออออออออออผ
FUNCTION YAINM
	PARAMETER Y_TIT,BLANCO,Y_WIN
	IF !EMPTY(Y_TIT)
		WAIT Y_TIT+"EXISTE" WIND NOWA
	ENDIF
	SELE INM
	IF BLANCO
		SCAT MEMO MEMV BLAN
		SCAT MEMO TO RESPALDO BLAN
		STORE .T. TO INGRESO
		IF XALQ
			SCAT MEMO MEMV BLAN
			SCAT MEMO TO RESPALDO BLAN
		ENDIF
	ELSE
		FF=RECNO("INM")
		REGISTRO=STR(FF)
		UNLO IN INM
		=LOCK("INM") .OR. LOK("INM")
		SCAT MEMO MEMV
		SCAT MEMO TO RESPALDO
		STORE .F. TO INGRESO
		STORE M.CODINM TO M.CODDI
		IF XALQ
			=YAALQ(.F.,BLANCO)
			STORE M.CODDI TO M.CODINM
		ENDIF
	ENDIF
	=SGET("INM") .AND. ;
		IIF(XINM,SGET("XINM",.F.,!XXINM),.T.) .and. ;
		iif(XXINM,SGET("XXINM",.F.,!XXXINM),.T.) .and. ;
		iif(XXXINM,SGET("XXXINM",.F.,.T.),.T.) .and. ;
		iif(XXXXINM,SGET("XXXXINM",.F.,.T.),.T.)
RETURN IIF(EMPTY(Y_TIT),.T.,WCL())

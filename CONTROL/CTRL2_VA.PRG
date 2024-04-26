* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : CTRL2_VA.PRG                                             บ
* บ COMENTARIO    : EVALUA EL RESULTADO DE LA PANTALLA DE CONTROL            บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 10-21-93                                                    บ
* บ HORA       : 02:19:14am                                                  บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
*WAIT STR(_CUROBJ) WIND NOWA
=SGET("CONTROL2")
DO CASE
CASE m.act2 = 1
	M.VENTAN=WLAST()
	=CTRL2_CA(.T.)
	_CUROBJ=1
RETURN .T.
CASE m.act2 = 2
	M.VENTAN=WLAST()
	STORE .T. TO M.CAMBIO
	STORE .F. TO M.INGRESO
	IF TYPE("ESPROPIO")#"U" .AND. !ESPROPIO
		_CUROBJ=2      
	ELSE
		_CUROBJ=1
	ENDIF
RETURN .T.
CASE m.act2 = 3
	IF TYPE("M.G_ALIAS")="C"
		SELE (M.G_ALIAS)
	ENDIF
	IF BOF()
		GO BOTT
	ELSE
		SKIP -1
		IF BOF()
			GO BOTT
		ENDIF
	ENDIF
	=CTRL2_CA()
CASE m.act2 = 4
	IF TYPE("M.G_ALIAS")="C"
		SELE (M.G_ALIAS)
	ENDIF
	IF EOF()
		GO TOP
	ELSE
		SKIP
		IF EOF()
			GO TOP
		ENDIF
	ENDIF
	=CTRL2_CA()
CASE m.act2 = 5
	=CTRL2_EL()
CASE m.act2 = 6
	=CTRL2_PA()
CASE m.act2 = 7
	=CTRL2_LI()
CASE m.act2 = 8
	=CTRL2_BO()
CASE m.act2 = 9
	=CTRL2_RE()
CASE m.act2 = 10
	DO ORDMER.SPR
	=CTRL2_OR()
CASE m.act2 = 11
	=CTRL2_IN()
CASE m.act2 = 12
	quitting = .T.
	CLEAR READ
ENDCASE
RETURN 0

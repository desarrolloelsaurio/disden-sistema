* ษออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : ELIVIA.PRG           บ
* บ COMENTARIO    : ELIGE EL VIAJANTE    บ
* ฬออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : R. 'EL BATA'            บ
* บ FECHA      : 06/12/91                บ
* บ HORA       : 07:25:03pm              บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER บ
* ศออออออออออออออออออออออออออออออออออออออผ
* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ MODIFICACIONES: GOYO 05-17-92 00:49am                                    บ
* บ                 07-25-93 07:24pm AGREGO ORDPOP1 QUE DECIDE VAR. DE POPUP บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
FUNCTION ELIVIA
	PARA MSG,R1,C1
	SELE VIA
	IF VIAPOP
		IF TYPE("ORDPOP1")="U" .OR. !ORDPOP1
			SET ORDER TO TAG VIAJANTE
		ELSE
			SET ORDER TO TAG CODVIA
		ENDIF
		IF EOF()
			GO TOP
		ENDIF
		ACTI POPUP VIAPOP REST
		STOR !EMPTY(RESPUESTA) TO RESPUESTA
	ELSE
		IF SSTM2="PUBLICO"
			RESPUESTA=XSEEK(M.VENDEDOR,'VIA','CODVIA')
			IF RESPUESTA
			RETURN .T.
		ENDIF
	ENDIF
	RESPUESTA=ELIMIX1(BIAJA+' '+MSG,'VIA','CODVIA',10)
ENDIF
RETURN iif(LAST()=27,.F.,RESPUESTA)

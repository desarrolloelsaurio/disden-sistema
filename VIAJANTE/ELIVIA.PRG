* 浜様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : ELIVIA.PRG           �
* � COMENTARIO    : ELIGE EL VIAJANTE    �
* 麺様様様様様様様様様様様様様様様様様様郵
* � AUTOR      : R. 'EL BATA'            �
* � FECHA      : 06/12/91                �
* � HORA       : 07:25:03pm              �
* � COPYRIGHT  : 1993 by GREGORIO REINER �
* 藩様様様様様様様様様様様様様様様様様様夕
* 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様融
* � MODIFICACIONES: GOYO 05-17-92 00:49am                                    �
* �                 07-25-93 07:24pm AGREGO ORDPOP1 QUE DECIDE VAR. DE POPUP �
* 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様夕
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

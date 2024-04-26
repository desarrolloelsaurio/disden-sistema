******************************************
*-- Programa: ELIPAC.PRG
*-- Fecha   : 11-21-91 10:41am
*-- Version : G. REINER
*-- Notas   : SELECCIONA PACIENTE
*-- Modif.  : GOYO 05-30-92 08:50pm ELIMIX
*-- Modif.  : GOYO 06-07-93 01:21pm ELIMAR
*-- Modif.  : GOYO 10/04/95 18:39   PARAELI
*******************************************
FUNCTION ELIPAC
	PARA MSG,R1,C1
	SELE PER
	IF !EMPTY(MSG)
		WAIT "Paciente "+MSG WIND NOWA
	ENDIF
	RESPUESTA=IIF(PACPOP,PARAELI("PACIENTE",1),ELIMIX1('PACIENTE '+MSG,'PER','PACCOD',10))
RETURN WCL() .AND. IIF(LAST()=27 .OR. READKEY()=12,.F.,RESPUESTA)

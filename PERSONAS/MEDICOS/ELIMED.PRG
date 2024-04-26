********************************************
*-- Programa: ELIMED.PRG
*-- Fecha   : 11-21-91 10:41am
*-- Version : G. REINER
*-- Notas   : ELIGE EL MEDICO
*-- Modif.  : GOYO 05-30-92 08:50pm ELIMIX
*-- Modif.  : GOYO 06-07-93 01:21pm ELIMAR
*******************************************
FUNCTION ELIMED
	PARA MSG,R1,C1
	IF !EMPTY(MSG)
		WAIT "M‚dico "+MSG WIND NOWA
	ENDIF
	SELE PER
	RESPUESTA=IIF(MEDPOP,PARAELI("MEDICO",1),ELIMIX1('MEDICO '+MSG,'PER','MEDCOD',10))
RETURN WCL() .AND. IIF(LAST()=27 .OR. READKEY()=12,.F.,RESPUESTA)

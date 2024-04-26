* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : QW_XNUM.PRG                                              บ
* บ COMENTARIO    : INGRESA NUMERO PARA QUERY                                บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
* QW_RN,QW_CL : POSICION EN LA VENTANA DEL QUERY
* QW_CUAL     : VARIABLE PARA GENERAR EL FISC
* QW_T1       : TEXTO PARA LA PREGUNTA EN LA VENTANA
* QW_T2       : TEXTO PARA LA PRESENTACION EN PANTALLA DE LA INF. SELECC.
* ออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ
FUNCTION QW_XNUM
	PARAMETER FILXNUM,QW_RN,QW_CL,QW_CUAL,QW_T1,QW_T2
	#DEFINE NUL    0                               && NUL
	STORE NUL TO M.ELXNUM
	IF FILXNUM=2
		QUENUM=INUM(QW_T1,"999")
		IF !EMPTY(QUENUM)
			TTXNUM=ALLTRIM(STR(QUENUM))
			STORE QW_CUAL+"="+TTXNUM TO QUEFEC
			@ QW_RN,QW_CL SAY TTXNUM+' '+QW_T2
			TTXNUM=QW_T1+" "+TTXNUM 
		ELSE
			FILXNUM=1
		ENDIF
	ENDIF
RETURN FILXNUM#2

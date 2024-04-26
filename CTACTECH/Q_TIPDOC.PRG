* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : Q_TIPDOC.PRG                                             บ
* บ COMENTARIO    : DEVUELVE EL TEXTO DEL DOCUMENTO                          บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 09-02-93                                                    บ
* บ HORA       : 08:01:51pm                                                  บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
FUNCTION Q_TIPDOC
	PARAMETER Q_TXT,Q_PLURAL,Q_UPPER
	Q_SALIDA=""
	Q_TXT=UPPER(Q_TXT)
	DO CASE
	CASE Q_TXT="CH"
		Q_SALIDA="Cheque"
	CASE Q_TXT="DO"
		Q_SALIDA="Documento"
	CASE Q_TXT="TA"
		Q_SALIDA="Tarjeta"
	CASE Q_TXT="RE"
		Q_SALIDA="Recibo"
	CASE Q_TXT="FA"
		Q_SALIDA="Factura"
	CASE Q_TXT="ND"
		Q_SALIDA="Nota de Dbito"
	CASE Q_TXT="NC"
		Q_SALIDA="Nota de Crdito"
	CASE Q_TXT="OP"
		Q_SALIDA="Orden de Pago"
	ENDCASE
	IF Q_PLURAL
		Q_POS=AT(" ",Q_SALIDA)
		Q_LET=SUBSTR(Q_SALIDA,Q_POS-1,1)
		Q_SALIDA=IIF(EMPTY(Q_POS),Q_SALIDA+"s",LEFT(Q_SALIDA,Q_POS-1)+IIF(Q_LET="n","e","")+"s"+SUBSTR(Q_SALIDA,Q_POS))
	ENDIF
	IF Q_UPPER
		Q_SALIDA=UPPER(Q_SALIDA)
	ENDIF
RETURN Q_SALIDA

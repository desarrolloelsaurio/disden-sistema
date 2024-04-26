* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : XREQ.PRG                                                 บ
* บ COMENTARIO    : REINDEXA BASE DE REQSONAS                                บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
FUNCTION XREQ
	IF CHEQSEG() .AND. FUERARED()#27
		=men_lin("Reindexando Archivo")
		SELE REQ
		=FLOCK("REQ") .OR. FLOK("REQ")
		=DOTALK()
		=OPREQ(.F.,.T.)
		PACK MEMO
		INDEX ON NUMERO TAG NUMERO
		INDEX ON PEDIDO+PROCOD TAG PEDIDO
		TX="CREA INDICE "
		SELE REQX
		INDEX ON NUMERO TAG NUMERO
		INDEX ON NUMERO+AVICODPRO TAG AVICODPRO FOR !EMPTY(AVICODPRO)
		INDEX ON NUMERO+TELCODPRO TAG TELCODPRO FOR !EMPTY(TELCODPRO)
		INDEX ON NUMERO+COMCODPRO TAG COMCODPRO FOR !EMPTY(COMCODPRO)
		=IAUD(TX)
		=OPREQ(.T.)
		=UNTALK()
	ELSE
		=IAUDI()
	ENDIF
RETURN MEN_LIN(BOTOM)

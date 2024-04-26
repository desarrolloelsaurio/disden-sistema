* ษอออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : XPAG.PRG                บ
* บ COMENTARIO    : REINDEXA BASE DE PAGOS  บ
* ศอออออออออออออออออออออออออออออออออออออออออผ
#DEFINE BOTOM  "  "+repl("ฐ",78)                 && BOTOM
#DEFINE NUL    0                                 && NUL
PROCEDURE XPAG
	IF CHEQSEG()
		=men_lin("Reindexando Archivo")
		=OPPAG()
		SELE PAG
		=FLOCK("PAG") .OR. FLOK("PAG")
		=DOTALK()
		=OPPAG(.F.,.T.)
		Index TAG FECHA ON STR(NUMERO)+DTOS(FECHAVE)
		Index TAG NUMERO ON NUMERO
		TX="CREA INDICE "
		=IAUD(TX)
		=OPPAG(.T.)
		=UNTALK()
	ELSE
		=IAUDI()
	ENDIF
RETURN MEN_LIN(BOTOM)

* 浜様様様様様様様様様様様様様様様様様様様様�
* � PROCEDIMIENTO : XPAG.PRG                �
* � COMENTARIO    : REINDEXA BASE DE PAGOS  �
* 藩様様様様様様様様様様様様様様様様様様様様�
#DEFINE BOTOM  "  "+repl("�",78)                 && BOTOM
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

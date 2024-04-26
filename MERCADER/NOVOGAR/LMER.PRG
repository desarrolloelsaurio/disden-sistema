* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LMER.PRG                                                 บ
* บ COMENTARIO    : DERIVA A LISTADOS DE MERCADERIAS                         บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 08-29-93                                                    บ
* บ HORA       : 10:35:51pm                                                  บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER  / VERSION NOVOGAR                  บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
PARAMETER PORPAN
ULPR=HORA_ULP(PROGRAM())
DO CASE
CASE ALLTRIM(PROMPT())="Un Artกculo" .OR. ALLTRIM(PROMPT())="Un Producto"
	STOR NUL TO RESPUESTA
	IF !EMPTY(ELIMER("a Listar",-1,1))
		STOR 23 TO COL
		STOR 16 TO COL1
		=WIN0()
		SCAT MEMV
		DO MMER WITH .T.
		=INKEY(NUL)
		=RELEWIN("WIN")
	ENDIF
OTHERWISE
	DIJO=BAR()
	RESPUESTA='nada1#13#12#Tipo de Listado#3;
#\<Descripciขn'
	IF PORPAN
		RESPUESTA=RESPUESTA+';
#\<Marcas;
#\<Alimentaciขn/Caracterกsticas;
#\<Legajo'
	ELSE
		RESPUESTA=RESPUESTA+';
#\<Caracterกsticas'
	ENDIF
	=DEFPOP()
	ON SELE POPU NADA1 DO LMER1
	ACTI POPU NADA1
	RELE POPU NADA1
ENDCASE
RETURN
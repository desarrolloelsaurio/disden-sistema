* 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : LMER.PRG                                                 �
* � COMENTARIO    : DERIVA A LISTADOS DE MERCADERIAS                         �
* 麺様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様郵
* � AUTOR      : GOYO REINER                                                 �
* � FECHA      : 08-29-93                                                    �
* � HORA       : 10:35:51pm                                                  �
* � COPYRIGHT  : 1993 by GREGORIO REINER  / VERSION NOVOGAR                  �
* 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様夕
PARAMETER PORPAN
ULPR=HORA_ULP(PROGRAM())
DO CASE
CASE ALLTRIM(PROMPT())="Un Art�culo" .OR. ALLTRIM(PROMPT())="Un Producto"
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
#\<Descripci�n'
	IF PORPAN
		RESPUESTA=RESPUESTA+';
#\<Marcas;
#\<Alimentaci�n/Caracter�sticas;
#\<Legajo'
	ELSE
		RESPUESTA=RESPUESTA+';
#\<Caracter�sticas'
	ENDIF
	=DEFPOP()
	ON SELE POPU NADA1 DO LMER1
	ACTI POPU NADA1
	RELE POPU NADA1
ENDCASE
RETURN
* 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : LTIX.PRG                                                 �
* � COMENTARIO    : LISTADO DE TIPO DE UNIDADES                              �
* 麺様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様郵
* � AUTOR      : GOYO REINER                                                 �
* � FECHA      : 01-09-95                                                    �
* � HORA       : 09:13:27am                                                  �
* � COPYRIGHT  : 1995 by GREGORIO REINER                                     �
* 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様夕
PARAMETER PORPAN
ACTI SCREE
ULPR=HORA_ULP(PROGRAM())
TIPOLIS=BAR()
DO CASE
CASE TIPOLIS=1
	=IIF(PORPAN,LTIXP1(),LTIXI1())
CASE TIPOLIS=2
	=IIF(PORPAN,LTIXP2(),LTIXI2())
CASE TIPOLIS=3
	=IIF(PORPAN,LTIXP3(),LTIXI3())
ENDCASE
DEAC WIND WIN
RETURN

* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LTIX.PRG                                                 บ
* บ COMENTARIO    : LISTADO DE TIPO DE UNIDADES                              บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 01-09-95                                                    บ
* บ HORA       : 09:13:27am                                                  บ
* บ COPYRIGHT  : 1995 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
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

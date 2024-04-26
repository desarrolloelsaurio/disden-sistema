* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : BALANC41.PRG                                             บ
* บ COMENTARIO    : BALANCE GENERAL 4 NO IMPUTABLES Y 1 IMPUTABLE            บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 10-16-93                                                    บ
* บ HORA       : 08:00:24pm                                                  บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
EXTERNAL ARRAY TTR,PAR,TTL
STORE .F. TO PORFEC
=LISTADO3(.T.)
? CHR(27)+CHR(15)
TIT="BALANCE "+QUEAP()
DO TIT4
SELE BAL1
GO TOP
MILES=INT(INICIO/10^7)
MILTEX=NOMBRE
SCAN
	=BALANC51(.F.,.T.,4,60)
ENDSCAN
STORE .T. TO IMPRESORA
=BALANC52(.T.)
SELE BAL1
=OFF_TMP()
=MEN_LIN(SYSNOMBRE)
RETURN

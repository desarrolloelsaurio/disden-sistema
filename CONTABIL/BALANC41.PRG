* 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : BALANC41.PRG                                             �
* � COMENTARIO    : BALANCE GENERAL 4 NO IMPUTABLES Y 1 IMPUTABLE            �
* 麺様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様郵
* � AUTOR      : GOYO REINER                                                 �
* � FECHA      : 10-16-93                                                    �
* � HORA       : 08:00:24pm                                                  �
* � COPYRIGHT  : 1993 by GREGORIO REINER                                     �
* 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様夕
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

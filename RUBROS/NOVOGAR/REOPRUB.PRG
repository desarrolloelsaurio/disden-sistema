* 浜様様様様様様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : REOPRUB.PRG                    �
* � COMENTARIO    : BORRA TEMPORALES Y REABRE BASE �
* 藩様様様様様様様様様様様様様様様様様様様様様様様夕
FUNCTION REOPRUB
=REOPXXX("RUB")
#IF "PROD" $ CURDIR()
RETURN OPRUBS()
#ELSE
RETURN OPRUB()
#ENDIF
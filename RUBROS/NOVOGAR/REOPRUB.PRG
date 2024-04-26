* ษออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : REOPRUB.PRG                    บ
* บ COMENTARIO    : BORRA TEMPORALES Y REABRE BASE บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออผ
FUNCTION REOPRUB
=REOPXXX("RUB")
#IF "PROD" $ CURDIR()
RETURN OPRUBS()
#ELSE
RETURN OPRUB()
#ENDIF
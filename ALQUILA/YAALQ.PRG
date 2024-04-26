* ษออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : YAALQ.PRG            บ
* ฬออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER             บ
* บ FECHA      : 10-29-93                บ
* บ HORA       : 01:30:18am              บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER บ
* ศออออออออออออออออออออออออออออออออออออออผ
FUNCTION YAALQ
PARAMETER YAL_TIT,YAL_BCO,YAL_WIN
IF !EMPTY(YAL_TIT)
   WAIT YAL_TIT+"EXISTE" WIND NOWA
ENDIF
SELE ALQ
IF YAL_BCO
   SCAT MEMO MEMV BLAN
   SCAT MEMO TO RESPALDO BLAN
   STORE .T. TO INGRESO
ELSE
   SCAT MEMO MEMV
   SCAT MEMO TO RESPALDO
   FF=RECNO()
   REGISTRO=STR(FF)
   UNLO IN ALQ
   =LOCK("ALQ") .OR. LOK("ALQ")
   STORE .F. TO INGRESO
ENDIF
IF !EMPTY(YAL_TIT)
   WAIT CLEA
ENDIF
RETURN .T.

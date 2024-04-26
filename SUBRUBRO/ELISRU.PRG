********************************************************************************
*-- Programa: elisru.prg
*-- Fecha   : 11-19-91 05:39pm
*-- Version : G. REINER
*-- Notas   : ELIGE EL SUB-RUBRO
********************************************************************************
FUNCTION eliSRU
PARA msg,r1,c1
SELE rub
set order to tag subrubro
IF Srupop
   set order to tag SUBRUBRO
   ACTI POPUP Srubpop
   STOR IIF(!EMPTY(RESPUESTA),RECNO(),nul) TO respuesta
ELSE
   IF r1=-1
      DO infic WITH RECC('rub'),'INGRESE SUB-RUBRO '+msg
   ELSE
      @ r1,c1 GET respuesta PICTURE '9999'
      READ
      IF EMPTY(respuesta) .OR. respuesta<1 .OR. respuesta>RECC('RUB') .OR. LASTKEY()=27
         stor nul TO respuesta
      ENDIF
   ENDIF
   IF !EMPTY(RESPUESTA)
      GOTO respuesta
   ENDIF
   IF empty(codsrub)
      stor nul TO respuesta
   ENDIF
ENDIF
RETURN respuesta

********************************************************************************
*-- Programa: CHQHOR.PRG
*-- Fecha   : 07/31/91 12:06pm
*-- Version : G. REINER
*-- Notas   : CHEQUEA QUE LA HORA SEA CORRECTA
********************************************************************************
PARAMETER hor
STORE .F. TO rsp
IF LEN(hor)=5
   IF SUBSTR(hor,3,1)=":"
      h1=VAL(LEFT(hor,2))
      IF h1>-1 .AND. h1<24
         h1=VAL(RIGHT(hor,2))
         IF h1>-1 .AND. h1<60
            rsp=.T.
         ENDIF
      ENDIF
   ENDIF
ENDIF
RETURN RSP

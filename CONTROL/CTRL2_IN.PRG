* 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : CTRL2_IN.PRG                                             �
* � COMENTARIO    : DERIVA A OPERACIONES DE REINDEXADO                       �
* 麺様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様郵
* � AUTOR      : GOYO REINER                                                 �
* � FECHA      : 10-21-93                                                    �
* � HORA       : 02:23:42am                                                  �
* � COPYRIGHT  : 1993 by GREGORIO REINER                                     �
* 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様夕
FUNCTION CTRL2_IN
ORDANT=ORDER()
ANT=ULPR
DO CASE
#IF "NOVO" $ CURDIR()
CASE WEXIST("RUB")
   DO XRUB
CASE WEXIST("MI1")
   ULPR='X'+ULPR
   DO XMI1
#ENDIF
CASE WEXIST("PRC")
   DO XPRC
CASE WEXIST("MER")
   DO XMER
CASE WEXIST("MIX") .OR. WEXIST("ARA")
   ULPR='X'+ULPR
   DO XMIX
   #IF  ("ALQ" $  CURDIR()  .OR. "EXP" $  CURDIR())
   CASE WEXIST("INM")
      IF !EMPTY(I_ALIAS) .AND. I_ALIAS="ALQ"
         DO XALQ
      ELSE
         DO XINM
      ENDIF
   #ENDIF
   #IF  "LABO" $  CURDIR()
   CASE WEXIST("PRA")
      DO XPRA
   CASE WEXIST("MUT") .OR. WEXIST("XMUT")
      DO XMUT
   #ENDIF
CASE WEXIST("LIQ")
   DO XLIQ
   #IF EMPTY(AT("LABOR",CURDIR())) .AND. EMPTY(AT("EXPEN",CURDIR()))
   CASE WEXIST("RUB")
      DO XRUB
   #ENDIF
   #IF "PROD" $ CURDIR()
   CASE WEXIST("TAL")
      DO XTAL
      CASE WEXIST("REQ")
         DO XREQ
      CASE WEXIST("AVIS")
         DO XAVIS
      CASE WEXIST("TELS")
         DO XTELS
      CASE WEXIST("COMS")
         DO XCOMS
      CASE WEXIST("OTRS")
         DO XOTRS
      CASE WEXIST("INGPRS") .OR. ;
     WEXIST("INGPRS1")
         DO XPRS
   #ENDIF
OTHERWISE
   ULPR='X'+ULPR
   DO XPER
ENDCASE
ULPR=ANT
SET ORDER TO TAG (ORDANT)
RETURN .T.

* 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : MAYOR3.PRG                                               �
* � COMENTARIO    : MAYOR COMPLETO                                           �
* 麺様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様郵
* � AUTOR      : GOYO REINER                                                 �
* � FECHA      : 10-13-93                                                    �
* � HORA       : 06:09:51pm                                                  �
* � COPYRIGHT  : 1993 by GREGORIO REINER                                     �
* 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様夕
STORE "A" TO AP
STORE KPERINIC TO PERINI
STORE PERIODO TO PERFIN
STORE .T. TO ARRASANIO,ARRASMES,MLIM
STORE .F. TO PORFEC
STORE 1 TO NPAG
SELE BAL
SET ORDER TO TAG CODIGO
GO TOP
INICIO=BAL.CODIGO
GO BOTT
FINAL=BAL.CODIGO
STORE {} TO FECINI,FECFIN
FISC='IMPUTABLE="I"'
FISC1='!EMPTY(BAL1.NOMBRE) .AND. PERIODO>='+ALLTRIM(STR(PERINI))+" .AND. PERIODO<="+ALLTRIM(STR(PERFIN))
TIT="LIBRO MAYOR COMPLETO "+QUEAP()
STORE 0 TO SI,SB,SM
DO MAYORX
RETURN

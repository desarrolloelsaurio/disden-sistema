********************************************************************************
*-- Programa: ELIEMP.PRG
*-- Fecha   : 05/28/91 06:21pm
*-- Version : G. REINER -
*-- Notas   : ELIGE LA MARCA
*-- Modificaci¢n GOYO 05-16-92 10:11pm
*-- Modificaci¢n GOYO 07-22-92 11:37pm marca -> empresa
********************************************************************************
FUNCTION ELIEMP
PARA msg,r1,c1
if TYPE("CANT_EMPRE")#"U" .AND. cant_empre#1
   SELE MIX
   IF marpop
      SET ORDER TO TAG JANTEX
      ACTI POPUP MIXpop
      STOR IIF(EMPTY(respuesta),NUL,RECNO()) TO respuesta
   ELSE
      RESPUESTA=ELIMIX1('Empresa '+msg,'mix','JANCOD')
   ENDIF
else
SELE MIX
   SET ORDER TO TAG JANCOD
   go top
   respuesta=recno()
endif
RETURN respuesta

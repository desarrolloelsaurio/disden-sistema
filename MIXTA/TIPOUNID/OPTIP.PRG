* 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : OPTIP.PRG                                                �
* � COMENTARIO    : ABRE BASE DE TIPO DE UNIDAD                              �
* 麺様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様郵
* � AUTOR      : GOYO REINER                                                 �
* � FECHA      : 11-18-93                                                    �
* � HORA       : 09:03:35pm                                                  �
* � COPYRIGHT  : 1993 by GREGORIO REINER                                     �
* 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様夕
#DEFINE BOTOM  "  "+REPL("�",78)                 && BOTOM
#DEFINE ABA    "Abriendo Base de "               && ABA
IF USED("MIX")
   SELE MIX
   SET ORDER TO TAG TIPTEX
ELSE
   =MEN_LIN(ABA+"Tipo de Unidades")
   =GETDBF('MIXTA',"TIPTEX","MIX",1)
ENDIF
RETURN IIF(TIPPOP,DEFPOMIX(TIPPOPR,TIPPOPC),.T.) .AND. MEN_LIN(BOTOM)

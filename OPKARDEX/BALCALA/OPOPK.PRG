* 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : OPOPK.PRG                                                �
* � COMENTARIO    : ABRE ARCHIVO MIXTO - OPERACIONES DE AKRDEX               �
* 麺様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様郵
* � AUTOR      : GOYO REINER                                                 �
* � FECHA      : 02/08/93                                                    �
* � HORA       : 17:00                                                       �
* � COPYRIGHT  : 1993 by GREGORIO REINER                                     �
* 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様夕
IF USED("MIX")
   SELE MIX
   SET ORDER TO TAG opkTEX
ELSE
   =MEN_LIN(ABA+"Operaciones de Kardex")
   SELE 1
   =GETDBF('MIXTA',"MIX","opkTEX")
ENDIF
IF opkpop
	=DEFPOMIX(opkpopr,opkpopc)
ENDIF
RETURN men_lin(botom)

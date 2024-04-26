* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : OPOPK.PRG                                                บ
* บ COMENTARIO    : ABRE ARCHIVO MIXTO - OPERACIONES DE AKRDEX               บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 02/08/93                                                    บ
* บ HORA       : 17:00                                                       บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
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

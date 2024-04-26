* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : OPTIP.PRG                                                บ
* บ COMENTARIO    : ABRE BASE DE TIPO DE UNIDAD                              บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 11-18-93                                                    บ
* บ HORA       : 09:03:35pm                                                  บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
#DEFINE BOTOM  "  "+REPL("ฐ",78)                 && BOTOM
#DEFINE ABA    "Abriendo Base de "               && ABA
IF USED("MIX")
   SELE MIX
   SET ORDER TO TAG TIPTEX
ELSE
   =MEN_LIN(ABA+"Tipo de Unidades")
   =GETDBF('MIXTA',"TIPTEX","MIX",1)
ENDIF
RETURN IIF(TIPPOP,DEFPOMIX(TIPPOPR,TIPPOPC),.T.) .AND. MEN_LIN(BOTOM)

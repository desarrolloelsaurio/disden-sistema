* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : ELIPER1.PRG                                      บ
* บ COMENTARIO    : SELECCION COD. ALFANUM POR TECLADO PARA PERSONAS บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                         บ
* บ FECHA      : 13/12/94 11:49                                      บ
* บ COPYRIGHT  : 1994 BY GREGORIO REINER                             บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
FUNCTION ELIPER1
PARAMETER ELMES,ELALI,ELORDR,EL_LARGO,EL_COD
PRIVATE ELMES,ELALI,ELORDR,EL_LARGO,EL_COD,RESPUESTA
#DEFINE NUL    0                                 && NUL

M.EL_LARGO=IIF(PARAMETER()=3,2,M.EL_LARGO)
STORE SPACE(M.EL_LARGO) TO RESPUESTA
IF R1=-1
   DO INFIC1 WITH ELMES,M.EL_LARGO
ELSE
   @ R1,C1 GET RESPUESTA PICTURE REPL("!",M.EL_LARGO)
   READ
ENDIF
RESPUESTA=IIF(EMPTY(RESPUESTA) .OR. LASTKEY()=27,;
SPACE(M.EL_LARGO),;
IIF(XSEEK(RESPUESTA,(ELALI),(ELORDR)),;
RESPUESTA,;
AJCODPER(RESPUESTA,EL_LARGO-LEN(EL_COD),EL_COD)))
RETURN XSEEK(RESPUESTA,(ELALI),(ELORDR))

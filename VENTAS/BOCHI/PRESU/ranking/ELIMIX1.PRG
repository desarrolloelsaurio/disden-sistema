* 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様�
* � PROCEDIMIENTO : ELIMIX1.PRG                               �
* � COMENTARIO    : SELECCION CODIGO ALFANUMERICO POR TECLADO �
* 麺様様様様様様様様様様様様様様様様様様様様様様様様様様様様様�
* � AUTOR      : GOYO REINER                                  �
* � FECHA      : 10-29-93                                     �
* � HORA       : 03:58:12PM                                   �
* � COPYRIGHT  : 1993 BY GREGORIO REINER                      �
* 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様�
FUNCTION ELIMIX1
PARA ELMES,ELALI,ELORDR,EL_LARGO,AJ,ELPIC
PRIV ELMES,ELALI,ELORDR,EL_LARGO,AJ,ELPIC
#DEFINE NUL    0                                 && NUL

M.EL_LARGO=IIF(PARAMETER()=3,2,M.EL_LARGO)
STORE SPACE(M.EL_LARGO) TO RESPUESTA
IF R1=-1
   DO INFIC1 WITH ELMES,M.EL_LARGO
ELSE
   @ R1,C1 GET RESPUESTA PICTURE REPL("!",M.EL_LARGO)
   READ
ENDIF
RESPUESTA=IIF(EMPTY(RESPUESTA) .OR. LASTKEY()=27,SPACE(M.EL_LARGO),RESPUESTA)
RETURN XSEEK(IIF(AJ,;
   IIF(EMPTY(ELPIC),PADL(ALLTRIM(RESPUESTA),10),TRANS(ALLTRIM(RESPUESTA),ELPIC)),;
   RESPUESTA),;
   (ELALI),(ELORDR))

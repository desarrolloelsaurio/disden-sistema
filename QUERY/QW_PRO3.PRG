* 旼 FUNCION 컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
* �    File Name: QW_PRO3.PRG                                                �
* �       Author: G. REINER                                                  �
* � Date created: 10-25-92                                                   �
* � Time created: 09:40:09pm                                                 �
* � QUE HACE ?  : DEVUELVE TITULO Y QUERY DE PROVEEDOR                       �
* 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
FUNCTION QW_PRO3
PARAMETER QW_REN,QW_COL
PRIVATE QW_REN,QW_COL
IF FILPRO=2
   STORE NUL TO RESPUESTA
   IF ELIPRO("A LISTAR",QW_REN,QW_COL)
      TTPRO='PROVEEDOR: '+ALLTRIM(PRO.PROVEEDOR)
      STORE 'MER.PRO1="'+PRO.PROCOD+'" .OR. MER.PRO2="'+PRO.PROCOD+'" .OR. MER.PRO3="'+PRO.PROCOD+'"' TO QUEPRO
      @ QW_REN,QW_COL SAY ALLTRIM(PRO.PROVEEDOR)
   ELSE
      STORE 1 TO FILPRO
   ENDIF
ENDIF
RETURN FILPRO=1

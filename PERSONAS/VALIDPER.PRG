* 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : VALIDPER.PRG                                             �
* � COMENTARIO    : VALIDA EL INGRESO DE UNA VARIABLE PERSONA Y MSTRA VENTA  �
* 麺様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様郵
* � AUTOR      : GOYO REINER                                                 �
* � FECHA      : 09-09-93                                                    �
* � HORA       : 00:35:37am                                                  �
* � COPYRIGHT  : 1993 by GREGORIO REINER                                     �
* 麺様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様郵
* � PARAMETROS:                                                              �
* � VAL_CAMPO     : NOMBRE EXACTO DEL CAMPO EN LA BASE                       �
* � VAL_CPO       : QUE BUSCO ?                                              �
* � VAL_ORDER     : ORDER TAG DE LA BASE PER                                 �
* � VAL_WIND      : NOMBRE DE LA VENTANA A MOSTRAR                           �
* � VAL_MENS      : MENSAJE PARA EL WAIT DEL YAESTABA                        �
* 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様夕
FUNCTION VALIDPER
PARAMETER VAL_CAMPO,VAL_CPO,VAL_ORDER,VAL_WIND,VAL_MENS,VAL_VUELVE,VAL_ALS
EXTERNAL ARRAY RESPALDO
EXTERNAL ARRAY CONTENIDO
IF LAST()#27
   IF YAESTABA(EVAL(VAL_CPO),'PER',VAL_ORDER)
      IF EMPTY(VAL_WIND) .OR. VAL_WIND="PER"
         STORE .F. TO INGRESO
      ENDIF
      IF !EMPTY(VAL_ALS)
         XA=NROCAMPO(VAL_CAMPO,VAL_ALS)
         STORE IIF(M.CAMBIO,M.CAMBIO,EVAL(VAL_CPO)#RESPALDO[XA]) TO M.CAMBIO
      ENDIF
      RETURN IIF(VAL_VUELVE,SGET(VAL_WIND),YAPER(VAL_MENS,.F.,VAL_WIND))
   ELSE
      STORE AJCODPER(EVAL(VAL_CPO),CONTENIDO[2],CONTENIDO[5]) TO &VAL_CPO      
      IF YAESTABA(EVAL(VAL_CPO),'PER',VAL_ORDER)
         IF EMPTY(VAL_WIND) .OR. VAL_WIND="PER"
            STORE .F. TO INGRESO
         ENDIF
         IF !EMPTY(VAL_ALS)
            XA=NROCAMPO(VAL_CAMPO,VAL_ALS)
            STORE IIF(M.CAMBIO,M.CAMBIO,EVAL(VAL_CPO)#RESPALDO[XA]) TO M.CAMBIO
         ENDIF
         RETURN IIF(VAL_VUELVE,SGET(VAL_WIND),YAPER(VAL_MENS,.F.,VAL_WIND))
      ELSE      
         IF !EMPTY(VAL_WIND) .AND. VAL_WIND#"PER"
            =SGET(VAL_WIND)
            RETURN .F.
         ELSE
            XA=NROCAMPO(VAL_CAMPO,"PER")
            STORE IIF(M.CAMBIO,M.CAMBIO,EVAL(VAL_CPO)#RESPALDO[XA]) TO M.CAMBIO
         ENDIF
      ENDIF
   ENDIF
ENDIF
RETURN SGET(VAL_WIND)

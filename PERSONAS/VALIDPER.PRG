* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : VALIDPER.PRG                                             บ
* บ COMENTARIO    : VALIDA EL INGRESO DE UNA VARIABLE PERSONA Y MSTRA VENTA  บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 09-09-93                                                    บ
* บ HORA       : 00:35:37am                                                  บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                                     บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ PARAMETROS:                                                              บ
* บ VAL_CAMPO     : NOMBRE EXACTO DEL CAMPO EN LA BASE                       บ
* บ VAL_CPO       : QUE BUSCO ?                                              บ
* บ VAL_ORDER     : ORDER TAG DE LA BASE PER                                 บ
* บ VAL_WIND      : NOMBRE DE LA VENTANA A MOSTRAR                           บ
* บ VAL_MENS      : MENSAJE PARA EL WAIT DEL YAESTABA                        บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
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

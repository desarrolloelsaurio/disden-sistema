* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : VALIDGRL.PRG                                             บ
* บ COMENTARIO    : VALIDA EL INGRESO DE UNA VARIABLE Y MUESTRA VENTANA      บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 09-09-93                                                    บ
* บ HORA       : 00:35:37am                                                  บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
* VLID_CAMPO   -> CAMPO QUE SE EVALUA (CODCLI)
* VLID_BASE    -> BASE EN LA QUE SE DESEA INGRESAR EL CAMPO (FAC)
* VLID_BASE1   -> BASE DE ORIGEN (CLI)
* VLID_ORDER   -> ORDER TAG PARA BUSCAR EL CAMPO (CODCLI EN CLI)
* VLID_WIND    -> VENTANA PARA EL SHOW GETS
* VLID_OTROCAM -> OTRO CAMPO EN EL CASO QUE EN LUGAR DE EVALUAR VLID_CAMPO, EN LA BASE ORIGINAL
* SE LLAME DE OTRA MANERA. PRO1,PRO2 Y PRO2 QUE EN VLID_OTROCAMPO SERIA PROCOD
* VLID_RES -> CARGA RESPALDO ?
FUNCTION VALIDGRL
PARAMETER VLID_CAMPO,VLID_BASE,VLID_BASE1,VLID_ORDER,VLID_WIND,VLID_OTROCAM,VLID_RES
EXTERNAL ARRAY RESPALDO
IF LAST()#27
   VLID_AA=ALIAS()
   IF VLID_BASE=VLID_BASE1
      VLID_REG=M.FF
   ENDIF
   IF VLID_RES
      SELE (VLID_BASE)
      RELE RESPALDO
      PUBLIC ARRAY RESPALDO[5]
      SCAT TO RESPALDO BLAN
   ENDIF
   IF !EMPTY(VLID_AA)
      SELE (VLID_AA)
   ENDIF
   VAGRL_XA=NROCAMPO(VLID_CAMPO,VLID_BASE)
   VLID_SALE=IIF(EMPTY(VLID_OTROCAM),"M."+VLID_CAMPO,VLID_OTROCAM)
   IF EVAL("M."+VLID_CAMPO)#RESPALDO[VAGRL_XA]
      IF XSEEK(EVAL("M."+VLID_CAMPO),VLID_BASE1,VLID_ORDER)
         STORE .T. TO CAMBIO
         STORE EVAL(VLID_SALE) TO G_AUDI
         IF VLID_BASE=VLID_BASE1 .AND. !EMPTY(VLID_REG)
            GO VLID_REG IN (VLID_BASE1)
         ENDIF
         RETURN SGET(VLID_WIND)
      ELSE
         IF VLID_BASE=VLID_BASE1 .AND. !EMPTY(VLID_REG)
            IF !EMPTY(VLID_REG)
            GO VLID_REG IN (VLID_BASE1)
            ELSE
            GO TOP
            ENDIF
         ENDIF
         RETURN .F.
      ENDIF
   ELSE
      STORE "" TO G_AUDI
   ENDIF
ENDIF
IF VLID_BASE=VLID_BASE1 .AND. !EMPTY(VLID_REG)
   GO VLID_REG IN (VLID_BASE1)
ENDIF
RETURN .T.

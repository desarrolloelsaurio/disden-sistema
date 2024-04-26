* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : BINM.PRG                                                 บ
* บ COMENTARIO    : BORRA BASE DE ALQUILERES                                 บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 11-30-93                                                    บ
* บ HORA       : 05:07:08am                                                  บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
#DEFINE ENTERCON "PULSE [ENTER] PARA CONTINUAR"  && ENTERCON
FUNCTION BINM
IF WEXIST("XXXINM")                            && DATOS MONETARIOS
   IF CONFIRMA("BORRAR DATOS MONETARIOS DEL INMUEBLE "+ALLTRIM(INM.CODINM),.T.,10,0)
      ULPR="BINMMON"
      IF CHEQSEG()
         SELE ALQ
         IF ALQ.CODINM=INM.CODINM
            =LOCK("ALQ") .OR. LOK("ALQ")
            SCAT MEMV
            STORE "" TO M.CODACT,M.MONEDA
            STORE NUL TO M.MONTOBASE,M.FECHASEG,M.COMISION
            GATH MEMV
            UNLO IN ALQ
            =IAUD(ALLTRIM(INM.CODINM)+INM.DOMICILIO)
            =SGET("XXXINM")
         ELSE
            =NOALQ()
         ENDIF
      ELSE
         =IAUDI()
      ENDIF
   ENDIF
ELSE
   IF WEXIST("XXINM")                           && DATOS CONTRACTUALES
      IF CONFIRMA("BORRAR DATOS CONTRACTUALES DEL INMUEBLE "+ALLTRIM(INM.CODINM),.T.,10,0)
         ULPR="BINMCON"
         IF CHEQSEG()
            SELE ALQ
            IF ALQ.CODINM=INM.CODINM
               IF !EMPTY(ALQ.CODACT)
                  RETURN WARNIN("MONETARIOS DEL CONTRATO")
               ENDIF
               =LOCK("ALQ") .OR. LOK("ALQ")
               SCAT MEMV
               STORE {} TO m.fechaalq,m.fechavenc
               STORE NUL TO m.cantmeses,m.diavenc
               GATH MEMV
               UNLO IN ALQ
               =IAUD(ALLTRIM(INM.CODINM)+INM.DOMICILIO)
               =SGET("XXINM")
            ELSE
               =NOALQ()
            ENDIF
         ELSE
            =IAUDI()
         ENDIF
      ENDIF
   ELSE
      IF WEXIST("XINM")
         IF XALQ                                    && DATOS PERSONALES
            IF CONFIRMA("BORRAR DATOS PERSONALES DEL INMUEBLE "+ALLTRIM(INM.CODINM),.T.,10,0)
               ULPR="BINMPER"
               IF CHEQSEG()
                  SELE ALQ
                  IF ALQ.CODINM=INM.CODINM
                     IF !EMPTY(ALQ.CODACT)
                        RETURN WARNIN("MONETARIOS DEL CONTRATO")
                     ENDIF
                     IF !EMPTY(ALQ.FECHAALQ)
                        RETURN WARNIN("CONTRACTUALES")
                     ENDIF
                     =LOCK("ALQ") .OR. LOK("ALQ")
                     DELE
                     SCAT MEMV BLAN
                     UNLO IN ALQ
                     =IAUD(ALLTRIM(INM.CODINM)+INM.DOMICILIO)
                     =SGET("XINM")
                  ELSE
                     =NOALQ()
                  ENDIF
               ELSE
                  =IAUDI()
               ENDIF
            ENDIF
         ELSE
            IF !EMPTY(AT("LEGAJO",UPPER(WTIT("XINM"))))
               =BORLEG("LEGAJO DE "+ALLTRIM(INM.DOMICILIO),"INM","BINMJ")
            ENDIF
         ENDIF
      ELSE
         DO OPALQ
         IF XSEEK(INM.CODINM,"ALQ","CODINM")
            =CARTEL("LA PROPIEDAD TIENE CONTRATO",;
              "NO SE PUEDE DAR DE BAJA",;
              "EFECTUE TODAS LAS BAJAS ANTES DE REINTENTAR",;
              ENTERCON)
         ELSE
            =BORLEG(" INMUEBLE "+ALLTRIM(INM.DOMICILIO),"INM","BINM",.F.,.T.)
         ENDIF
      ENDIF
   ENDIF
ENDIF
RETURN .T.
 
FUNCTION WARNIN
PARAMETER WAR_TEX
RETURN CARTEL("NO FUERON BORRADOS LOS DATOS REQUERIDOS",;
  "DADO QUE SE HA DETECTADO LA EXISTENCIA DE INFORMACION",;
  "SOBRE LOS DATOS "+WAR_TEX,;
  "PARA EFECTUAR ESTA OPERACION DEBERA BORRAR AQUELLOS PREVIAMENTE")

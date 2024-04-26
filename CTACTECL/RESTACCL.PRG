* ÚÄFUNCION  ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
* ³    File Name: RESTACCL.PRG                               ³
* ³       Author: G. REINER                                  ³
* ³ Date created: 11-04-92                                   ³
* ³ Time created: 06:06:51pm                                 ³
* ³    Copyright: SISTEMAS INFORMATICOS S.R.L.               ³
* ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
* IMPUTA PAGOS A FACTURAS
* N O .F. -> REIMPUTA POR NUMERO DE FACTURA
* 2       -> REIMPUTA POR FECHA DE OPERACION
* 3       -> REIMPUTA POR FECHA DE VENCIMIENTO
FUNCTION RESTACCL
PARAMETER VAR_CLIENTE,VAR_FACTURA,VAR_MONTO,USA_SOBRA,ORDENFAC,RES_FAXT
PRIVATE VAR_CLIENTE,VAR_FACTURA,VAR_MONTO,VAR_ALIANT,SALIDA
STORE IIF(TYPE("LAIMP")="N",LAIMP,0) TO LAIMP
IF !EMPTY(VAR_MONTO)
   =MEN_LIN("IMPUTANDO PAGOS")
   STORE "" TO SALIDA
   M.VAR_ALIANT=ALIAS()
   IF !empty(var_factura)
      *** PAGA LA FACTURA REQUERIDA
      SELE CCL
      SET ORDER TO TAG NUMERORE
      IF SEEK(M.VAR_FACTURA)
         IF RES_FAXT
            M.RE_RECNO=RECNO()
            =RESTACC2()
         ELSE
            SCAN WHILE CCL.NUMERORE=M.VAR_FACTURA .AND. M.VAR_MONTO>0
               =RESTACC1()
            ENDS
         ENDIF
      ENDIF
   ELSE
      SELE CCL
      SET ORDER TO TAG CODCLI
      SEEK VAR_CLIENTE
      M.RE_RECNO=RECNO()
      IF RES_FAXT
         =RESTACC2()
      ELSE
         SCAN WHILE CCL.CODCLI=VAR_CLIENTE
            IF ESDEBE(CCL.COMPRRE)
               M.RE_RECNO=RECNO()
               EXIT
            ENDIF
         ENDSCAN
      ENDIF
   ENDIF
   IF USA_SOBRA .AND. M.VAR_MONTO>0
      *** SIGUE CON LAS OTRAS FACTURAS Y NOTAS DE CREDITO DEL CLIENTE
      *** VA POR ORDEN DE FECHA DE OPERACION
      IF M.VAR_MONTO>0
         IF TYPE("M.ORDENFAC")#"N" .OR. ORDENFAC=1
            SET ORDER TO TAG NUMERORE
         ELSE
            IF ORDENFAC=2
               SET ORDER TO TAG FECHAOP
            ELSE
               SET ORDER TO TAG FECHAVE
            ENDIF
         ENDIF
         IF RES_FAXT
            FOR RES_A=1 TO ALEN(FAXT,1)
               IF !EMPTY(FAXT[RES_A,3])
                  ELTEX=FAXT[RES_A,1]
                  IF SSTM1="ADMIN"
                     A1=AT("EXP",ELTEX)
                     A2=AT("|",ELTEX)-A1
                     RES_CUOTA=SUBSTR(ELTEX,A1,A2)
                  ELSE
                     IF SSTM1="HOGAR"
                        A1=AT("CUOTA",ELTEX)
                        A2=AT("|",ELTEX)-A1
                        RES_CUOTA=SUBSTR(ELTEX,A1,A2)
                     ELSE
                        RES_CUOTA=FAXT[RES_A,1]
                     ENDIF
                  ENDIF
                  SCAN FOR CCL.CODCLI=M.VAR_CLIENTE
                     IF SSTM1="MORFI" .AND. LEFT(CCL.DETALLE,2)="FA"
                        =RESTACC1()
                        EXIT
                     ELSE
                        IF CCL.DETALLE=RES_CUOTA
                           =RESTACC1()
                           EXIT
                        ENDIF
                     ENDIF
                  ENDSCAN
               ENDIF
            NEXT
         ENDIF
         SCAN FOR CCL.CODCLI=M.VAR_CLIENTE
            IF M.VAR_MONTO>0
               IF ESDEBE(CCL.COMPRRE) .AND. !CCL.PAGADA
                  =RESTACC1()
               ENDIF
            ELSE
               EXIT
            ENDIF
         ENDSCAN
      ENDIF
      *** ASIGNA LO QUE SOBRA A LA FACTURA PEDIDA
      IF M.VAR_MONTO>0
         SET ORDER TO TAG NUMERORE
         IF TYPE("M.VAR_FACTURA")="L"
            GO M.RE_RECNO
         ELSE
            SEEK M.VAR_FACTURA
         ENDIF
         M.REGISTRO=STR(RECNO())
         =RLOCK() .OR. LOK()
         REPL CCL.CUOTA WITH CCL.CUOTA+M.VAR_MONTO
         REPL CCL.PAGADA WITH CCL.CUOTA>=CCL.MONTO
      ENDIF
   ELSE
      SALIDA=M.VAR_MONTO
   ENDIF
   =MEN_LIN(BOTOM)
   IF !EMPTY(M.VAR_ALIANT)
      SELE (M.VAR_ALIANT)
   ENDIF
ELSE
   SALIDA=M.VAR_MONTO
ENDIF
RETURN SALIDA
 
* ÚÄ FUNCION  ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
* ³  Description: RESTACC1                                                   ³
* ³       Author: G. REINER                                                  ³
* ³ Date created: 11-04-92                                                   ³
* ³ Time created: 06:02:01pm                                                 ³
* ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
FUNCTION RESTACC1
IF !CCL.PAGADA
   IF CCL.CUOTA<CCL.MONTO
      M.RESTO=CCL.MONTO-CCL.CUOTA
      M.RESTO=MIN(M.RESTO,M.VAR_MONTO)
      M.VAR_MONTO=M.VAR_MONTO-M.RESTO
      M.REGISTRO=STR(RECNO())
      =RLOCK() .OR. LOK()
      REPL CCL.CUOTA WITH CCL.CUOTA+M.RESTO
      LAIMP=LAIMP+1
      DIME IMPUTA[LAIMP,4]
      IMPUTA[LAIMP,1]=DETALLE
      IMPUTA[LAIMP,3]=CCL.FECHAVE
      IMPUTA[LAIMP,4]=CCL.COMPR
      IF CCL.CUOTA>=CCL.MONTO
         REPL CCL.PAGADA WITH .T.
         IMPUTA[LAIMP,2]=.T.
      ENDIF
      UNLO IN CCL
   ENDIF
ENDIF
RETURN .T.
 
FUNCTION RESTACC2
FOR RES_A=1 TO ALEN(FAXT,1)
   IF !EMPTY(FAXT[RES_A,3])
      ELTEX=IIF(TYPE("FAXT[RES_A,1]")="C",FAXT[RES_A,1],Q_FAC("A"+SUCU+"-"+ALLTRIM(STR(FAXT[RES_A,1]))))
      IF SSTM1="ADMIM"
         A1=AT("EXP",ELTEX)
         A2=AT("|",ELTEX)-A1
         RES_CUOTA=SUBSTR(ELTEX,A1,A2)
      ELSE
         IF SSTM1="HOGAR"
            A1=AT("CUOTA",ELTEX)
            A2=AT("|",ELTEX)-A1
            RES_CUOTA=SUBSTR(ELTEX,A1,A2)
         ELSE
            RES_CUOTA=FAXT[RES_A,1]
         ENDIF
      ENDIF
      GO M.RE_RECNO
      SCAN WHILE CCL.NUMERORE=M.VAR_FACTURA .AND. M.VAR_MONTO>0
         IF SSTM1="MORFI" .AND. LEFT(CCL.DETALLE,2)="FA"
            =RESTACC1()
            EXIT
         ELSE
            IF CCL.DETALLE=RES_CUOTA
               =RESTACC1()
               EXIT
            ENDIF
         ENDIF
      ENDSCAN
   ENDIF
NEXT
RETURN .T.

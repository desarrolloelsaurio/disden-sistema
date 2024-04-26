*******************************************************************************
*-- Programa: ICOBO.PRG
*-- Fecha   : 04-12-92 11:42am
*-- Version : G. REINER
*-- Notas   : INGRESA COBROS A CUENTA
********************************************************************************
ULPR=hora_ulp(PROGRAM())
IF CHEQSEG()
   VEZ=1
   DO WHILE .T.
      STORE NUL TO RESPUESTA
      IF !empty(ELIEMP("a Ingresar",-1,1))
         IF VEZ=1
            VEZ=2
         ELSE
            EXIT
         ENDIF
         =OPCCL() WITH JANNRO
         =OPFAC() WITH JANNRO
         DO OPCAJ WITH JANNRO
         DO OPCCH WITH JANNRO
         DO WHILE .T.
            STORE NUL TO RESPUESTA
            IF ELICLI("",-1,1)
               ELCLI=PER.CODCLI
               SELE CCL
               SET ORDER TO TAG CODCLI
               =SEEK(ELCLI)
               STORE NUL TO PUNTERO,PESOS,DOLARES,CHEQUES,GTTL,PNCHE
               DEFI WIND WIN1 FROM 0,0 TO 8,50 FOOT ALLTRIM(JANNAME) TITL " Discriminaci¢n de la Cobranza " COLO SCHE 8
               =CENTWIN("WIN1")
               STORE DATE() TO LAFECHA
               @ 1,1 say 'FECHA' COLO SCHE 3
               @ 1,20 GET LAFECHA MESS 'Fecha de la Operaci¢n - [ESC] para Fin'
               @ 3,1 say upper(xauss) colo sche 3
               @ 3,30 GET PESOS PICT '99,999,999.99' MESS 'Cobrado en '+xauss+' - [ESC] para Fin'
               @ 4,1 say upper(xadols) colo sche 3
               @ 4,30 GET DOLARES PICT '99,999,999.99' MESS 'Cobrado en '+xadols+'  - [ESC] para Fin'
               @ 5,1 GET CHEQUES PICT 'CHEQUES' FUNC '*C' MESS 'Hay Cheques ?  - [ESC] para Fin'
               READ CYCLE
               IF !EMPTY(CHEQUES+PESOS+DOLARES)
                  M.PUNMAR=(JANNRO-1)*20+7
                  GO M.PUNMAR IN DOC
                  =RLOCK() .OR. LOK(STR(M.PUNMAR),'DOC')
                  m.RECIBO=doc.numero
                  TTL=PESOS+DOLARES
                  GTTL=PESOS+DOLARES*XACOTIZ
                  IF !EMPTY(CHEQUES)
                     STORE NUL TO CHEQUES
                     STORE "" TO ARCHE
                     M.CHEQUES=ICCH(@ARCHE,.T.,99,'CH')
                     TTL=TTL+CHEQUES
                  ENDIF
                  IF !EMPTY(TTL)
                     ACTI WIND WIN1
                     M.R0=WLROW()+WROWS()
                     M.C0=WLCOL()+WCOLS()
                     ZOOM WIND WIN1 NORM FROM WLROW(),WLCOL() TO M.R0+4,M.C0
                     @ 5,1 say space(50)
                     @ 5,1 SAY 'CHEQUES' COLO SCHE 3
                     @ 5,30 GET CHEQUES PICT '99,999,999.99'
                     @ 6,1 SAY 'TOTAL' COLO SCHE 3
                     @ 6,30 GET TTL PICT '99,999,999.99'
                     CLEA GETS
                     IF CONFIRMA("el Pago",.f.,8,2)
                           =RESTACCL(PER.CODCLI,IIF(TYPE("CCL.NUMERORE")="N",NUL,""),TTL,.T.,1)
                           M.FACTURA=''
	                        M.CODCLI=PER.CODCLI
                        M.FECHAOP=M.LAFECHA
                        M.FECHAVE=M.LAFECHA
                        IF TYPE("CAJ.NUMERE")="N"
                           STORE RECIBO TO M.NUMERE
                        ELSE
                           STORE Q_FAC(SUCU+'-'+ALLTRIM(STR(RECIBO))) TO M.NUMERE
                        ENDIF
                        M.COMPR="FAC N§ "+IIF(TYPE("FACTURA")="C",ALLTRIM(FACTURA),ALLTRIM(STR(FACTURA)))
                        STORE "RE" TO M.COMPRRE, M.COMPRE
                        M.CAJA="00"
                        IF !EMPTY(PESOS)
                           M.DETALLE="PAGO EN EFVO. "+UPPER(XAUSS)
                           M.MONTO=PESOS
                           M.MONEDA=XAUSS
                           M.EQUIVALE=PESOS/XACOTIZ
                           M.PAGADA=.T.
                           =AGRABAR("CCL")
                           =AGRABAR("CAJ")
                        ENDIF
                        IF !EMPTY(DOLARES)
                           M.DETALLE="PAGO EN EFVO. "+UPPER(XADOLS)
                           M.MONTO=DOLARES
                           M.MONEDA=XADOLS
                           M.EQUIVALE=DOLARES
                           M.PAGADA=.T.
                           =AGRABAR("CCL")
                           =AGRABAR("CAJ")
                        ENDIF
                        IF !EMPTY(CHEQUES)
                           ****
                           SELE CCH
                           SCAT TO COSA BLAN
                           cosa[ 1]=PER.CODCLI
                           cosa[ 2]=m.lafecha
                           cosa[ 3]='CH'
                           cosa[ 4]='FA N§ '+iif(type("FACTURA")="C",ALLTRIM(FACTURA),alltrim(STR(FACTURA)))
                           cosa[ 5]='RE'
                           cosa[ 6]=RECIBO
                           cosa[10]=Xauss
                           cosa[13]=FECHAAC
                           cosa[14]=cosa[9]/xacotiz
                           COSA[16]=DATE()
                           COSA[17]=usador
                           FOR CHA=1 TO ALEN(ARCHE,1)
                              COSA[9]=ARCHE[CHA,2]
                              COSA[8]=ARCHE[CHA,4]
                              COSA[7]=ARCHE[CHA,5]
                              COSA[11]=ARCHE[CHA,3]
                              COSA[12]=ARCHE[CHA,6]
                              =AGRABAR("CCH",@COSA)
                              M.FECHAVE=ARCHE[CHA,3]
                              M.DETALLE="CHEQUE "+ARCHE[CHA,4]
                              M.MONTO=ARCHE[CHA,2]
                              M.MONEDA=XAUSS
                              M.EQUIVALE=PESOS/XACOTIZ
                              M.PAGADA=.F.
                              =AGRABAR("CCL")
                           NEXT
                        ENDIF
                        =IAUD(PER.CODCLI+"-"+STR(TTL,14,2))
                     ENDIF
                     SELE DOC
                     GO M.PUNMAR IN DOC
                     REPL NUMERO WITH M.RECIBO+1
                  ENDIF
               ENDIF
               =RELEWIN("WIN1")
            ELSE
               EXIT
            ENDIF
         ENDDO
      ELSE
         EXIT
      ENDIF
      UNLO IN DOC
   ENDDO                                          && MAIN LOOP
ELSE
   =Iaudi()
ENDIF
=MEN_LIN(BOTOM)
RETURN

*******************************************************************************
*-- Programa: IPAGP.PRG
*-- Fecha   : 08-06-92 11:42am
*-- Version : R. 'EL BATA'
*-- Notas   : INGRESA PAGOS
********************************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
   DO WHILE .T.
      STORE NUL TO RESPUESTA
      IF !empty(ELIEMP("a Ingresar",-1,1))
         DO OPCCP WITH JANNRO
         DO OPCAJ WITH JANNRO
         DO OPCCH WITH JANNRO
         DO WHILE .T.
            STORE NUL TO RESPUESTA
            IF !EMPTY(ELIPRO("",-1,1))
               ELPRO=PRO.PROCOD
               STORE NUL TO HABER,DEBE,PUNTERO,PESOS,DOLARES,GTTL,PNCHE,cheques,FACTURA,m.RECIBO
               store .F. to hayCHEQUES, haycheqmio
               STORE DATE() TO LAFECHA
               cren=2
               =MOVEWIN(cren,NUL,11+cren,79,'WIN1',' Ingresa Cobranza - '+alltrim(PRO.PROVEEDOR)+' ',allt(janname))
               M.COTIZADOL=XACOTIZ
               COLU=25
               @ 1,1 say 'FECHA' COLO SCHE 3
               @ 2,1 SAY 'COTIZACION DEL '+upper(xaus)  COLO SCHE 3
               @ 3,1 SAY 'COMPROBANTE N§ ' COLO SCHE 3
               @ 4,1 say 'GASTO'
               @ 5,1 say upper(xauss) colo sche 3
               @ 6,1 say upper(xadols) colo sche 3
               @ 1,COLU GET LAFECHA MESS 'Fecha de la Operaci¢n - [ESC] para Fin'
               @ 2,COLU get M.COTIZADOL pict "@Z 999,999,999,999.99"
               @ 3,COLU GET m.RECIBO PICT '@z 999999999'
               read
               if !empty(eligas("",4,COLU))
                  m.gastter=left(mix.texto2,11)
                  m.gasdesc=mix.texto1
                  @ 4,COLu get m.gasdesc
                  clea gets
                  @ 5,COLU GET M.PESOS PICT '@Z 99,999,999.99' MESS 'Cobrado en '+xauss+' - [ESC] para Fin'
                  @ 6,COLU GET M.DOLARES PICT '@Z 99,999,999.99' MESS 'Cobrado en '+xadols+'  - [ESC] para Fin'
                  @ 7,1    GET M.hayCHEQUES PICT 'CHEQUES' FUNC '*C' MESS 'Hay Cheques 3ros  - [ESC] para Fin'
                  @ 8,1    GET M.hayCHEQMIO PICT 'CHEQUES PROPIOS' FUNC '*C' MESS 'Hay Cheques Propios  - [ESC] para Fin'
                  @ 8,30   GET m.nada pict "@* OK" DEFA 0 SIZE 1,6
                  READ CYCLE
                  if last()#27
                     STORE NUL TO M.CHEQUES
                     m.haycheques=iif(m.haycheques,elicchp(),.F.)
                     STORE NUL TO M.CHEQUESmio
                     if m.haycheqmio
                        temp=GENTMP()
                        sele caj
                        copy stru to (temp)
                        sele 0
                        use (temp) alias tmp2
                        =ichep(.F.)
                     endif
                     M.GTTL=M.chequesmio+M.cheques+M.PESOS+M.DOLARES*M.COTIZADOL
                     IF !EMPTY(M.GTTL)
                        ACTI WIND WIN1
                        ZOOM WIND WIN1 NORM FROM CREN,NUL TO CREN+15,50
                        m.nada=M.DOLARES * m.cotizadol
                        @ 6,COLU GET m.nada PICT '@Z 99,999,999.99'
                        @ 7,1 say space(50)
                        @ 7,1 SAY 'CHEQUES' COLO SCHE 3
                        @ 8,1 say space(50)
                        @ 8,1 SAY 'CHEQUES PROPIOS' COLO SCHE 3
                        @ 10,1 SAY 'TOTAL' COLO SCHE 3
                        @ 7,COLU GET m.CHEQUES PICT '99,999,999.99'
                        @ 8,COLU GET m.CHEQUESmio PICT '99,999,999.99'
                        @ 10,COLU GET M.GTTL PICT '99,999,999.99'
                        CLEA GETS
                        IF CONFIRMA("el Pago",.f.,12,2)
                           if m.haycheqmio
                              =men_lin("GRABANDO CHEQUES PROPIOS")
                              sele caj
                              append from (dbf('tmp2'))
                              sele tmp2
                              =iaud("CAJ mio"+dtoc(tmp2.fechaop)+" CAJA:"+tmp2.CAJA+" "+tmp2.compr)
                              scan
                                 SCAT MEMV
                                 m.nroche=''
                                 m.pagada=.t.
                                 m.fechave=m.fechaop
                                 m.procod=m.codcli
                                 m.codcli=''
                                 M.DETALLE = "CHEQUE N§"+TMP2.NROCHE
                                 M.COMPRRE = tmp2.compre
                                 M.NUMERORE= tmp2.numere
                                 m.monto=abs(m.monto)
                                 m.equivale=abs(m.equivale)
                                 =Agrabar("CCP")
                                 =iaud("CCP mio"+dtoc(m.fechaop)+" "+m.detalle)
                              ends
                              use
                           endif
                           if m.haycheques
                              =men_lin("GRABANDO CHEQUES TERCEROS")
                              SELE CCH
                              SET ORDER TO TAG CODCLI
                              SELE TMP
                              SCAN FOR !EMPTY(SELECCION)
                                 SCAT MEMV
                                 M.PROCOD  = PRO.PROCOD
                                 M.FECHAOP = M.LAFECHA
                                 M.FECHAVE = TMP.FECHADE
                                 M.DETALLE = "CHEQUE N§"+TMP.NROCHE
                                 STORE '' TO M.NUMERE
                                 m.compr='FACTURA'
                                 M.COMPRRE = "OP"
                                 M.NUMERORE= STR(M.RECIBO)
                                 M.TIPO    = "CH"
                                 M.CUOTA   = NUL
                                 M.PAGADA  = .T.
                                 m.monto=abs(m.monto)
                                 m.equivale=abs(m.equivale)
                                 =AGRABAR("CCP")
                                 =iaud("CCP pro"+dtoc(m.fechaop)+" "+m.detalle)
                                 SELE CCH
                                 IF SEEK(TMP.CODCLI)
                                    SCAN WHILE CODCLI=TMP.CODCLI
                                       IF EQ_REG("CCH","TMP")
                                          REPL ENTREGADO WITH .T.
                                          REPL gasto     WITH m.gastter
                                          repl procod    with pro.procod
                                          repl fechasal  with m.lafecha
                                          =repuse()
                                          EXIT
                                       ENDIF
                                    ENDS
                                 ENDIF
                                 SELE TMP
                              ENDSCAN
                           endif
                           =men_lin("GRABANDO EN CUENTA CORRIENTE")
                           TTL=GTTL
                           STORE '' TO M.NROCHE, M.PROCOD, M.BANCO
                           STORE PRO.PROCOD TO M.CODCLI
                           STORE .T. TO M.PROVEEDOR
                           STORE M.LAFECHA TO M.FECHAOP, M.FECHAVE
                           store STR(M.RECIBO) to M.NUMERORE, M.NUMERE
                           m.compr='FACTURA'
                           M.COMPRRE="OP"
                           M.CAJA="00"
                           M.PAGADA=.T.
                           m.compre='FA'
                           IF !EMPTY(PESOS)
                              M.DETALLE="PAGO EN EFVO. "+UPPER(XAUSS)
                              M.MONTO=PESOS
                              M.MONEDA=XAUSS
                              M.EQUIVALE=PESOS/M.COTIZADOL
                              =AGRABAR("CCP")
                                 m.monto=-(m.monto)
                                 m.equivale=-(m.equivale)
                              =AGRABAR("CAJ")
                              =iaud("CCP "+dtoc(m.fechaop)+" "+m.detalle)
                              =iaud("CAJ "+dtoc(m.fechaop)+" CAJA:"+m.CAJA+" "+m.compr)
                           ENDIF
                           IF !EMPTY(DOLARES)
                              M.DETALLE="PAGO EN EFVO. "+UPPER(XADOLS)
                              M.MONTO = DOLARES * m.cotizadol
                              M.MONEDA=XADOLS
                              M.EQUIVALE = DOLARES
                              =AGRABAR("CCP")
                                 m.monto=-(m.monto)
                                 m.equivale=-(m.equivale)
                              =AGRABAR("CAJ")
                              =iaud("CCP "+dtoc(m.fechaop)+" "+m.detalle)
                              =iaud("CAJ "+dtoc(m.fechaop)+" CAJA:"+m.CAJA+" "+m.compr)
                           ENDIF
                        ENDIF
                     ENDIF
                     if m.haycheques
                        SELE TMP
                        USE
                     endif
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
      if cant_empre=1
      exit
      endif
   ENDDO
ELSE
   =Iaudi()
ENDIF
=MEN_LIN(BOTOM)
RETURN

*********************************************************************************
*-- Programa: ICRE3.PRG
*-- Fecha   : 05-24-92 11:05am
*-- Versi¢n : G. REINER
*-- Notas   : DEVOLUCION PARCIAL FACTURA
*-- Modificaci¢n GOYO 05-25-92 12:49pm
*-- VERSION NOVOGAR
*-- Modificaciones varias/ Goyo 11/9/96
********************************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
=CHEQSEG()
   =MEN_LIN("FACTURA A ANULAR")
   IF ELIFAC()
      IF FAC.CODCLI#"ANULADA"
         =MFAC(.T.)
         IF CONFIRMA('Anular la Factura',.t.,20,0)
            PAANULAR=FAC.FACTURA
            =RELEWIN("WIN")
            ESA=(ALLTRIM(LEFT(FAC.FACTURA,1))='A')
            M.PUNMAR=(JANNRO-1)*20+IIF(ESA,1,2)
            GO M.PUNMAR IN DOC
            m.factur=doc.numero
            store date() to emis
            =movewin(10,10,15,60,'win',' Datos de la Nota de Cr‚dito ')
            @ 1,1 say 'N§ NOTA DE CREDITO' GET M.FACTUR PICT '9999999999' MESS 'N£mero de Nota de Cr‚dito'
            @ 2,1 say 'FECHA DE EMISION    ' GET EMIS
            READ
            IF LAST()#27 .AND. !EMPTY(M.FACTUR) .and. emis>=fac.fECHAEM
               M.FACTUR=Q_FAC(LEFT(ALLTRIM(M.PAANULAR),1)+SUCU+'-'+ALLTRIM(STR(M.FACTUR)))
               @ 1,1 say 'N§ NOTA DE CREDITO' GET M.FACTUR
               CLEA GETS
               SELE FAC
               SCAT MEMV
               IF !XSEEK(M.FACTUR,'FAC','FACTURA')
                  =MEN_LIN("GENERANDO NOTA DE CREDITO")
                  tmp=GENTMP()
                  sele FAX
                  =afield(ARRGL)
                  largor=alen(ARRGL,1)+1
                  dime ARRGL[largor,4]
                  ARRGL[largor,1]='DEVOL'
                  ARRGL[largor,2]='N'
                  ARRGL[largor,3]=10
                  ARRGL[largor,4]=0
                  sele 25
                  if !empty(dbf())
                     USE
                  endif
                  create table (TMP) from array ARRGL
                  rele arrgl
                  use
                  sele 25
                  use (tmp) alias tmp EXCL
                  appe from (PATHVEN+'\FACTUdAt') for FACTURA=m.paanular
                  =men_lin('[ESC] para Men£')
                  if recc()<20
                     DEFI WIND WIN FROM 0,0 TO recc()+3,79 TITL ' Nota de Cr‚dito N§ '+IIF(TYPE("M.FACTUR")="C",M.FACTUR,alltrim(str(m.factur)))+' / Sobre Factura N§ '+IIF(TYPE("M.PAANULAR")='C',m.paanular,ALLTRIM(STR(M.PAANULAR))+' ') SHAD COLO SCHE 3
                     =CENTWIN("WIN")
                  else
                     =win0()
                  endif
                  brow fiel ARTICULO:R,;
                    GRAVADO:R:P="99,999.99":H="P. UNITARIO",;
                    cantidad:R:P="99999.99":H="Cantidad",;
                    devol:P="99999.99":H="a Devolver":F:V=devol<=cantidad .and. devol>=0:E="No puede devolver m s de lo que compr¢",;
                    resto=cantidad-devol:R:P="99999.99":H="Resto",;
                    total=devol*GRAVADO:R:P="99,999.99":H="Monto N. CRED.";
                    freeze devol;
                    in wind win;
                    NOCLEAR
                  SUM DEVOL*GRAVADO TO TTL
                  if !EMPTY(TTL)
                     IF CONFIRMA('la Nota de Cr‚dito',.t.,18,0)
                        =MEN_LIN("GRABANDO LOS DATOS")
                        DELE FOR EMPTY(DEVOL)
                        PACK
                        REPL ALL FACTURA WITH M.FACTUR
                        REPL ALL CANTIDAD WITH 0-DEVOL
                        M.ELNUMDOC=M.FACTUR
                        SELE FAX
                        APPE FROM DBF("TMP")
                        SELE TMP
                        SCAN
                           M.fechaop=M.EMIS
                           M.articulo=ALLTRIM(TMP.ARTICULO)
                           M.cliente=M.CODCLI
                           M.opk='0D'
                           M.detalle="DEVOL. PARCIAL FACTURA"
                           M.SALIDA=NUL
                           M.ENTRADa=TMP.DEVOL
                           M.docref="NC"
                           M.nrodocref=m.factur
                           =AGRABAR("KAR")
                           SELE TMP
                           if xseek(M.articulo,'MER','articulo')
                              sele MER
                              =lock() .or. lok(str(recno("mer")),"mer")
                              REPL mer.stock WITH mer.stock+abs(FAX.cantidad)
                              unlo in mer
                           endif
                           SELE TMP
                        ENDS
                        UNLO IN kar
                        SELE FAC
                        STOR NUL TO M.MONTOIVA,M.MONTOOT2,M.MONTOOT3
                        M.PRETOT=0-TTL
                        stor 1 to sidis,nodis
                        SELE TMP
                        REPL ALL CANTIDAD WITH CANTIDAD
                        CALC SUM(GRAVADO*CANTIDAD),SUM(IVA*CANTIDAD),SUM(NOINS*CANTIDAD) ;
                        TO M.MONTOBRU,M.MONTOIVA,M.MONTOOT2
                        M.MONTOOT3=0
                        M.MONTONET=ROUND(M.MONTOBRU+M.MONTOIVA+M.MONTOOT2+M.MONTOOT3,2)
                        FACTURA=M.FACTUR
                        STORE M.EMIS TO FECHAEM,FECHAVE
                        TIPO='NC'
                        MONTO=0-TTL
                        DESCUENTO=0
                        BLOQUEO=.F.
                        REMITO=""
                        =AGRABAR("FAC")
                        STORE M.EMIS TO FECHAOP,FECHAVE
                        STORE 'DEV. PARC FACTURA N§ '+alltrim(m.PAANULAR) to m.detalle
                        STORE "FA N§ "+ALLTRIM(M.PAANULAR) TO M.COMPR
                        STORE 'NC' TO M.COMPRRE
                        STORE M.ELNUMDOC TO M.NUMERORE
                        STORE ABS(M.MONTONET) TO M.MONTO
                        STORE ABS(M.MONTONET/M.COTIZ) TO M.EQUIVALE
                        STORE 0 TO M.CUOTA
                        STORE .F. TO M.MARCA
                        STORE .T. TO M.PAGADA
                        M.COD_OPER=GETCOPER("3")                        
                        =AGRABAR("CCL")
                        =IMPU_NRE(PER.CODCLI,M.MONTO,M.PAANULAR)
                        =SAVDOC(PUNMAR,val(right(M.FACTURA,8)))
                        IF ESA
                           DO lfaciA WITH .F.,.F.,.T.
                        ELSE
                           DO lfaciB WITH .F.,.F.,.T.
                        ENDIF
                     ENDIF
                  endif
               endif
            ELSE
               DO Cartel2 WITH "LA NOTA DE CREDITO "+;
                 IIF(TYPE("M.FACTUR")="C",M.FACTUR,STR(m.factur)),;
                 "CORRESPONDE A UNA ","YA EXISTENTE",""
            ENDIF
         ENDIF
         =RELEWIN("WIN")
      ELSE
         =CARTEL("LA FACTURA HA SIDO ANULADA",;
           "EL DIA "+DTOC(FAC.FECHA),;
           "ES IMPOSIBLE VERLA",;
           "PULSE [ENTER] PARA CONTINUAR")
      ENDIF
   ENDIF
RETURN MEN_LIN(BOTOM)

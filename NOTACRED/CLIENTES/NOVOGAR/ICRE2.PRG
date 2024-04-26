******************************************
*-- Programa: ICRE2.PRG
*-- Fecha   : 05-22-92 02:58am
*-- Versi¢n : G. REINER
*-- Notas   : DEVOLUCION COMPLETA FACTURA
*-- Modificaciones varias / GOYO 11-6-96
******************************************
PRIV FAXT
STORE HORA_ULP(PROGRAM()) TO ULPR
=CHEQSEG()
   =MEN_LIN("FACTURA A ANULAR")
   IF ELIFAC()
      IF FAC.CODCLI#"ANULADA"
         DO MFAC WITH .T.
         IF CONFIRMA('Anular la Factura',.t.,20,0)
            ESA=(ALLTRIM(LEFT(FAC.FACTURA,1))='A')
            PAANULAR=FAC.FACTURA
            =RELEWIN("WIN")
            M.PUNMAR=(JANNRO-1)*20+IIF(ESA,1,2)
            GO M.PUNMAR IN DOC
            M.FACTUR=DOC.NUMERO
            STORE DATE() TO EMIS
            =MOVEWIN(10,10,15,60,'WIN',' Datos de la Nota de Cr‚dito ')
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
                  =FLOCK() .OR. FLOK("FAC")
                  INSERT INTO FAC FROM MEMV
                  repl factura with m.factur
                  repl fechaem with emis,fechave with emis
                  repl monto with 0-M.monto
                  repl descuento with 0-M.descuento
                  repl montobru with 0-M.montobru
                  repl montoiva with 0-M.montoiva
                  repl montoot2 with 0-M.montoot2
                  repl montoot3 with 0-M.montoot3
                  repl montonet with 0-M.montonet
                  =REPUSE()
                  REPL TIPO WITH 'NC'
                  UNLO IN FAC
                  STORE M.EMIS TO FECHAOP,FECHAVE
                  STORE 'DEV. TOTAL FACTURA N§ '+IIF(TYPE("M.PAANULAR")="C",M.PAANULAR,alltrim(str(m.PAANULAR))) to m.detalle
                  STORE "FA N§ "+IIF(TYPE("M.PAANULAR")="C",M.PAANULAR,ALLTRIM(STR(M.PAANULAR))) TO M.COMPR
                  STORE 'NC' TO M.COMPRRE
                  STORE M.FACTUR TO M.NUMERORE
                  STORE M.MONTONET TO M.MONTO
                  STORE M.MONTONET/M.COTIZ TO M.EQUIVALE
                  STORE .T. TO M.PAGADA
                  M.COD_OPER=GETCOPER("2")                  
                  =AGRABAR("CCL")
                  =IMPU_NRE(PER.CODCLI,M.MONTO,M.PAANULAR)
                  SELE fax
                  seek(m.PAANULAR)
                  posok=recno()
                  =flock() .or. flok()
                  TMP=GENTMP()
                  copy to (TMP) while factura=M.PAANULAR
                  SELE 0
                  USE (TMP)
                  REPL ALL FACTURA WITH M.FACTUR ;
                    CANTIDAD WITH 0-CANTIDAD
                  USE
                  SELE FAX
                  APPE FROM (TMP)
                  UNLO IN FAX
                  SELE KAR
                  SCAT MEMV BLAN
                     M.FECHAOP=M.EMIS
                     M.CLIENTE=M.CODCLI
                     M.OPK='0D'
                     M.DETALLE="DEVOL. FACTURA COMPLETA"
                     M.SALIDA=NUL
                     M.TIPO="NC"
                     M.FACTURA=FAC.FACTURA
                  SELE FAX
                  GO POSOK
                  SCAN WHIL FAX.FACTURA=M.PAANULAR
                     NACANTI=FAX.CANTIDAD
                     BUSCAR=ALLTRIM(FAX.ARTICULO)
                     M.ARTICULO=BUSCAR
                     M.ENTRADA=FAX.CANTIDAD
                     =AGRABAR("KAR")
                     IF XSEEK(BUSCAR,'MER','ARTICULO')
                        SELE MER
                        IF LOCK() .OR. LOK(STR(RECNO("MER")),"MER")
                           REPL MER.STOCK WITH MER.STOCK+ABS(FAX.CANTIDAD)
                        ENDIF
                        UNLO IN MER
                     ENDIF
                     SELE FAX
                  ENDS
                  =SAVDOC(M.PUNMAR,VAL(RIGHT(M.FACTURA,8)))
                  =RELEWIN("WIN")
                  =IIF(ESA,LFACIA(.F.,.F.,.T.),LFACIB(.F.,.F.,.T.))
               ELSE
                  =Cartel2("LA NOTA DE CREDITO "+;
                    IIF(TYPE("M.FACTUR")="C",M.FACTUR,STR(m.factur)),;
                    "CORRESPONDE A UNA ","YA EXISTENTE","")
                  =RELEWIN("WIN")
               ENDIF
            ELSE
               =RELEWIN("WIN")
            ENDIF
         ELSE
            =RELEWIN("WIN")
         ENDIF
      ELSE
         =CARTEL("LA FACTURA HA SIDO ANULADA",;
           "EL DIA "+DTOC(FAC.FECHA),;
           "ES IMPOSIBLE VERLA",;
           "PULSE [ENTER] PARA CONTINUAR")
      ENDIF
ENDIF
RETURN MEN_LIN(BOTOM)
